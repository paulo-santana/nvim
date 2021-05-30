require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
	additional_vim_regex_highlighting = true,
--    custom_captures = {
--      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
--      ["foo.bar"] = "Identifier",
--    },
  },
}
--{{{{{{}}}}}}
vim.api.nvim_exec([[
  hi rainbowcol1 guifg=#c678dd
  hi rainbowcol2 guifg=#61afef
  hi rainbowcol3 guifg=#e5c07b
  hi rainbowcol4 guifg=#98c379
  hi rainbowcol5 guifg=#e06c75
  hi rainbowcol6 guifg=#56b6c2
  hi rainbowcol7 guifg=#d44f28
]], true);
