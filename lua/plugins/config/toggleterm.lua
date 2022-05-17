local ok, toggleterm = pcall(require, 'toggleterm')

if not ok then
    return
end

toggleterm.setup {
    shade_terminals = true,
    shading_factor = 1,
    hide_numbers = true,
    open_mapping = [[<c-\>]],
    insert_mappings = true,
}
