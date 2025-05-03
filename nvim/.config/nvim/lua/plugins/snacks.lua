---@type LazySpec
return {
  "folke/snacks.nvim",
  ---@class snacks.indent.Config
  opts = {
    indent = {
      indent = { char = "┊" },
      scope = { enabled = false }
    },
  },
}
