-- NOTE: Mason setup is now in lua/tarun/lazy.lua to ensure proper load order
-- This file only contains LSP server configurations

-- LSP server configurations
local cmp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
local capabilities = vim.lsp.protocol.make_client_capabilities()
if cmp_ok then
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- New Neovim 0.11+ pattern: use LspAttach autocmd instead of on_attach in config
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local bufnr = args.buf
        -- Set omnifunc for LSP completion
        if vim.api.nvim_buf_is_valid(bufnr) then
            vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
        end
        -- Set up LSP keymaps
        require('tarun.keymaps').lsp_keymaps(bufnr)
    end,
})

-- Configure and enable LSP servers
-- nvim-lspconfig provides base configs (cmd, filetypes, root_dir) in lsp/*.lua
-- We only need to add capabilities and custom settings, then enable

-- gopls - Go language server
vim.lsp.config('gopls', {
    capabilities = capabilities,
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
vim.lsp.enable('gopls')

-- ts_ls - TypeScript/JavaScript language server
vim.lsp.config('ts_ls', {
    capabilities = capabilities,
    settings = {
        typescript = {
            inlayHints = {
                includeInlayParameterNameHints = 'all',
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
                includeInlayParameterNameHints = 'all',
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
vim.lsp.enable('ts_ls')

-- pyright - Python language server
vim.lsp.config('pyright', {
    capabilities = capabilities,
    settings = {
        python = {
            analysis = {
                typeCheckingMode = 'basic',
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
            },
        },
    },
})
vim.lsp.enable('pyright')

-- lua_ls - Lua language server
vim.lsp.config('lua_ls', {
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file('', true),
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },
})
vim.lsp.enable('lua_ls')

-- rust_analyzer - Rust language server
vim.lsp.config('rust_analyzer', {
    capabilities = capabilities,
    settings = {
        ['rust-analyzer'] = {
            checkOnSave = {
                command = 'clippy',
            },
            cargo = {
                loadOutDirsFromCheck = true,
            },
            procMacro = {
                enable = true,
            },
        },
    },
})
vim.lsp.enable('rust_analyzer')

-- clangd - C/C++ language server (with custom command args)
vim.lsp.config('clangd', {
    capabilities = capabilities,
    cmd = {
        'clangd',
        '--background-index',
        '--clang-tidy',
        '--header-insertion=iwyu',
        '--completion-style=detailed',
        '--function-arg-placeholders=false',
    },
})
vim.lsp.enable('clangd')

-- Simple servers (no custom settings needed, just add capabilities)
local simple_servers = { 'cssls', 'html', 'jsonls', 'yamlls', 'bashls', 'dockerls', 'tailwindcss' }
for _, server in ipairs(simple_servers) do
    vim.lsp.config(server, { capabilities = capabilities })
    vim.lsp.enable(server)
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
