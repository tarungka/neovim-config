return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
        "lukas-reineke/cmp-under-comparator",
    },
    config = function()
        -- Load cmp settings
        local status_cmp, cmp = pcall(require, "cmp")
        if status_cmp then
            local status_luasnip, luasnip = pcall(require, "luasnip")
            if not status_luasnip then
                vim.notify(
                    "LuaSnip not found, completion might not work properly",
                    vim.log.levels.WARN
                )
                return
            end

            -- Load snippets from friendly-snippets
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        elseif vim.fn.col(".") > 1 then
                            vim.api.nvim_feedkeys(
                                vim.api.nvim_replace_termcodes("<Tab>", true, true, true),
                                "n",
                                true
                            )
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                }),
                sorting = {
                    comparators = {
                        cmp.config.compare.offset,
                        cmp.config.compare.exact,
                        cmp.config.compare.score,
                        require("cmp-under-comparator").under,
                        cmp.config.compare.kind,
                        cmp.config.compare.sort_text,
                        cmp.config.compare.length,
                        cmp.config.compare.order,
                    },
                },
                formatting = {
                    format = function(entry, vim_item)
                        -- Set menu icon source with ASCII characters
                        vim_item.kind = string.format("%s", vim_item.kind)
                        vim_item.menu = ({
                            nvim_lsp = "[LSP]",
                            luasnip = "[Snip]",
                            buffer = "[Buf]",
                            path = "[Path]",
                        })[entry.source.name]
                        return vim_item
                    end,
                },
                -- Add better completion experience
                completion = {
                    completeopt = "menu,menuone,noinsert",
                    keyword_length = 1,
                },
                -- Add documentation window
                window = {
                    documentation = cmp.config.window.bordered({
                        border = "rounded",
                        winhighlight =
                        "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
                    }),
                    completion = cmp.config.window.bordered({
                        border = "rounded",
                        winhighlight =
                        "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
                    }),
                },
                -- Improve formatting
                -- formatting = {
                --     format = function(entry, vim_item)
                --         -- Kind icons
                --         local kind_icons = {
                --             Text = "",
                --             Method = "",
                --             Function = "",
                --             Constructor = "",
                --             Field = "",
                --             Variable = "",
                --             Class = "ﴯ",
                --             Interface = "",
                --             Module = "",
                --             Property = "ﰠ",
                --             Unit = "",
                --             Value = "",
                --             Enum = "",
                --             Keyword = "",
                --             Snippet = "",
                --             Color = "",
                --             File = "",
                --             Reference = "",
                --             Folder = "",
                --             EnumMember = "",
                --             Constant = "",
                --             Struct = "",
                --             Event = "",
                --             Operator = "",
                --             TypeParameter = "",
                --         }
                --         vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
                --         return vim_item
                --     end,
                -- },
            })
        else
            vim.notify("CMP not found, skipping setup", vim.log.levels.WARN)
        end


        -- Command line completion
        require("tarun.cmp.cmdline")()
    end,
}
