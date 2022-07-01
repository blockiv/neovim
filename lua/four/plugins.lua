local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path, })
    print("Installing packer.. Close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever this file is saved
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])

-- Use a protected call so we don't error out on first use
local success, packer = pcall(require, "packer")
if not success then
    return
end

-- Have packer use a popup window
packer.init({
 display = {
  open_fn = function()
      return require("packer.util").float({ border = "rounded" })
  end,
 },
})

-- Plugins
return packer.startup(function(use)
    use("wbthomason/packer.nvim") -- Have packer manage itself
    use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
    use("nvim-lua/plenary.nvim") -- Useful lua library
    use("windwp/nvim-autopairs") -- Autopairs, integrates with cmp and treesitter
    use("numToStr/Comment.nvim") -- Comments
    use("kyazdani42/nvim-web-devicons") -- devicons used in other plugins
    use("kyazdani42/nvim-tree.lua") -- nvim-tree
    use("akinsho/toggleterm.nvim") -- use terminal in neovim
    use("lewis6991/impatient.nvim") -- improve startup times
    use("lukas-reineke/indent-blankline.nvim") -- indentation guides
    use("norcalli/nvim-colorizer.lua")

    -- Dashboard
    use("goolord/alpha-nvim")

    -- bufferline
    use("akinsho/bufferline.nvim")
    use("moll/vim-bbye")

    -- lualine
    use("nvim-lualine/lualine.nvim")

    -- cmp
    use("hrsh7th/nvim-cmp") -- The main completion plugin
    use("hrsh7th/cmp-buffer") -- buffer completions
    use("hrsh7th/cmp-path") -- path completions
    use("hrsh7th/cmp-cmdline") -- cmdline completions
    use("saadparwaiz1/cmp_luasnip") -- snippet completions
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-nvim-lua")

    -- which key
    use("folke/which-key.nvim")

    -- snippets
    use("L3MON4D3/LuaSnip") -- snippet engine
    use("rafamadriz/friendly-snippets") -- collection of core snippets

    -- LSP
    use("neovim/nvim-lspconfig") -- enable LSP
    use("williamboman/nvim-lsp-installer") -- LSP installer
    use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
    use("filipdutescu/renamer.nvim")
    use("ray-x/lsp_signature.nvim")
    use("b0o/SchemaStore.nvim")
    use("simrat39/symbols-outline.nvim")
    use {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
    }

    -- Treesitter
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use("p00f/nvim-ts-rainbow")
    use("JoosepAlviste/nvim-ts-context-commentstring")

    -- Telescope
    use("nvim-telescope/telescope.nvim")
    use("nvim-telescope/telescope-media-files.nvim")

    -- Git
    use("lewis6991/gitsigns.nvim")

    -- colorschemes
    use({ "rose-pine/neovim", as = "rose-pine" })
    use("folke/tokyonight.nvim")
    use("lunarvim/darkplus.nvim")
    use("lunarvim/colorschemes")
    use("lifepillar/vim-solarized8")

    -- Automatically setup after bootstrap
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
