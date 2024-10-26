-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
  { "tpope/vim-fugitive", lazy = false },
  {
    "pwntester/octo.nvim",
    config = function()
      require("octo").setup {
        default_remote = { "upstream", "origin" },
        suppress_missing_scope = { projects_v2 = true },
      }
    end,
    lazy = false,
  },
}
