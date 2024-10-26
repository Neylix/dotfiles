---@type LazySpec
return {
  {
    "phaazon/hop.nvim",
    config = function() require("hop").setup() end,
    event = "User AstroFile",
  },
}
