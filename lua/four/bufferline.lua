local success, bufferline = pcall(require, "bufferline")
if not success then
	vim.notify("Unable to load bufferline...")
	return
end

bufferline.setup({
	options = {
		numbers = "none",
		close_command = "bdelete! %d",
		right_mouse_command = "bdelete! %d",
		left_mouse_command = "buffer %d",
		middle_mouse_command = nil,
		indicator_icon = "▎",
		buffer_close_icon = "",
		-- buffer_close_icon = '',
		modified_icon = "●",
		close_icon = "",
		-- close_icon = '',
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 18,
		max_prefix_length = 15,
		tab_size = 22,
		diagnostics = false,
		diagnostics_update_in_insert = false,
		offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
		show_buffer_icons = true,
		show_buffer_close_icons = true,
		show_close_icon = true,
		show_tab_indicators = true,
		separator_style = "thin", -- options: "slant", "thick", "thin", { "any", "any" }
		enforce_regular_tabs = true,
		always_show_bufferline = true,
	},
})
