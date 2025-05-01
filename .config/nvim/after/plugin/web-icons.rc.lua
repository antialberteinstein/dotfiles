local status, icons = pcall(require, 'nvim-web-devicons')
if not status then return end

icons.setup({
  -- Kích hoạt màu mặc định
  color_icons = true,
  
  -- Giữ nguyên các icon mặc định
  default = true,
  
  -- Tùy chỉnh icon cho các file type cụ thể
  override = {
    -- Ví dụ tùy chỉnh:
    ["js"] = {
      icon = "",  -- Biểu tượng JavaScript
      color = "#f0db4f",  -- Màu vàng
      name = "Js"
    },
    ["ts"] = {
      icon = "󰛦",  -- Biểu tượng TypeScript
      color = "#3178c6",  -- Màu xanh
      name = "Ts"
    },
    ["py"] = {
      icon = "",  -- Biểu tượng Python
      color = "#3776ab",  -- Màu xanh Python
      name = "Py"
    },
    -- Thêm các file type khác nếu cần
  },
  
  -- Tự động tải khi cần (không cần gọi require thủ công)
  strict = true,
  
  -- Hiển thị cho các file ẩn (bắt đầu bằng .)
  show_hidden = true
})

-- Bổ sung keymap kiểm tra icon (tùy chọn)
vim.keymap.set('n', '<leader>ic', function()
  local file = vim.fn.expand('%:t')
  local ext = vim.fn.expand('%:e')
  local icon, color = icons.get_icon_color(file, ext, { default = true })
  print(string.format("File: %s | Icon: %s | Color: %s", file, icon, color))
end, { desc = 'Check file icon' })
