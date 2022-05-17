local core_modules = {
    "core.options",
    "core.autocmds",
}

for _, module in ipairs(core_modules) do
    local ok, err = pcall(require, module)
    if not ok then
        error("Error loading module " .. module .. "\n\n" .. err)
    end
end

require("core.mappings").misc()
