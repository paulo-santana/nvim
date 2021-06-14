local nvimLSP = require'lspconfig'
require'lsp_signature'.on_attach({
	use_lspsaga = false
})

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  --buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  --buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
        "hi LspReferenceRead cterm=bold ctermfg=black ctermbg=red guibg=#3E4451
        "hi LspReferenceText cterm=bold guibg=#23272E
        "hi LspReferenceWrite cterm=bold ctermfg=White ctermbg=red guibg=#1B1D23
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

-- vim-language-server
nvimLSP.vimls.setup{
  on_attach = on_attach,
}

-- vscode-json-languageserver
nvimLSP.jsonls.setup {
  on_attach = on_attach,
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
      end
    }
  }
}

local system_name = "Linux"
-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
--local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
local sumneko_root_path = '/home/paulo/dev/language-servers/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

--nvimLSP.sumneko_lua.setup {
--  on_attach = on_attach,
--  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
--  settings = {
--    Lua = {
--      runtime = {
--        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--        version = 'LuaJIT',
--        -- Setup your lua path
--        path = vim.split(package.path, ';'),
--      },
--      diagnostics = {
--        -- Get the language server to recognize the `vim` global
--        globals = {'vim', 'awesome'},
--      },
--      workspace = {
--        -- Make the server aware of Neovim runtime files
--        library = {
--          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
--          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
--        },
--      },
--    },
--  },
--}

-- To get builtin LSP running, do something like:
-- NOTE: This replaces the calls where you would have before done `require('nvim_lsp').sumneko_lua.setup()`
require('nlua.lsp.nvim').setup(nvimLSP, {
  on_attach = on_attach,

  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  -- Include globals you want to tell the LSP are real :)
  globals = {
    -- Colorbuddy
    "Color", "c", "Group", "g", "s",
  },
  settings = {
	  Lua = {
		  workspace = {
			  -- Make the server aware of Neovim runtime files
			  library = {
				  [vim.fn.expand('/usr/share/awesome/lib')] = true,
				  [vim.fn.expand('$VIMRUNTIME/lua')] = true,
				  [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
			  },
		  },

	  }
  }
})

-- java setup
if vim.fn.has('nvim-0.5') then
  vim.api.nvim_exec(
    [[
      augroup lsp
        au!
        au FileType java lua require('jdtls').start_or_attach({cmd = {'start-java-language-server.sh'}})
      augroup end
    ]]
  , false)
end

-- c/c++ setup
nvimLSP.clangd.setup{
  on_attach = on_attach,
}

nvimLSP.vimls.setup{
  on_attach = on_attach,
}

nvimLSP.tsserver.setup{
  on_attach = on_attach,
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    root_dir = nvimLSP.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
}
