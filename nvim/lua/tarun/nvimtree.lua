local status_nvimtree, nvimtree = pcall(require, "nvim-tree")
if status_nvimtree then
    nvimtree.setup({
        view = {
            width = 30,
            side = "left",
            adaptive_size = false,
        },
        renderer = {
            group_empty = true,
            icons = {
                show = {
                    file = true,
                    folder = true,
                    folder_arrow = true,
                    git = true,
                },
                glyphs = {
                    default = "*",
                    symlink = "S",
                    folder = {
                        arrow_closed = ">",
                        arrow_open = "v",
                        default = "+",
                        open = "-",
                        empty = "[]",
                        empty_open = "[]",
                        symlink = "S+",
                        symlink_open = "S-",
                    },
                    git = {
                        unstaged = "!",
                        staged = "✓",
                        unmerged = "U",
                        renamed = "R",
                        untracked = "?",
                        deleted = "D",
                        ignored = "I",
                    },
                },
            },
        },
        filters = {
            dotfiles = false,
            custom = { "^.git$" },
        },
        actions = {
            open_file = {
                window_picker = {
                    enable = false,
                },
                resize_window = true,
            },
        },
        git = {
            enable = true,
            ignore = false,
        },
    })
else
    vim.notify("Nvim-tree not found, skipping setup", vim.log.levels.WARN)
end
