local present, nvimtree = pcall(require, 'nvim-tree')

if not present then
    return
end

local g = vim.g

g.nvim_tree_git_hl = 1
g.nvim_tree_group_empty = 1
g.nvim_tree_indent_markers = 1

g.nvim_tree_show_icons = {
    git = 0,
    folders = 1,
}

nvimtree.setup {
    diagnostics = {
        enable = true,
    },
    update_focused_file = {
        enable = true,
    }
}
