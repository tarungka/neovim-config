-- Mason setup (package manager for LSP servers)
local status_mason, mason = pcall(require, "mason")
if status_mason then
    mason.setup({
        ui = {
            icons = {
                package_installed = "[+]",
                package_pending = "[~]",
                package_uninstalled = "[-]",
            },
        },
    })
else
    vim.notify("Mason not found, skipping setup", vim.log.levels.WARN)
end

-- Mason-lspconfig setup
local status_mason_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")
if status_mason_lspconfig then
    mason_lspconfig.setup({
        ensure_installed = { "pyright", "gopls", "ts_ls", "lua_ls" },
    })
else
    vim.notify("Mason-lspconfig not found, skipping setup", vim.log.levels.WARN)
end

-- Mason-nvim-dap setup
local status_mason_dap, mason_dap = pcall(require, "mason-nvim-dap")
if status_mason_dap then
    mason_dap.setup({
        ensure_installed = {
            "python",           -- Python debug adapter
            "delve",            -- Go debug adapter
            "js-debug-adapter", -- JavaScript/TypeScript debug adapter
        },
        automatic_installation = true,
    })
else
    vim.notify("Mason-nvim-dap not found, skipping setup", vim.log.levels.WARN)
end

-- LSP server configurations
local status_lspconfig, lspconfig = pcall(require, "lspconfig")
if status_lspconfig then
    -- Add capabilities for better completion support
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    -- Common LSP setup function
    local function setup_lsp(server, config)
        config = config or {}
        config.capabilities = capabilities
        config.on_attach = function(client, bufnr)
            -- Enable completion triggered by <c-x><c-o>
            vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        end
        lspconfig[server].setup(config)
    end

    -- Setup servers with enhanced configurations
    setup_lsp("gopls", {
        settings = {
            gopls = {
                analyses = {
                    unusedparams = true,
                    shadow = true,
                },
                staticcheck = true,
                gofumpt = true,
            },
        },
    })

    -- TypeScript LSP setup
    lspconfig.ts_ls.setup({
        settings = {
            typescript = {
                inlayHints = {
                    includeInlayParameterNameHints = "all",
                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHints = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true,
                },
            },
            javascript = {
                inlayHints = {
                    includeInlayParameterNameHints = "all",
                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayVariableTypeHints = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayEnumMemberValueHints = true,
                },
            },
        },
    })

    -- Python LSP setup
    lspconfig.pyright.setup({
        settings = {
            python = {
                analysis = {
                    typeCheckingMode = "basic",
                    autoSearchPaths = true,
                    useLibraryCodeForTypes = true,
                },
            },
        },
    })

    -- Lua LSP setup
    lspconfig.lua_ls.setup({
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false,
                },
                telemetry = {
                    enable = false,
                },
            },
        },
    })
else
    vim.notify("LSP config not found, skipping setup", vim.log.levels.WARN)
end

-- Float diagnostic on cursor hold
vim.api.nvim_create_autocmd("CursorHold", {
    pattern = "*",
    callback = function()
        vim.diagnostic.open_float(nil, { focusable = false, border = "rounded" })
    end,
})

-- Configure diagnostics
vim.diagnostic.config({
    virtual_text = {
        prefix = '●', -- Could be '■', '▎', 'x'
        spacing = 4,
        source = "always",
    },
    float = {
        source = "always",
        border = "rounded",
        header = "",
        prefix = "",
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

-- Customize diagnostic signs with simple characters
local signs = { Error = "E", Warn = "W", Hint = "H", Info = "I" }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
