local ok, telescope = pcall(require, "telescope")

if not ok then
    error("Failed to load plugin telescope")
    return false
end

local trouble
ok, trouble = pcall(require, "trouble.providers.telescope")

if ok then
    telescope.setup {
        defaults = {
            mappings = {
                i = { ["<c-t>"] = trouble.open_with_trouble },
                n = { ["<c-t>"] = trouble.open_with_trouble },
            }
        }
    }
    return true
end

telescope.setup {}
return true
