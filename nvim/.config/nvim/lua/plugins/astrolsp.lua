-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
	{
		"AstroNvim/astrolsp",
		---@type AstroLSPOpts
		opts = {
			config = {
				expert = {
					cmd = { "/home/neylix/.local/share/nvim/mason/bin/expert" },
					root_dir = require("lspconfig.util").root_pattern("mix.exs"),
					filetypes = { 'elixir', 'eelixir', 'heex' },
				}
			},
			formatting = {
				disabled = { -- disable formatting capabilities for the listed language servers
					"prettierd",
					"null-ls",
				},
				filter = function(client)
					if client.name == "prettierd" or client.name == "null-ls" then
						return false
					else
						return true
					end
				end,
			},
			servers = { "expert" }
		},
	},
}
