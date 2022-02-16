local success, _ = pcall(require, "lspconfig")
if not success then
    vim.notify("Unable to load lspconfig...")
    return
end

require("four.lsp.lsp-installer")
require("four.lsp.handlers").setup()
require("four.lsp.null-ls")
