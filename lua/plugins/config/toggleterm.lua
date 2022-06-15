local ok, toggleterm = pcall(require, 'toggleterm')

if not ok then
    return
end

toggleterm.setup {
    highlights = {
       NormalFloat = {
           guibg = '#1c1e24',
           -- link = 'Normal',
       },
       FloatBorder = {
           guifg = '#1c1e24',
           guibg = '#1c1e24',
       },
    },
    shade_terminals = true,
    -- shading_factor = 1,
    hide_numbers = true,
    open_mapping = [[<c-\>]],
    insert_mappings = true,
}
--
-- vim.cmd[[hi ToggleTerm1NormalFloat guibg=#1c1e24]]
-- vim.cmd[[hi ToggleTerm1FloatBorder guibg=#1c1e24]]
