local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git", "clone", "--depth", "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer.. Close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever this file is saved
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]


-- Use a protected call so we don't error out on first use
local success, packer = pcall(require, "packer")
if not success then
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

-- Plugins
return packer.startup(function(use)
    use "wbthomason/packer.nvim"                -- Have packer manage itself
    use "nvim-lua/popup.nvim"                   -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim"                 -- Useful lua library

    -- cmp
    use "hrsh7th/nvim-cmp"                      -- The main completion plugin
    use "hrsh7th/cmp-buffer"                    -- buffer completions
    use "hrsh7th/cmp-path"                      -- path completions
    use "hrsh7th/cmp-cmdline"                   -- cmdline completions
    use "saadparwaiz1/cmp_luasnip"              -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"

    -- snippets
    use "L3MON4D3/LuaSnip"                      -- snippet engine
    use "rafamadriz/friendly-snippets"          -- collection of core snippets

    -- LSP
    use "neovim/nvim-lspconfig"                 -- enable LSP
    use "williamboman/nvim-lsp-installer"       -- LSP installer

    -- Treesitter
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

    -- Telescope
    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-media-files.nvim"

    -- colorscheme
    use { "catppuccin/nvim", as = "catppuccin" }

    -- Automatically setup after bootstrap
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
