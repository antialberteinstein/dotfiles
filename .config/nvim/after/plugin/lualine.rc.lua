local status, lualine = pcall(require, "lualine")
if (not status) then return end

local nguyen = require('lualine.themes.horizon')

-- Tối giản theme với background trong suốt
for _, mode in ipairs({ 'normal', 'insert', 'visual', 'command', 'inactive' }) do
  nguyen[mode].c.bg = 'NONE'
  nguyen[mode].c.fg = '#bbc2cf' -- Màu chữ đồng nhất
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = nguyen,
    section_separators = { left = '', right = '' },    -- Separator đẹp hơn
    component_separators = { left = '│', right = '│' },  -- Dạng thẳng đứng
    disabled_filetypes = { 'alpha', 'dashboard', 'NvimTree' }, -- Ẩn trên các UI
    globalstatus = true, -- Hiển thị một line duy nhất
  },
  sections = {
    lualine_a = { 
      { 'mode', 
        separator = { left = '', right = '' }, 
        padding = { left = 1, right = 1 },
        icon = '' -- Biểu tượng mode
      } 
    },
    lualine_b = { 
      'branch', 
      { 
        'diff',
        symbols = {
          added = ' ',
          modified = ' ',
          removed = ' '
        },
        colored = true -- Hiển thị màu theo trạng thái
      }
    },
    lualine_c = {
      {
        'filetype',
        icon_only = true,
        separator = '',
        padding = { left = 1, right = 0 },
        icon = { align = 'right' } -- Căn chỉnh icon
      },
      {
        'filename',
        file_status = true,
        path = 1, -- Hiển thị path tương đối
        symbols = {
          modified = '[+]', -- File modified
          readonly = '',   -- Biểu tượng khóa
          unnamed = '[No Name]'
        }
      }
    },
    lualine_x = {
      {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        symbols = { 
          error = ' ', 
          warn = ' ', 
          info = ' ', 
          hint = ' ' 
        },
        colored = true, -- Màu theo mức độ
        update_in_insert = true -- Cập nhật realtime
      },
      {
        'encoding',
        fmt = string.upper -- Hiển thị dạng UTF-8
      },
      {
        'fileformat',
        symbols = {
          unix = '', -- Linux
          dos = '',  -- Windows
          mac = ''   -- MacOS
        }
      },
      'filetype'
    },
    lualine_y = { 
      { 'progress', 
        padding = { left = 1 }, 
        fmt = function() -- Định dạng lại
          return '%P:%L' -- %P = Percentage, %L = Line count
        end 
      } 
    },
    lualine_z = {
      { 'location', 
        separator = { left = '', right = '' }, 
        padding = { left = 1, right = 1 } 
      },
      {
        function() -- Hiển thị thời gian
          return ' ' .. os.date('%H:%M')
        end,
        color = { fg = '#212121' } -- Màu riêng cho đồng hồ
      }
    }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 
      {
        'filename', 
        path = 1, 
        color = { fg = '#5B6268' } -- Màu mờ cho inactive
      } 
    },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  extensions = { 
    'fugitive', 
    'neo-tree',   -- Thêm extension cho file explorer
    'toggleterm'  -- Hỗ trợ terminal
  }
}
