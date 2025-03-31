-- local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- if not vim.loop.fs_stat(lazypath) then
--   vim.fn.system({
--     "git", "clone", "--filter=blob:none",
--     "https://github.com/folke/lazy.nvim.git",
--     "--branch=stable", lazypath
--   })
-- end
-- vim.opt.rtp:prepend(lazypath)

-- require("lazy").setup({
--   -- Add plugins here
--   "nvim-treesitter/nvim-treesitter",
--   "neovim/nvim-lspconfig",
--   "hrsh7th/nvim-cmp",
--   "hrsh7th/cmp-nvim-lsp",
--   "nvim-tree/nvim-tree.lua",
--   "nvim-lualine/lualine.nvim",
-- 	{
--     "catppuccin/nvim",
--     name = "catppuccin",
--     priority = 1000
--   }
-- })

-- return {
--     {
--         "Zeioth/hot-reload.nvim",
--         dependencies = "nvim-lua/plenary.nvim",
--         event = "BufEnter",
--         opts = {}
--       }
-- }


return {
    {
        "rcarriga/nvim-notify",
        config = function()
            vim.notify = require("notify")
        end
    },
    {
        "Zeioth/hot-reload.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "rcarriga/nvim-notify" },
        event = "BufEnter",
        opts = {
            notify = true,  -- Enable notifications
        }
    },

  
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
          "MunifTanjim/nui.nvim",
          -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        lazy = false, -- neo-tree will lazily load itself
        ---@module "neo-tree"
        ---@type neotree.Config?
        opts = {
          -- fill any relevant options here
        },
      }
    
}
