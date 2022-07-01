local colorscheme = "solarized8_high"

-- Attempt to load colorscheme
local success, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not success then
	vim.notify("Colorscheme not found!")
	return
end
