vim.g.mapleader = ' '

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Copying
keymap('n', '<C-d>', ':t.<CR>', opts)
keymap('i', '<C-d>', '<esc>:t.<CR>a', opts)
keymap('v', '<C-c>', 'y', opts)

-- Two of these were disabled by conflicting with kitty keybinds.
-- keymap('n', '<C-v>', 'p', opts)
-- keymap('i', '<C-v>', '<esc>pa', opts)

keymap('v', '<C-x>', 'x', opts)
-- Block cutting while using x and delete.
-- keymap('n', 'x', '"_x', opts)  -- Will not disable x key for cutting.
-- keymap('v', 'x', '"_x', opts)  -- Will not disable x key for cutting.
keymap('n', '<Del>', '"_x', opts)
keymap('v', '<Del>', '"_x', opts)

-- Increase/Decrease
keymap('n', '+', '<C-a>', opts)
keymap('n', '-', '<C-x>', opts)

-- Deleting
keymap('n', 'dw', 'vb"_d', opts)

-- Select all
keymap('n', '<C-a>', 'gg<S-v>G', opts)
keymap('i', '<C-a>', '<esc>gg<S-v>G', opts)

-- Saving
keymap('n', '<C-s>', '<cmd>w<CR>', opts)
keymap('i', '<C-s>', '<esc><cmd>w<CR>a', opts)

-- New tab
keymap('n', '<Tab>n', '<cmd>tabedit<CR>', opts)

-- Switch to visual-line mode from insert
keymap('i', '<F2>', '<esc>V', opts)
keymap('n', '<F2>', '<esc>V', opts)
-- Switch to visual mode from insert
keymap('i', '<F3>', '<esc>v', opts)
keymap('n', '<F3>', '<esc>v', opts)

-- Undo
keymap('i', '<C-z>', '<esc>ua', opts)
keymap('n', '<C-z>', 'u', opts)

