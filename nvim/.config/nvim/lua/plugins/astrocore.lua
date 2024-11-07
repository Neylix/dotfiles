-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        wrap = true,
        cmdheight = 1,
        scrolloff = 8,
        sidescrolloff = 8,
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs with `H` and `L`
        L = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        H = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        -- Remap for dealing with word wrap
        k = { "v:count == 0 ? 'gk' : 'k'", expr = true, silent = true },
        j = { "v:count == 0 ? 'gj' : 'j'", expr = true, silent = true },
        -- Do not copy when deletting
        d = { '"_d' },
        x = { '"_x' },
        c = { '"_c' },
        D = { '"_D' },
        X = { '"_X' },
        C = { '"_C' },
        -- Remap to keep cursor on middle of the screen
        ["<C-d>"] = { "<C-d>zz" },
        ["<C-u>"] = { "<C-u>zz" },
        n = { "nzzzv" },
        N = { "Nzzzv" },
        ["<Leader>ff"] = { function() require("telescope.builtin").git_files() end, desc = "Search files" },
        ["<Leader>gol"] = { "<cmd>Octo pr list<cr>" },
        ["<Leader>gos"] = { "<cmd>Octo review start<cr>" },
        ["<Leader>gov"] = { "<cmd>Octo review submit<cr>" },
        ["<Leader>god"] = { "<cmd>Octo review discard<cr>" },
        ["<Leader>gor"] = { "<cmd>Octo review resume<cr>" },
        ["<Leader>goc"] = { "<cmd>Octo review commit<cr>" },
      },
      v = {
        -- Do not copy when deletting
        d = { '"_d' },
        x = { '"_x' },
        c = { '"_c' },
        D = { '"_D' },
        X = { '"_X' },
        C = { '"_C' },
        -- Remap to move highlighted lines
        J = { ":m '>+1<CR>gv=gv" },
        K = { ":m '<-2<CR>gv=gv" },
        ["<Leader>r"] = { '"hy:s/<C-r>h/' },
        ["<Leader>R"] = { '"hy:%s/<C-r>h/' },
      },
      x = {
        -- Do not copy when deletting
        ["p"] = { '"_dP' },
      },
    },
  },
}
