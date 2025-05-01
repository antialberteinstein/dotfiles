local status, theme = pcall(require, 'tokyonight')

if not status then
    return
end

theme.setup({
  style = "night",  -- Có 3 style: "night", "storm", "day"
  light_style = "day",  -- Khi dùng light background
  transparent = false,  -- Nền trong suốt
  terminal_colors = true,  -- Áp dụng màu cho terminal
  styles = {
    comments = { italic = true },  -- Chữ nghiêng cho comment
    keywords = { italic = true },  -- Chữ nghiêng cho keywords
    functions = { bold = true },   -- Chữ đậm cho functions
  },
  hide_inactive_statusline = false,  -- Ẩn statusline không active
})

-- Áp dụng colorscheme
vim.cmd[[colorscheme tokyonight]]
