local ok, telescope = pcall(require, "telescope")

if not ok then
    error("Failed to load plugin telescope")
    return false
end

telescope.setup {}
