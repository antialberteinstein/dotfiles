

-- Set global options trước
vim.g.floaterm_position = 'center'
vim.g.floaterm_width = 0.85
vim.g.floaterm_height = 0.85
vim.g.floaterm_borderchars = '─│─│╭╮╯╰'
vim.g.floaterm_title = '  Terminal ($1/$2) '
vim.g.floaterm_autoclose = 2

-- Style màu đẹp (dùng màu từ theme Tokyo Night)
vim.api.nvim_set_hl(0, 'Floaterm', { bg = '#1a1b26', fg = '#a9b1d6' })
vim.api.nvim_set_hl(0, 'FloatermBorder', { bg = '#1a1b26', fg = '#7aa2f7' })

-- Keymaps chất như nước cất
local map = vim.keymap.set

-- Toggle terminal
map('n', '<Leader>tt', '<cmd>FloatermToggle<CR>', { desc = 'Toggle floating terminal' })
map('t', '<Leader>tt', '<C-\\><C-n><cmd>FloatermToggle<CR>', { desc = 'Toggle floating terminal' })

-- Terminal navigation
map('n', '<Leader>tn', '<cmd>FloatermNew<CR>', { desc = 'New terminal' })
map('n', '<Leader>th', '<cmd>FloatermPrev<CR>', { desc = 'Previous terminal' })
map('n', '<Leader>tl', '<cmd>FloatermNext<CR>', { desc = 'Next terminal' })

-- Gửi code đến terminal
map('v', '<Leader>ts', ':<C-u>FloatermSend<CR>', { desc = 'Send selection to terminal' })
map('n', '<Leader>ts', 'vip<cmd>FloatermSend<CR>', { desc = 'Send paragraph to terminal' })

-- Integration với lazygit (cần cài lazygit trước)
map('n', '<Leader>gg', function()
  vim.cmd([[FloatermNew --height=0.95 --width=0.95 --title='  LazyGit ' lazygit]])
end, { desc = 'LazyGit integration' })
