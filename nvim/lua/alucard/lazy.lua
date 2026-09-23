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
    { 'nvim-treesitter/nvim-treesitter' },

    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      dependencies = "nvim-treesitter/nvim-treesitter",
    },

    { 'neovim/nvim-lspconfig' }, -- Required
    {                            -- Optional
      'williamboman/mason.nvim',
      run = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },

    { 'williamboman/mason-lspconfig.nvim' }, -- Optional
    {
      'saghen/blink.cmp',
      -- optional: provides snippets for the snippet source
      dependencies = 'rafamadriz/friendly-snippets',

      -- use a release tag to download pre-built binaries
      version = '*',
      -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
      -- build = 'cargo build --release',
      -- If you use nix, you can build from source using latest nightly rust with:
      -- build = 'nix run .#build-plugin',

      opts = {
        -- 'default' for mappings similar to built-in completion
        -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
        -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
        -- See the full "keymap" documentation for information on defining your own keymap.
        keymap = { preset = 'default' },

        appearance = {
          -- Sets the fallback highlight groups to nvim-cmp's highlight groups
          -- Useful for when your theme doesn't support blink.cmp
          -- Will be removed in a future release
          -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
          -- Adjusts spacing to ensure icons are aligned
          nerd_font_variant = 'mono'
        },

        completion = {
          documentation = { auto_show = true, auto_show_delay_ms = 100 }
        },


        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
          default = { 'lsp', 'path', 'snippets', 'buffer' },
          providers = {
            lsp = { score_offset = 4 },
            path = { score_offset = 3 },
            snippets = { score_offset = 2 },
            buffer = { score_offset = 1 }
          },
        },
      },
      opts_extend = { "sources.default" }
    },

    -- Package name changed from `fff.nvim` to `fff`. If you installed fff.nvim before, clean with `:Lazy clean`
    {
      'dmtrKovalenko/fff',
      build = function()
        -- downloads a prebuilt binary or falls back to cargo build
        require("fff.download").download_or_build_binary()
      end,
      -- for nixos:
      -- build = "nix run .#release",
      opts = {
        debug = {
          enabled = true,
          show_scores = true,
        },
      },
      lazy = false, -- the plugin lazy-initialises itself
      keys = {
        { "<leader>pf", function() require('fff').find_files() end, desc = 'FFFind files' },
        { "<leader>ps", function() require('fff').live_grep() end,  desc = 'LiFFFe grep' },
        {
          "<leader>pz",
          function() require('fff').live_grep({ grep = { modes = { 'fuzzy', 'plain' } } }) end,
          desc = 'Live fffuzy grep',
        },
        {
          "<leader>pw",
          function() require('fff').live_grep_under_cursor() end,
          mode = { 'n', 'x' },
          desc = 'Search current word / selection',
        },
      },
    },

    { 'tpope/vim-fugitive' },

    { 'blazkowolf/gruber-darker.nvim' }
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  -- automatically check for plugin updates
  checker = { enabled = false },
})
