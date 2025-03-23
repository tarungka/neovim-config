-- lua/theprimeagen/telescope.lua
return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local status_telescope, telescope = pcall(require, "telescope")
    if status_telescope then
      telescope.setup({
        defaults = {
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              preview_width = 0.6,
              width = 0.9,
              height = 0.8,
            },
          },
          mappings = {
            i = {
              ["<C-s>"] = require("telescope.actions").select_horizontal,
              ["<C-v>"] = require("telescope.actions").select_vertical,
              ["<C-t>"] = require("telescope.actions").select_tab,
              ["<Esc>"] = require("telescope.actions").close,
            },
            n = {
              ["<C-s>"] = require("telescope.actions").select_horizontal,
              ["<C-v>"] = require("telescope.actions").select_vertical,
              ["<C-t>"] = require("telescope.actions").select_tab,
            },
          },
          borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
          previewer = true,
          preview_cutoff = 120,
          file_previewer = require("telescope.previewers").vim_buffer_cat.new,
          grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
          file_ignore_patterns = { "node_modules", ".git", "vendor", "__pycache__", "dist" },
        },
        pickers = {
          find_files = {
            previewer = true,
            hidden = true,
          },
          live_grep = {
            additional_args = function()
              return { "--hidden" }
            end,
          },
          extensions = {
            -- Add any telescope extensions here
          },
        },
      })
    else
      vim.notify("Telescope not found, skipping setup", vim.log.levels.WARN)
    end
  end,
}
