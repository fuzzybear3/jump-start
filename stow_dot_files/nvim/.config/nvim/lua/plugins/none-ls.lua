return {
	-- none-ls setup
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvimtools/none-ls-extras.nvim",
		},
		init = function()
			local null_ls = require "null-ls"

			null_ls.setup {
				sources = {
					-- Formatting
					null_ls.builtins.formatting.stylua, -- Ensure stylua is included here
					-- Add any other sources you'd like
				},
			}

			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
		end,
	},

	-- mason-null-ls setup
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		init = function()
			require("mason-null-ls").setup {
				ensure_installed = { "stylua" }, -- Ensure Stylua is installed automatically
				automatic_installation = true, -- Automatically install if not already
			}
		end,
	},
}

--[[
return {
	{
    "nvimtools/none-ls.nvim",
    dependencies = {
	"nvim-lua/plenary.nvim",
	"nvimtools/none-ls-extras.nvim"
	},
	init = function()
		local null_ls = require("null-ls")

		null_ls.setup({
    			sources = {
        			null_ls.builtins.formatting.stylua,
		 		null_ls.builtins.completion.spell,
        			require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
    			},
		})
	end
	},
	{
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    config = function()
      require("your.null-ls.config") -- require your null-ls config here (example below)
    end,

	init = function()
		ensure_installed = {"stylua"}
	end,
	automatic_installation = true,
}
}
--]]
