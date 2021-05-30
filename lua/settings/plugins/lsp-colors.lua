local bufferline = require('bufferline')
-- Lua
require('lsp-colors').setup({
  Error = bufferline.shade_color('#e06c75', -80),
  Warning = bufferline.shade_color('#e5c07b', -80),
  Information = bufferline.shade_color('#61afef', -80),
  Hint = bufferline.shade_color('#98c379', -80)
})
