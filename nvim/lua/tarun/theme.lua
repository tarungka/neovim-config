local status_catppuccin, catppuccin = pcall(require, "catppuccin")
if status_catppuccin then
    catppuccin.setup({
        flavour = "auto",
        background = {
            light = "latte",
            dark = "mocha",
        },
        transparent_background = false,
        show_end_of_buffer = false,
        term_colors = false,
        dim_inactive = {
            enabled = false,
            shade = "dark",
            percentage = 0.15,
        },
        no_italic = false,
        no_bold = false,
        no_underline = false,
        styles = {
            comments = { "italic" },
            conditionals = { "italic" },
            loops = {},
            functions = {},
            keywords = {},
            strings = {},
            variables = {},
            numbers = {},
            booleans = {},
            properties = {},
            types = {},
            operators = {},
        },
        color_overrides = {},
        custom_highlights = {},
        default_integrations = true,
        integrations = {
            cmp = true,
            gitsigns = true,
            nvimtree = true,
            treesitter = true,
            notify = false,
            mini = {
                enabled = true,
                indentscope_color = "",
            },
            telescope = true,
            which_key = true,
            dap = {
                enabled = true,
                enable_ui = true,
            },
        },
    })

    vim.cmd.colorscheme("catppuccin")
else
    vim.notify("Catppuccin not found, falling back to default colorscheme", vim.log.levels.WARN)
end
