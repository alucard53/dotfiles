vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use({
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter",
    })

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use 'nvim-lua/plenary.nvim' -- don't forget to add this one if you don't have it yet!
    use 'ThePrimeagen/harpoon'

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
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
}

use 'martinsione/darkplus.nvim'
use 'ntk148v/komau.vim'

use 'nvim-tree/nvim-web-devicons'

use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}
end)
