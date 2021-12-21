vim.cmd "packadd packer.nvim"

local installed, packer = pcall(require, "packer")

if not installed then
    local packer_path = vim.fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim"

    print "Cloning packer..."
    vim.fn.delete(packer_path, "rf")
    vim.fn.system {
        "git",
        "clone",
        "https://github.com/wbthomason/packer.nvim",
        "--depth",
        "20",
        packer_path,
    }
    vim.cmd "packadd packer.nvim"
    installed, packer = pcall(require, "packer")

    if installed then
        print "Packer cloned successfully."
    else
        error("Could not clone packer!\n" .. "Packer path: " .. packer_path .. "\n" .. packer)
    end
end

packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = single }
        end,
        prompt_border = "single",
    },
    auto_clean = true,
    compile_on_sync = true,
}

return packer
