local status, colorizer = pcall(require, 'colorizer')
if not status then return end

-- Cấu hình mặc định với các tùy chọn quan trọng
colorizer.setup({
  '*', -- Áp dụng cho mọi filetype
  user_default_options = {
    RGB = true,          -- #RGB hex
    RRGGBB = true,      -- #RRGGBB hex
    names = false,       -- Tắt tên màu (giảm CPU)
    RRGGBBAA = true,    -- #RRGGBBAA hex
    css = true,         -- Bật phân tích CSS
    css_fn = true,      -- Bật hàm CSS
    mode = 'background', -- Hiển thị màu nền
    tailwind = 'normal'  -- Hỗ trợ Tailwind
  },
  buftypes = {
    '*',                -- Mọi loại buffer
    exclude = {
      'terminal',       -- Tránh terminal
      'prompt'          -- Tránh prompt
    }
  }
})

-- Bổ sung phím tắt tiện dụng (không làm thay đổi cấu trúc)
vim.api.nvim_set_keymap('n', '<leader>cc', '<cmd>ColorizerToggle<CR>', { noremap = true, silent = true, desc = 'Toggle colorizer' })
vim.api.nvim_set_keymap('n', '<leader>cr', '<cmd>ColorizerReloadAllBuffers<CR>', { noremap = true, silent = true, desc = 'Reload colorizer' })
