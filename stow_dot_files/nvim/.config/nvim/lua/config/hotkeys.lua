-- -- Set <space> as the leader key
-- vim.g.mapleader = ' '
-- vim.g.maplocalleader = ' '

local map = vim.keymap.set -- Shortcut for setting keymaps
local opts = { noremap = true, silent = true }

-- File Explorer (nvim-tree)
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Save file
map("n", "<leader>w", ":w<CR>", opts)

-- Close file
map("n", "<leader>q", ":q<CR>", opts)

-- Close all buffers
map("n", "<leader>Q", ":qa<CR>", opts)

-- Search and replace (replace "word" with "replacement" in file)
map("n", "<leader>sr", ":%s/word/replacement/gc<CR>", opts)

-- Toggle LSP diagnostics
map("n", "<leader>d", ":lua vim.diagnostic.open_float()<CR>", opts)

-- Telescope (fuzzy finder)
-- map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
-- map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
-- map("n", "<leader>fb", ":Telescope buffers<CR>", opts)
-- map("n", "<leader>fh", ":Telescope help_tags<CR>", opts)

-- Commenting
-- -- Normal mode binding
-- vim.api.nvim_set_keymap(
-- 	"n",
-- 	"<leader>c",
-- 	":lua require('Comment.api').toggle_current_line()<CR>",
-- 	{ noremap = true, silent = true }
-- )
--
-- -- Visual mode binding
-- vim.api.nvim_set_keymap(
-- 	"v",
-- 	"<leader>c",
-- 	":lua require('Comment.api').toggle_current_block()<CR>",
-- 	{ noremap = true, silent = true }
-- )

-- map("n", "<leader>/", ":gcc<CR>", opts)
-- map("v", "<leader>/", ":gc<CR>", opts)

-- local comment = require "vim._comment"
--
-- -- Normal mode: comment current line
-- vim.keymap.set("n", "<Leader>/", function()
-- 	local line = vim.fn.line "."
-- 	comment.toggle_lines(0, { line, line })
-- end, { desc = "Toggle comment for current line" })

-- vim.keymap.set({ "n", "x", "o" }, "<Leader>c", "gcc", { remap = true })

-- vim.keymap.set("n", "<Leader>/", "gcc", { remap = true })

vim.keymap.set(
	"n",
	"<Leader>/",
	function() vim.api.nvim_feedkeys("gcc", "n", false) end,
	{ desc = "Toggle comment (line)" }
)

vim.keymap.set("v", "<Leader>/", "gc", { remap = true }) -- visual line comment

vim.api.nvim_set_keymap("n", "<leader>r", ":lua ReloadConfig()<CR>", { noremap = true, silent = true })

map("n", "<leader>e", ":Neotree filesystem reveal left<CR>")
