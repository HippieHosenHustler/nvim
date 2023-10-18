local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing Packer. Close and reopen Neovim"
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins .lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't erro out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install plugins here
return packer.startup(function(use)
    use "wbthomason/packer.nvim"    -- Have packer manage itself
    use "nvim-lua/popup.nvim"       -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim"     -- Useful lua functions used by lots of plugins
    use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
    use "kyazdani42/nvim-web-devicons"
    use "kyazdani42/nvim-tree.lua"
    use "numToStr/Comment.nvim" -- Easily comment stuff
    use "akinsho/bufferline.nvim"
    use "moll/vim-bbye"
    use "nvim-lualine/lualine.nvim"
    use "lukas-reineke/indent-blankline.nvim"
    use "goolord/alpha-nvim"
    use "antoinemadec/FixCursorHold.nvim"
    use "folke/which-key.nvim"

    -- Colorschemes
    use "lunarvim/colorschemes"     -- A bunch of colorschemesuse { "catppuccin/nvim", as = "catppuccin" }
    use { "catppuccin/nvim", as = "catppuccin" }

    -- cmp plugins
    use "hrsh7th/nvim-cmp"          -- The completion plugin
    use "hrsh7th/cmp-buffer"        -- buffer completions
    use "hrsh7th/cmp-path"          -- path completions
    use "hrsh7th/cmp-cmdline"       -- snippet completions
    use "saadparwaiz1/cmp_luasnip"  -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"        -- buffer completions
    use "hrsh7th/cmp-nvim-lua"        -- buffer completions
    use "hrsh7th/cmp-nvim-lsp-signature-help"
    use "hrsh7th/cmp-vsnip"
    use "hrsh7th/vim-vsnip"

    -- snippets
    use "L3MON4D3/LuaSnip"          -- snippet engine
    use "rafamadriz/friendly-snippets"  -- a bunch of snippets to use

    -- LSP
    use "neovim/nvim-lspconfig"     -- enable LSP
    use "williamboman/mason.nvim"   -- simple to use language server installer
    use "williamboman/mason-lspconfig.nvim"   -- simple to use language server installer
    use "jose-elias-alvarez/null-ls.nvim"     -- LSP diagnostics and code actions

    -- Rust
    use "neovim/nvim-lspconfig"
    use "simrat39/rust-tools.nvim"

    -- Telescopeuse
    use "nvim-telescope/telescope.nvim"
    use 'nvim-telescope/telescope-media-files.nvim'
    use "NvChad/nvterm"

    -- Treesitter
    use {
     "nvim-treesitter/nvim-treesitter",
     run = ":TSUpdate",
    }
    use "p00f/nvim-ts-rainbow"
    use "nvim-treesitter/playground"

    -- Git
    use "lewis6991/gitsigns.nvim"

    -- Salesforce
    use "beyond-the-cloud-dev/vsc-salesforce-code-snippets"
    use "LeviticusNelson/sfdx.nvim"

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
