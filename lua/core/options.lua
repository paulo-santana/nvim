local opt = vim.opt
local g = vim.g

g.mapleader = " "

-- opt.shell = '/bin/bash'
opt.title = true
opt.clipboard = "unnamedplus"
opt.cul = true
opt.colorcolumn = '80'

opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true

opt.hidden = true
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"
opt.wrap = false

opt.number = true
opt.relativenumber = true
opt.ruler = true

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true

opt.timeoutlen = 400
opt.updatetime = 250
opt.undofile = true

opt.guifont = 'JetBrainsMonoMedium Nerd Font:h10'

g.neovide_refresh_rate = 144
g.neovide_cursor_trail_length = 0.8
g.neovide_cursor_antialiasing = true
g.neovide_cursor_vfx_mode = "torpedo"

local disabled_built_ins = {
    "2html_plugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "matchit",
    "tar",
    "tarPlugin",
    "rrhelper",
    "spellfile_plugin",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
    g["loaded_" .. plugin] = 1
end
