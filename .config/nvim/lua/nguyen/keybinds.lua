vim.g.mapleader = ' '

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- ? (Shift+/) to Show Keybinds (Telescope)
keymap('n', '?', ':Telescope keymaps<CR>', opts)

-- ========================================== --
--             VSCode-like Keybinds           --
-- ========================================== --

-- 📁 File Explorer (Neo-tree)
-- Cmd+B: Toggle Sidebar
keymap('n', '<D-b>', ':Neotree toggle<CR>', opts)
keymap('i', '<D-b>', '<Esc>:Neotree toggle<CR>', opts)
keymap('v', '<D-b>', '<Esc>:Neotree toggle<CR>', opts)

-- 🔍 Search
-- Cmd+P: Go to File
keymap('n', '<D-p>', ':Telescope find_files<CR>', opts)
-- Cmd+Shift+F: Find in Files
keymap('n', '<D-F>', ':Telescope live_grep<CR>', opts)

-- Cmd+Shift+P: Command Palette
keymap('n', '<D-P>', ':Telescope commands<CR>', opts)
keymap('n', '<D-S-p>', ':Telescope commands<CR>', opts)

-- 💾 File Operations
-- Cmd+S: Save
keymap('n', '<D-s>', ':w<CR>', opts)
keymap('i', '<D-s>', '<Esc>:w<CR>a', opts)
-- Cmd+W: Close Editor
keymap('n', '<D-w>', ':bd<CR>', opts)
-- Cmd+N: New File (New Tab)
keymap('n', '<D-n>', ':enew<CR>', opts)

-- 📝 Editing
-- Cmd+/: Toggle Comment (using Comment.nvim)
-- Note: Cmd+/ sends <D-/> which might not be caught by all terminals/GUIs perfectly, 
-- but Neovide supports it.
keymap('n', '<D-/>', '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>', opts)
keymap('v', '<D-/>', '<esc><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', opts)
keymap('i', '<D-/>', '<Esc><cmd>lua require("Comment.api").toggle.linewise.current()<CR>i', opts)

-- Cmd+Z: Undo
keymap('n', '<D-z>', 'u', opts)
keymap('i', '<D-z>', '<Esc>ua', opts)
-- Cmd+Shift+Z: Redo
keymap('n', '<D-Z>', '<C-r>', opts)
keymap('i', '<D-Z>', '<Esc><C-r>a', opts)

-- ✂️ Clipboard (Cmd+C/V/X)
-- Cmd+C: Copy
keymap('v', '<D-c>', '"+y', opts)
-- Cmd+V: Paste
keymap('n', '<D-v>', '"+p', opts)
keymap('i', '<D-v>', '<C-r>+', opts)
keymap('v', '<D-v>', '"+p', opts)
-- Cmd+X: Cut
keymap('v', '<D-x>', '"+x', opts)
-- Select All (Cmd+A)
keymap('n', '<D-a>', 'ggVG', opts)
keymap('i', '<D-a>', '<Esc>ggVG', opts)

-- ========================================== --
--              Standard Keybinds             --
-- ========================================== --

-- Better movement in wrap
keymap('n', 'j', 'gj', opts)
keymap('n', 'k', 'gk', opts)

-- Move selected line / block of text in visual mode
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Indent
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- No highlight search
keymap('n', '<leader>h', ':nohlsearch<CR>', opts)

