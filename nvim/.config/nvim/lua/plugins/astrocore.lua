-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- passed to `vim.filetype.add`
    filetypes = {
      -- see `:h vim.filetype.add` for usage
      extension = {
        foo = "fooscript",
      },
      filename = {
        [".foorc"] = "fooscript",
      },
      pattern = {
        [".*/etc/foo/.*"] = "fooscript",
      },
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = true, -- sets vim.opt.wrap
        cmdheight = 1,
        scrolloff = 8,
        sidescrolloff = 8,
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
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
        -- Picker
        ["<Leader>ff"] = { function() require("snacks.picker").git_files() end, desc = "Search files" },
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
