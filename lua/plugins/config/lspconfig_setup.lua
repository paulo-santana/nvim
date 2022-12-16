local ok, lspconfig = pcall(require, "lspconfig")

if not ok then
    error("Could not load lspconfig")
    return
end

local config = require("plugins.config.lspconfig")

local servers = {
    "clangd",
    "tsserver",
    "svelte",
    "rust_analyzer",
}

function table.table_copy(t)
   local t2 = {}
   for k,v in pairs(t) do
      t2[k] = v
   end
   return t2
end

for _, server in ipairs(servers) do
    if server == "clangd" then
        local clangd_capabilities = table.table_copy(config.capabilities)
        -- clangd_capabilities.offsetEncoding = { "utf-16" }
        lspconfig["clangd"].setup {
            capabilities = clangd_capabilities,
            on_attach = config.on_attach,
        }
    else
        lspconfig[server].setup {
            capabilities = config.capabilities,
            on_attach = config.on_attach,
        }
    end
end

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lspconfig["sumneko_lua"].setup {
    capabilities = config.capabilities,
    on_attach = config.on_attach,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = runtime_path,
            },
            diagnostics = {
                globals = {'vim'},
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
}

local css_capabilities = vim.lsp.protocol.make_client_capabilities()
css_capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.cssls.setup({
    capabilities = css_capabilities,
})
