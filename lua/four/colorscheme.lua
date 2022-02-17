local colorscheme = "catppuccin"

require("catppuccin").setup({
	integrations = {
		treesitter = true,
		ts_rainbow = true,
		cmp = true,
		gitsigns = true,
		telescope = true,
		nvimtree = { enabled = true },
		bufferline = true,
		indent_blankline = { enabled = true, colored_indent_levels = false },
	},
})

-- Attempt to load colorscheme
local success, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not success then
	vim.notify("Catppuccin not found!")
	return
end
