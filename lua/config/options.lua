-- Left column and similar settings
local o = vim.o
o.number = true -- display line numbers
o.relativenumber = false -- display relative line numbers
o.numberwidth = 2 -- set width of line number column
o.signcolumn = "yes" -- always show sign column
o.wrap = false -- display lines as single line
o.scrolloff = 10 -- number of lines to keep above/below cursor
o.sidescrolloff = 8 -- number of columns to keep to the left/right of cursor

-- Tab spacing/behavior
o.expandtab = true -- convert tabs to spaces
o.shiftwidth = 2 -- number of spaces inserted for each indentation level
o.tabstop = 2 -- number of spaces inserted for tab character
o.softtabstop = 2 -- number of spaces inserted for <Tab> key
o.smartindent = true -- enable smart indentation
o.breakindent = true -- enable line breaking indentation

-- General Behaviors
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
o.backup = false -- disable backup file creation
o.clipboard = "unnamedplus" -- enable system clipboard access
o.conceallevel = 0 -- so that `` is visible in markdown files
o.fileencoding = "utf-8" -- set file encoding to UTF-8
o.mouse = "a" -- enable mouse support
o.showmode = false -- hide mode display
o.splitbelow = true -- force horizontal splits below current window
o.splitright = true -- force vertical splits right of current window
o.termguicolors = true -- enable term GUI colors
o.timeoutlen = 1000 -- set timeout for mapped sequences
o.undofile = true -- enable persistent undo
o.updatetime = 100 -- set faster completion
o.writebackup = false -- prevent editing of files being edited elsewhere
o.cursorline = false -- highlight current line

-- Searching Behaviors
o.hlsearch = true -- highlight all matches in search
o.ignorecase = true -- ignore case in search
o.smartcase = true -- match case if explicitly stated
