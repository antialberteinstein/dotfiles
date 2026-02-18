local status, lualine = pcall(require, "lualine")
if (not status) then return end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'tokyonight',
    section_separators = { left = '', right = '' },
    component_separators = { left = '│', right = '│' },
    disabled_filetypes = { 'alpha', 'dashboard', 'NvimTree', 'neo-tree' },
    globalstatus = true,
  },
  sections = {
    lualine_a = { 
      { 'mode', 
        separator = { left = '', right = '' },
        right_padding = 2 
      } 
    },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 
        { 
            'filename', 
            path = 1, -- Relative path
            symbols = { modified = ' ●', readonly = ' ', unnamed = '[No Name]' }
        }
    },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = {
      { 'location', 
        separator = { left = '', right = '' },
        left_padding = 2 
      },
    }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  extensions = { 
    'fugitive', 
    'neo-tree',
    'toggleterm' 
  }
}
