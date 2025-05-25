-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
  { "tpope/vim-fugitive", lazy = false },
  {
    "pwntester/octo.nvim",
    lazy = false,
    config = function()
      require("octo").setup {
        default_remote = { "upstream", "origin" },
        suppress_missing_scope = { projects_v2 = true },
        picker = "snacks"
      }
    end,
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          opts.mappings.n["<Leader>gol"] = { "<cmd>Octo pr list<cr>" }
          opts.mappings.n["<Leader>gos"] = { "<cmd>Octo review start<cr>" }
          opts.mappings.n["<Leader>gov"] = { "<cmd>Octo review submit<cr>" }
          opts.mappings.n["<Leader>god"] = { "<cmd>Octo review discard<cr>" }
          opts.mappings.n["<Leader>gor"] = { "<cmd>Octo review resume<cr>" }
          opts.mappings.n["<Leader>goc"] = { "<cmd>Octo review commit<cr>" }
        end
      },
    }
  },
}
