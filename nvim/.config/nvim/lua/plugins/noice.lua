return {
  "folke/noice.nvim",
  opts = function(_, opts)
    local utils = require "astrocore"
    return utils.extend_tbl(opts, {
      presets = {
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
      views = {
        cmdline_popup = {
          position = "50%"
        },
      }
    })
  end,
}
