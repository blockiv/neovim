-- set neovim options

local options = {
	backup = false,			        -- create backup file
	clipboard = "unnamedplus",      -- allow nvim to access the system keyboard
	cmdheight = 2,                  -- more space in command line for displaying messages
	conceallevel = 0,               -- make `` visible in markdown files
	fileencoding = "utf-8",		    -- encoding written to a file
	hlsearch = true,                -- highlight all matches on previous search pattern
	ignorecase = true,              -- ignore case in search patterns
	mouse = "a",                    -- allow the mouse to be used in neovim
	pumheight = 10,                 -- pop up menu height
	showmode = false,               -- do not show current mode like -- INSERT --
	showtabline = 2,                -- always show tabs
	smartcase = true,               -- smart case
	smartindent = true,             -- smart indenting
	splitbelow = true,              -- force all horizontal splits to go below current window
	splitright = true,              -- force all vertical splits to go to the right of current window
	swapfile = false,               -- use swap file
	timeoutlen = 1000,              -- time to wait for a mapped sequence to complete (milliseconds)
	title = true,                   -- set title of window to the value of the titlestring
	undodir = "/home/four/.cache/nvim/undo",
	undofile = true,                -- enable persistent undo
	updatetime = 300,               -- faster completion (4000ms default)
	writebackup = false,            -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	expandtab = true,               -- expand tabs to spaces
	shiftwidth = 4,                 -- the number of spaces inserted for each indentation
	tabstop = 4,                    -- insert 4 spaces for a tab
	cursorline = true,              -- highlight the current line
	number = true,                  -- show line numbers
	relativenumber = true,          -- set relative line numbers
	numberwidth = 2,                -- set width of number column
	signcolumn = "yes",             -- always show the sign column
	wrap = false,                   -- do not wrap long lines
	scrolloff = 8,                  -- scroll offset
	sidescrolloff = 8,              -- horizontal scroll offset
	spell = false,                  -- disable spell check
}

vim.opt.shortmess:append "c"
vim.opt.whichwrap:append "<,>,[,],h,l"
vim.opt.iskeyword:append "-"

for k, v in pairs(options) do
	vim.opt[k] = v
end
