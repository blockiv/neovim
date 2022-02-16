local colorscheme = "catppuccin"

require"catppuccin".setup{
    integrations = {
        ts_rainbow = true,
    }
}

-- Attempt to load colorscheme
local success, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not success then
    vim.notify("Catppuccin not found!")
    return
end
