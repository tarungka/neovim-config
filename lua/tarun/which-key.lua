return {
  "folke/which-key.nvim",
  event = "VeryLazy", -- Load when needed
  config = function()
    require("which-key").setup({
      -- Delay before showing hints
      plugins = { spelling = true },
      win = { border = "rounded" },
    })
  end
}

