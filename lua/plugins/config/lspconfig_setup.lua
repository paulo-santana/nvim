local ok, lspconfig = pcall(require, "lspconfig")

if not ok then
    error("Could not load lspconfig")
    return
end

local config = require("plugins.config.lspconfig")

local servers = {
    "clangd",
    "tsserver",
}

for _, server in ipairs(servers) do
    lspconfig[server].setup {
        capabilities = config.capabilities,
        on_attach = config.on_attach,
    }
end
