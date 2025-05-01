local status, telescope = pcall(require, 'telescope')
if not status then return end

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local fb_actions = require('telescope').extensions.file_browser.actions

-- Tối ưu hàm lấy thư mục hiện tại
local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,  -- Tắt mapping mặc định
        ['<C-d>'] = actions.delete_buffer,  -- Thêm mapping xóa buffer
      },
    },
    file_ignore_patterns = { '^.git/', 'node_modules/' },  -- Bỏ qua thư mục
    layout_strategy = 'horizontal',  -- Cải thiện hiển thị
    layout_config = {
      prompt_position = 'top',  -- Thanh tìm kiếm trên cùng
    },
    sorting_strategy = 'ascending',  -- Sắp xếp kết quả
  },
  extensions = {
    file_browser = {
      theme = 'dropdown',
      hijack_netrw = true,
      hidden = { file_browser = true, folder_browser = true },  -- Hiện file ẩn
      respect_gitignore = false,  -- Bỏ qua .gitignore
      mappings = {
        i = {
          ['<C-n>'] = fb_actions.create,
          ['<C-r>'] = fb_actions.rename,
          ['<C-c>'] = fb_actions.copy,
          ['<C-x>'] = fb_actions.move,
          ['<Del>'] = fb_actions.remove,
          ['<C-h>'] = fb_actions.toggle_hidden,
          ['<C-g>'] = fb_actions.goto_parent_dir,  -- Thêm phím tắt mới
        },
        n = {
          ['n'] = fb_actions.create,
          ['r'] = fb_actions.rename,
          ['c'] = fb_actions.copy,
          ['m'] = fb_actions.move,
          ['d'] = fb_actions.remove,
          ['h'] = fb_actions.toggle_hidden,
          ['<BS>'] = fb_actions.goto_parent_dir,
        },
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true,  -- Tìm cả file ẩn
      no_ignore = false,  -- Vẫn tôn trọng .gitignore
    },
  },
})

-- Tải extension
telescope.load_extension('file_browser')

-- Keymaps được tối ưu
local opts = { noremap = true, silent = true }

-- Tìm file (bao gồm file ẩn)
vim.keymap.set('n', 'ff', function()
  builtin.find_files({
    no_ignore = false,
    hidden = true,
    previewer = true,  -- Bật preview
  })
end, opts)

-- Mở file browser với layout tốt hơn
vim.keymap.set('n', 'fa', function()
  telescope.extensions.file_browser.file_browser({
    path = '%:p:h',
    cwd = telescope_buffer_dir(),
    hidden = true,
    grouped = true,
    initial_mode = 'normal',
    layout_config = {
      height = 0.8,  -- Chiếm 80% màn hình
      width = 0.8,
      preview_cutoff = 120,  -- Giới hạn preview
    },
  })
end, opts)

-- Resume tìm kiếm trước đó
vim.keymap.set('n', 'ft', builtin.resume, opts)

-- Thêm keymaps hữu ích
vim.keymap.set('n', '<C-f>', builtin.live_grep, { desc = 'Live grep' })
vim.keymap.set('n', 'fg', builtin.live_grep, { desc = 'Live grep' })
vim.keymap.set('n', 'fb', builtin.buffers, { desc = 'Find buffers' })
vim.keymap.set('n', 'fh', builtin.help_tags, { desc = 'Help tags' })
