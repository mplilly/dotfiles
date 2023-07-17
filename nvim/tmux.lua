local M = {
  "aserowy/tmux.nvim",
  lazy = false,
}

function M.config()
  require("tmux").setup()
end

return M
