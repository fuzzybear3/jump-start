
-- -- Set <space> as the leader key
-- vim.g.mapleader = ' '
-- vim.g.maplocalleader = ' '


local map = vim.keymap.set  -- Shortcut for setting keymaps
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




vim.api.nvim_set_keymap("n", "<leader>r", ":lua ReloadConfig()<CR>", { noremap = true, silent = true })

map('n', '<leader>e', ':Neotree filesystem reveal left<CR>')
