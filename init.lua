--------------------------------------------------
-- BOOTSTRAP & PLUGIN MANAGEMENT
--------------------------------------------------
-- Bootstrap lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Plugin specification
require("lazy").setup(require("tarun.lazy"), {
    defaults = { lazy = true } --Lazy load all plugins by default
})

--------------------------------------------------
-- BASIC SETTINGS
--------------------------------------------------
local set_options = require("tarun.set")
set_options()

--------------------------------------------------
-- COLOR THEME SCHEME
--------------------------------------------------
require("tarun.theme")

--------------------------------------------------
-- KEYBINDINGS
--------------------------------------------------
-- Set leader key
vim.keymap.set("n", "<Space>", "<Nop>")
vim.g.mapleader = " "

require("tarun.remap")


--------------------------------------------------
-- LSP CONFIGURATION
--------------------------------------------------
require("tarun.lsp")

--------------------------------------------------
-- NVIM-TREE CONFIGURATION
--------------------------------------------------
require("tarun.nvimtree")

--------------------------------------------------
-- DEVICONS CONFIGURATION
--------------------------------------------------
require("tarun.icons")

