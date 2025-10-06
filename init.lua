--------------------------------------------------
-- BOOTSTRAP & PLUGIN MANAGEMENT
--------------------------------------------------
-- Redirect XDG cache inside the config directory to guarantee write access
if not vim.env.XDG_CACHE_HOME or vim.env.XDG_CACHE_HOME == '' then
    vim.env.XDG_CACHE_HOME = vim.fn.stdpath('config') .. '/.cache'
end
if not vim.env.XDG_STATE_HOME or vim.env.XDG_STATE_HOME == '' then
    vim.env.XDG_STATE_HOME = vim.fn.stdpath('config') .. '/.local-state'
end
if not vim.env.XDG_DATA_HOME or vim.env.XDG_DATA_HOME == '' then
    vim.env.XDG_DATA_HOME = vim.fn.stdpath('config') .. '/.local-share'
end

vim.fn.mkdir(vim.env.XDG_CACHE_HOME .. '/nvim/luac', 'p')
vim.fn.mkdir(vim.env.XDG_STATE_HOME .. '/nvim/shada', 'p')
vim.fn.mkdir(vim.env.XDG_DATA_HOME .. '/nvim', 'p')

-- Disable bytecode caching; this environment cannot write to the default cache
if vim.loader and vim.loader.enable then
    vim.loader.enable(false)
end

-- Bootstrap lazy.nvim if not installed
local data_root = vim.fn.stdpath('data')
local data_lazy_dir = data_root .. '/lazy'
local fallback_lazy_dir = vim.fn.expand('~/.local/share/nvim/lazy')
if not vim.loop.fs_stat(data_lazy_dir) and vim.loop.fs_stat(fallback_lazy_dir) then
    vim.fn.system({ 'cp', '-a', fallback_lazy_dir, data_root })
end
local data_mason_dir = data_root .. '/mason'
local fallback_mason_dir = vim.fn.expand('~/.local/share/nvim/mason')
if not vim.loop.fs_stat(data_mason_dir) and vim.loop.fs_stat(fallback_mason_dir) then
    vim.fn.system({ 'cp', '-a', fallback_mason_dir, data_root })
end
vim.fn.mkdir(data_lazy_dir, 'p')

local lazypath = data_lazy_dir .. '/lazy.nvim'
local fallback_lazypath = fallback_lazy_dir .. '/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        lazypath,
    })
    if vim.v.shell_error ~= 0 and vim.loop.fs_stat(fallback_lazypath) then
        vim.fn.system({ 'cp', '-a', fallback_lazypath, lazypath })
    end
end
if not vim.loop.fs_stat(lazypath) and vim.loop.fs_stat(fallback_lazypath) then
    lazypath = fallback_lazypath
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
require("tarun.keymaps").setup()

--------------------------------------------------
-- LSP CONFIGURATION
--------------------------------------------------
-- NOTE: LSP is now configured via lazy.nvim in lua/tarun/lazy.lua
-- to ensure lspconfig plugin is loaded first

--------------------------------------------------
-- NVIM-TREE CONFIGURATION
--------------------------------------------------
require("tarun.nvimtree")

--------------------------------------------------
-- DEVICONS CONFIGURATION
--------------------------------------------------
require("tarun.icons")

--------------------------------------------------
-- HEALTH CHECK FOR DEPENDENCIES
--------------------------------------------------
-- Check for missing dependencies on startup
require("tarun.health").check_dependencies()
