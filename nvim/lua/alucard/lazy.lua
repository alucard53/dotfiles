-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
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

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        {
            'nvim-telescope/telescope.nvim',
            -- or                            , branch = '0.1.x',
            dependencies = { { 'nvim-lua/plenary.nvim' } }
        },

        { 'nvim-treesitter/nvim-treesitter' },

        {
            "nvim-treesitter/nvim-treesitter-textobjects",
            dependencies = "nvim-treesitter/nvim-treesitter",
        },

        { 'ThePrimeagen/harpoon' },

        {
            'VonHeikemen/lsp-zero.nvim',
            dependencies = {
                -- LSP Support
                { 'neovim/nvim-lspconfig' }, -- Required
                {                            -- Optional
                    'williamboman/mason.nvim',
                    run = function()
                        pcall(vim.cmd, 'MasonUpdate')
                    end,
                },

                { 'williamboman/mason-lspconfig.nvim' }, -- Optional

                -- Autocompletion
                { 'hrsh7th/nvim-cmp' },     -- Required
                { 'hrsh7th/cmp-nvim-lsp' }, -- Required
                { 'L3MON4D3/LuaSnip' },     -- Required
            }
        },

        {
            "windwp/nvim-autopairs",
            config = function() require("nvim-autopairs").setup {} end
        },

        {
            'nvim-lualine/lualine.nvim',
            dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
        },
        { 'Love-Pengy/lillilac.nvim' }
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    -- automatically check for plugin updates
    checker = { enabled = false },
})
