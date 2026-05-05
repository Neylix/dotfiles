---@type LazySpec
return {
  {
    "smoka7/hop.nvim",
    config = function() require("hop").setup() end,
    event = "User AstroFile",
  },
}
