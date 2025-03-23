-- lua/theprimeagen/set.lua

local function set_options()
  -- UI settings
  vim.opt.number = true
  vim.opt.relativenumber = true
  vim.opt.termguicolors = true
  vim.opt.cursorline = true
  vim.opt.mouse = "a"
  vim.opt.showcmd = true
  vim.opt.showmode = true
  vim.opt.ruler = true
  vim.opt.cmdheight = 1
  vim.opt.laststatus = 2
  vim.opt.signcolumn = "yes"

  -- Window behavior
  vim.opt.hidden = true
  vim.opt.splitbelow = true
  vim.opt.splitright = true
  vim.opt.scrolloff = 8
  vim.opt.sidescrolloff = 8

  -- Editing behavior
  vim.opt.expandtab = true
  vim.opt.shiftwidth = 4
  vim.opt.tabstop = 4
  vim.opt.softtabstop = 4
  vim.opt.autoindent = true
  vim.opt.smartindent = true
  vim.opt.timeoutlen = 500

  -- **MACOS CLIPBOARD FIX**
  vim.opt.clipboard:append("unnamedplus") -- Preferred, but test first.
  if vim.fn.has("clipboard") then
    vim.opt.clipboard:append("unnamed")
  end

  -- Search behavior
  vim.opt.ignorecase = true
  vim.opt.smartcase = true
  vim.opt.incsearch = true
  vim.opt.hlsearch = true

  -- File behavior
  vim.opt.undofile = false
  vim.opt.backup = false
  vim.opt.backupdir = vim.fn.stdpath("config") .. "/backup/"
  vim.opt.swapfile = false
  vim.opt.directory = vim.fn.stdpath("config") .. "/swap/"

  -- Display behavior
  vim.opt.list = true
  vim.opt.listchars = "tab:»·,trail:·,nbsp:␣"
  vim.opt.wildmode = "longest,list,full"
  vim.o.updatetime = 300

  vim.opt.guicursor = ""
  vim.opt.wrap = false
  -- Changing this because os.getenv is for vimscript and vim.fn is for lua
  vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
  vim.opt.undofile = true

  -- Move configs from init.lua to here
  vim.opt.hlsearch = false
  vim.opt.incsearch = true

  vim.opt.signcolumn = "yes"
  vim.opt.isfname:append("@-@")

  vim.opt.updatetime = 50

  -- vim.opt.colorcolumn = "80"
end

return set_options
