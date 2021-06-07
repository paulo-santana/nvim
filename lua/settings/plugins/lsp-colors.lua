local shade_color = require('../../utils').shade_color
-- Lua
require('lsp-colors').setup({
  Error = shade_color('#e06c75', -80),
  Warning = shade_color('#e5c07b', -80),
  Information = shade_color('#61afef', -80),
  Hint = shade_color('#98c379', -80)
})
