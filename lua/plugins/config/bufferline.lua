local present, bufferline = pcall(require, "bufferline")
local ok, colors = pcall(require, "onechad.util")

if not present then
    return
end

bufferline.setup {
    options = {
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "center",
                separator = true
            }
        },
        buffer_close_icon = "",
        modified_icon = "",
        close_icon = "",
        show_close_icon = true,
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 18,
        max_prefix_length = 13,
        tab_size = 20,
        show_tab_indicators = true,
        enforce_regular_tabs = false,
        -- view = "multiwindow",
        show_buffer_close_icons = true,
        separator_style = "thin",
        always_show_bufferline = "true",
        diagnostics = "nvim_lsp",
        custom_filter = function(buf_number)
            local type_present, type = pcall(function()
                return vim.api.nvim_buf_get_var(buf_number, "term_type")
            end)

            if type_present then
                if type == "vert" or type == "hori" then
                    return false
                end
                return true
            end

            return true
        end,
    }
}
