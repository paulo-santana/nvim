local ok, gitsigns = pcall(require, 'gitsigns')

if not ok then
    print("setting gitsigns up")
    return
end

gitsigns.setup({ })
