local success, configs = pcall(require, "nvim-treesitter.configs")
if not success then
    vim.notify("Unable to load treesitter configuration...")
    return
end

configs.setup {
    ensure_installed = {
        "bash",
        "c",
        "commonlisp",
        "cpp",
        "fish",
        "go",
        "haskell",
        "html",
        "http",
        "java",
        "javascript",
        "json",
        "json5",
        "llvm",
        "lua",
        "make",
        "markdown",
        "ninja",
        "perl",
        "php",
        "python",
        "r",
        "rust",
        "scheme",
        "solidity",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "yaml",
    }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    sync_install = true, -- install languages synchronously (only applied to `ensure_installed`)
    ignore_install = { "" }, -- list of parsers to ignore installing
    highlight = {
        enable = true, -- false will disable whole extension
        disable = { "" }, -- list of languages that will be disabled
        additional_vim_regex_highlighting = true,
    },
    -- indent = { enable = true, disable = { "yaml" } },
    rainbow = {
        enable = true,
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than N (int) lines
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
}
