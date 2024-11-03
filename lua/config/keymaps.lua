-- mappings
local map = vim.keymap.set
-- Set our leader keybinding to space
-- Anywhere you see <leader> in a keymapping specifies the space key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Remove search highlights after searching
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Remove search highlights" })

-- Exit Vim's terminal mode
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
map("n", "<C-q>", "<cmd>q<CR>", { desc = "general save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })

-- Better window navigation
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Easily split windows
map("n", "<leader>wv", ":vsplit<cr>", { desc = "[W]indow Split [V]ertical" })
map("n", "<leader>wh", ":split<cr>", { desc = "[W]indow Split [H]orizontal" })

-- Stay in indent mode
map("v", "<", "<gv", { desc = "Indent left in visual mode" })
map("v", ">", ">gv", { desc = "Indent right in visual mode" })

-- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

map(
	"n",
	"<leader>h",
	"<cmd>:lua require('nvterm.terminal').new('horizontal')<CR>",
	{ desc = "open terminal horizontal" }
)
map("n", "<leader>v", "<cmd>:lua require('nvterm.terminal').new('vertical')<CR>", { desc = "open terminal vertical " })
map("n", "<leader>f", "<cmd>:lua require('nvterm.terminal').new('float')<CR>", { desc = "open terminal float " })

map("n", "<leader>fm", function()
	require("conform").format({ lsp_fallback = true })
end, { desc = "general format file" })
