local present, nvimtree = pcall(require, 'nvim-tree')

if not present then
    return
end

-- local g = vim.g
--
-- g.nvim_tree_git_hl = 1
-- g.nvim_tree_group_empty = 1
-- g.nvim_tree_indent_markers = 1

-- g.nvim_tree_show_icons = {
--     git = 0,
--     folders = 1,
-- }

nvimtree.setup {
    diagnostics = {
        enable = true,
    },
    update_focused_file = {
        enable = true,
    },
    renderer = {
        indent_markers = {
            enable = true,
        },
        highlight_git = true,
        highlight_opened_files = "none",
        icons = {
            webdev_colors = true,
            show = {
                file = true,
                folder = true,
                folder_arrow = false,
                git = false,
            }
        },
    },
}
