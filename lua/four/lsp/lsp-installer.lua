local success, lsp_installer = pcall(require, "nvim-lsp-installer")
if not success then
    return
end


-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = require("four.lsp.handlers").on_attach,
        capabilities = require("four.lsp.handlers").capabilities,
    }

    if server.name == "jsonls" then
        local jsonls_opts = require("four.lsp.providers.jsonls")
        opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
    end

    if server.name == "sumneko_lua" then
        local sumneko_opts = require("four.lsp.providers.sumneko_lua")
        opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    end

    server:setup(opts)
end)
