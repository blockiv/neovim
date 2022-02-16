local success, configs = pcall(require, "nvim-treesitter.configs")
if not success then
    vim.notify("Unable to load treesitter configuration...")
    return
end

configs.setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
    ignore_install = { "" }, -- list of parsers to ignore installing
    highlight = {
        enable = true, -- false will disable whole extension
        disable = { "" }, -- list of languages that will be disabled
        additional_vim_regex_highlighting = true,
    },
    indent = { enable = true, disable = { "yaml" } },
}
