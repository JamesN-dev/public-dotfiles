return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function ()
    vim.o.timeout = true
    vim.o.timeoutlen = 0
  end,
  opts = {
    -- your configuration goes here
    -- or leave it black for default settings
    -- refer to configuration section
  },
}
