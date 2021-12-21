local cmd = vim.cmd

local map = function(mode, lhs, rhs, opt)
    local options = { noremap = true, silent = true }

    if opt then
        options.vim.tbl_extend("force", options, opt)
    end

    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local M = {}

M.telescope = function()
    map('n', '<leader>ff', '<CMD>Telescope find_files<CR>')
    map('n', '<leader>fh', '<CMD>Telescope oldfiles<CR>')
    map('n', '<leader>tc', '<CMD>Telescope colorscheme<CR>')
    map('n', '<leader>fg', '<CMD>Telescope live_grep<CR>')
    map('n', '<leader>fb', '<CMD>Telescope marks<CR>')
end

M.neogit = function()
    map('n', '<leader>g', '<CMD>Neogit<CR>')
end

M.dashboard = function()
    map('n', '<leader>bm', '<CMD>DashboardJumpMarks<CR>')
    map('n', '<leader>fn', '<CMD>DashboardNewFile<CR>')
    map('n', '<leader>db', '<CMD>Dasbhard<CR>')
    map('n', '<leader>sl', '<CMD>SessionLoad<CR>')
    map('n', '<leader>ss', '<CMD>SessionSave<CR>')
end

M.nvimtree = function()
    map("n", '<C-n>', '<CMD>NvimTreeToggle<CR>')
    map("n", '<leader>e', '<CMD>NvimTreeFocus<CR>')
end

M.bufferline = function()
    map("n", '<TAB>', '<CMD>BufferLineCycleNext<CR>')
    map("n", '<S-TAB>', '<CMD>BufferLineCyclePrev<CR>')
end

M.comment = function()
    map("n", "<leader>'", '<CMD>lua require("Comment.api").toggle_current_linewise()<CR>')
    map("x", "<leader>'", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')
end

M.header42 = function()
    map("n", '<F2>', '<CMD>Stdheader<CR>')
end

M.lspconfig = function()
    map("n", "gD", "<CMD>lua vim.lsp.buf.declaration()<CR>")
    map("n", "gd", "<CMD>lua vim.lsp.buf.definition()<CR>")
    map("n", "K", "<CMD>lua vim.lsp.buf.hover()<CR>")
    map("n", "gi", "<CMD>lua vim.lsp.buf.implementation()<CR>")
    map("n", "gk", "<CMD>lua vim.lsp.buf.signature_help()<CR>")
    map("n", "<leader>D", "<CMD>lua vim.lsp.buf.type_definition()<CR>")
    map("n", "<leader>rn", "<CMD>lua vim.lsp.buf.rename()<CR>")
    map("n", "<leader>ca", "<CMD>lua vim.lsp.buf.code_action()<CR>")
    map("n", "<leader>gr", "<CMD>lua vim.lsp.buf.references()<CR>")
    map("n", "]d", "<CMD>lua vim.diagnostic.goto_next()<CR>")
    map("n", "[d", "<CMD>lua vim.diagnostic.goto_prev()<CR>")
end

M.misc = function()
    -- Add Packer commands because we are not loading it at startup
    cmd "silent! command PackerClean lua require 'plugins' require('packer').clean()"
    cmd "silent! command PackerCompile lua require 'plugins' require('packer').compile()"
    cmd "silent! command PackerInstall lua require 'plugins' require('packer').install()"
    cmd "silent! command PackerStatus lua require 'plugins' require('packer').status()"
    cmd "silent! command PackerSync lua require 'plugins' require('packer').sync()"
    cmd "silent! command PackerUpdate lua require 'plugins' require('packer').update()"
end

return M
