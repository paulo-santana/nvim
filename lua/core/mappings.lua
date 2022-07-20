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
    map('n', '<leader>tt', '<CMD>Telescope<CR>')
    map('n', '<leader>ff', '<CMD>Telescope find_files<CR>')
    map('n', '<leader>fh', '<CMD>Telescope oldfiles<CR>')
    map('n', '<leader>tc', '<CMD>Telescope colorscheme<CR>')
    map('n', '<leader>fg', '<CMD>Telescope live_grep<CR>')
    map('n', '<leader>fb', '<CMD>Telescope buffers<CR>')
    map('n', '<leader>fp', '<CMD>Telescope planets<CR>')
    map('n', '<leader>fd', '<CMD>Telescope find_files<CR>') -- TODO: browse dotfiles
end

M.neogit = function()
    map('n', '<leader>g', '<CMD>Neogit<CR>')
end

M.dashboard = function()
    map('n', '<leader>bm', '<CMD>DashboardJumpMarks<CR>')
    map('n', '<leader>fn', '<CMD>DashboardNewFile<CR>')
    map('n', '<leader>db', '<CMD>Dashboard<CR>')
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
    map("n", "K", "<CMD>lua vim.lsp.buf.hover()<CR>")
    map("n", "gd", "<CMD>lua vim.lsp.buf.definition()<CR>")
    map("n", "gi", "<CMD>lua vim.lsp.buf.implementation()<CR>")
    map("n", "gk", "<CMD>lua vim.lsp.buf.signature_help()<CR>")
    map("n", "<leader>D", "<CMD>lua vim.lsp.buf.type_definition()<CR>")
    map("n", "<leader>rn", "<CMD>lua vim.lsp.buf.rename()<CR>")
    map("n", "<leader>ca", "<CMD>lua vim.lsp.buf.code_action()<CR>")
    -- defined in trouble.nvim mappings
    -- map("n", "<leader>gr", "<CMD>lua vim.lsp.buf.references()<CR>")
    map("n", "]d", "<CMD>lua vim.diagnostic.goto_next()<CR>")
    map("n", "[d", "<CMD>lua vim.diagnostic.goto_prev()<CR>")
end

M.projects = function()
    map("n", "<C-P>", "<CMD>Telescope projects<CR>")
end

M.trouble = function ()
    map("n", "<leader>xx", "<CMD>TroubleToggle<CR>")
    map("n", "<leader>xw", "<CMD>TroubleToggle workspace_diagnostics<CR>")
    map("n", "<leader>xd", "<CMD>TroubleToggle document_diagnostics<CR>")
    map("n", "<leader>xq", "<CMD>TroubleToggle quickfix<CR>")
    -- map("n", "gd", "<CMD>TroubleToggle lsp_definitions<CR>")
    map("n", "gr", "<CMD>TroubleToggle lsp_references<CR>")
    -- map("n", "gi", "<CMD>TroubleToggle lsp_implementations<CR>")
end

M.todo_comments = function()
    map("n", "<leader>td", "<CMD>TodoTrouble<CR>")
end

Make = nil
function MakeRun()
    if not Make then
        local ttok, toggleTerm = pcall(require, "toggleterm.terminal")
        if ttok then
            Make = toggleTerm.Terminal:new({
                cmd = "make run",
                hidden = true,
                direction = "float",
                close_on_exit = false,
                shade_terminals = true,
                float_opts = {
                    border = "single",
                    highlights = {
                        border = "NormalFloat",
                        background = "NormalFloat",
                    }
                },
                on_open = function(term)
                    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<CMD>close<CR>", {
                        noremap = true,
                        silent = true
                    })
                end,
            })
        else
            error("Error loading toggleterm\n\n" .. toggleTerm)
            return false
        end
    end
    Make:toggle()
end

local function _custom_mappings()
    -- map("n", "<F5>", "<CMD>vsplit term://make run<CR>i")
    map("n", "<F5>", "<CMD>lua MakeRun()<CR>")
    map("n", "<leader>nh", "<CMD>noh<CR>")
end

M.misc = function()
    -- Add Packer commands because we are not loading it at startup
    cmd "silent! command PackerClean lua require 'plugins' require('packer').clean()"
    cmd "silent! command PackerCompile lua require 'plugins' require('packer').compile()"
    cmd "silent! command PackerInstall lua require 'plugins' require('packer').install()"
    cmd "silent! command PackerStatus lua require 'plugins' require('packer').status()"
    cmd "silent! command PackerSync lua require 'plugins' require('packer').sync()"
    cmd "silent! command PackerUpdate lua require 'plugins' require('packer').update()"

    _custom_mappings()
end

return M
