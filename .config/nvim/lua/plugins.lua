-- Auto-install Packer if not installed
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- Improve startup time with impatient
pcall(require, 'impatient')

-- Helper function for Treesitter update
local function treesitter_update()
    require('nvim-treesitter.install').update({ with_sync = true })
end

-- Initialize Packer
return require('packer').startup({
    function(use)
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'

        -- Performance
        use 'lewis6991/impatient.nvim'

        -- Syntax and highlighting
        use {
            'nvim-treesitter/nvim-treesitter',
            run = treesitter_update,
        }
        use 'norcalli/nvim-colorizer.lua'
        use 'lukas-reineke/indent-blankline.nvim'

        -- Theme
        use 'folke/tokyonight.nvim'

        -- UI enhancements
        use {
            'nvim-lualine/lualine.nvim',
            requires = { 'nvim-tree/nvim-web-devicons' }
        }
        use {
            'akinsho/bufferline.nvim',
            tag = "*",
            requires = 'nvim-tree/nvim-web-devicons'
        }
        use 'nvimdev/dashboard-nvim'
        use {
            'folke/noice.nvim',
            requires = {
                'MunifTanjim/nui.nvim',
                'rcarriga/nvim-notify'
            }
        }

        -- Navigation and search
        use {
            'nvim-telescope/telescope.nvim',
            requires = {
                'nvim-lua/plenary.nvim',
                'nvim-telescope/telescope-file-browser.nvim'
            }
        }

        -- Editor features
        use {
            'numToStr/Comment.nvim',
            requires = {
                'JoosepAlviste/nvim-ts-context-commentstring',
            }
        }
        use 'windwp/nvim-autopairs'

        -- LSP Configuration
        use {
            'neovim/nvim-lspconfig',
            requires = {
                -- LSP management
                'williamboman/mason.nvim',
                'williamboman/mason-lspconfig.nvim',
                'folke/neodev.nvim',

                -- LSP UI enhancements
                'onsails/lspkind.nvim',
                'folke/trouble.nvim',
                'weilbith/nvim-code-action-menu',
                { 'j-hui/fidget.nvim', tag = "legacy" },
                'SmiteshP/nvim-navic',
            }
        }

        -- Completion and snippets
        use {
            'hrsh7th/nvim-cmp',
            requires = {
                'hrsh7th/cmp-nvim-lsp',
                'hrsh7th/cmp-buffer',
                'hrsh7th/cmp-path',
                'hrsh7th/cmp-cmdline',
                'L3MON4D3/LuaSnip',
                'saadparwaiz1/cmp_luasnip',
                'rafamadriz/friendly-snippets',
            }
        }

        -- Git integration
        use 'lewis6991/gitsigns.nvim'

        -- Misc
        use 'voldikss/vim-floaterm'
        use 'github/copilot.vim'

        -- Automatically set up your configuration after cloning packer.nvim
        if packer_bootstrap then
            require('packer').sync()
        end
    end,
    config = {
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'rounded' })
            end
        }
    }
})
