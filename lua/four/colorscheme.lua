local colorscheme = "catppuccin"

local success, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not success then
    vim.notify("Colorscheme " .. colorscheme .. " not found!")
    return
end
