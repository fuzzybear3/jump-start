-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)

-- Setup lazy.nvim
require("lazy").setup {
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	--  install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
}

function ReloadConfig()
	for name, _ in pairs(package.loaded) do
		if name:match "^config" or name:match "^plugins" then package.loaded[name] = nil end
	end
	dofile(vim.fn.stdpath "config" .. "/init.lua")

	vim.notify("🔥 Config reloaded!", "info", { title = "Neovim" })
	print "🔥 Config reloaded!"
end

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.lua", "*.py", "*.cpp", "*.rs" },
	callback = function()
		local bufnr = vim.api.nvim_get_current_buf()
		local current_content = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false) -- Get current content of the buffer

		-- Perform formatting
		vim.lsp.buf.format { async = false }

		local formatted_content = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false) -- Get content after formatting

		-- If the content is unchanged, prevent writing
		if current_content == formatted_content then
			-- No changes, do not save
			vim.cmd "noautocmd w"
		end
	end,
})

vim.lsp.enable { "rust-analyzer", "luals" }
