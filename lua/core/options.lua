local opt = vim.opt
local g = vim.g

g.mapleader = " "

opt.title = true
opt.clipboard = "unnamedplus"
opt.cul = true

opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true

opt.hidden = true
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

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
