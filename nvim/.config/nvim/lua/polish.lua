-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Auto resize split when window os resized
vim.api.nvim_create_autocmd("VimResized", { command = "wincmd =" })

-- Set markdown for octo files
vim.treesitter.language.register("markdown", "octo")

-- Add new mappings using hop
local hop = require "hop"
local directions = require("hop.hint").HintDirection

vim.keymap.set(
  "",
  "f",
  function() hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true } end,
  { remap = true }
)

vim.keymap.set(
  "",
  "F",
  function() hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true } end,
  { remap = true }
)

vim.keymap.set(
  "",
  "t",
  function() hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 } end,
  { remap = true }
)

vim.keymap.set(
  "",
  "T",
  function() hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 } end,
  { remap = true }
)
