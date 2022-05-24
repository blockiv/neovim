local success, feline = pcall(require, "feline")
if not success then
    vim.notify("Unable to load feline!")
    return
end
