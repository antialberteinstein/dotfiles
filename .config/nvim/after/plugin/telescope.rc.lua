local status, telescope = pcall(require, 'telescope')
if not status then return end

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

-- Helper to get project root
local function project_files()
  local opts = {} -- define here if you want to define something
  local ok = pcall(builtin.git_files, opts)
  if not ok then builtin.find_files(opts) end
end

telescope.setup({
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    
    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<C-c>"] = actions.close,
        
        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,

        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,
        
        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-l>"] = actions.complete_tag,
      },
      
      n = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["H"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["L"] = actions.move_to_bottom,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["?"] = actions.which_key,
      },
    },
    
    -- Visual Customization
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    use_less = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
  },
  
  pickers = {
    -- Default configuration for builtin pickers goes here:
    find_files = {
        hidden = true,
        -- theme = "dropdown",
    },
    live_grep = {
        only_sort_text = true,
        -- theme = "dropdown",
    },
    grep_string = {
        only_sort_text = true,
        -- theme = "dropdown",
    },
    buffers = {
        initial_mode = "normal",
        -- theme = "dropdown",
        mappings = {
            i = {
                ["<C-d>"] = actions.delete_buffer,
            },
            n = {
                ["dd"] = actions.delete_buffer,
            },
        },
    },
    planets = {
        show_plural = false,
        show_moon = true,
    },
    git_files = {
        hidden = true,
        show_untracked = true,
    },
    colorscheme = {
        enable_preview = true,
    },
  },
  
  extensions = {
    file_browser = {
      theme = "dropdown",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
})

-- Load extensions
telescope.load_extension('file_browser')

-- Keymaps are managed in keybinds.lua or here
-- For strict separation, we keep general keybinds in keybinds.lua,
-- but plugin-specific ones can optionally stay here if complex.
-- Moving most common ones to keybinds.lua is often cleaner.

local opts = { noremap = true, silent = true }
-- Example: 
-- vim.keymap.set('n', ';f', function() builtin.find_files({ no_ignore = false, hidden = true }) end, opts)
-- vim.keymap.set('n', ';r', function() builtin.live_grep() end, opts)
-- vim.keymap.set('n', '\\\\', function() builtin.buffers() end, opts)
-- vim.keymap.set('n', ';t', function() builtin.help_tags() end, opts)
-- vim.keymap.set('n', ';;', function() builtin.resume() end, opts)
-- vim.keymap.set('n', ';e', function() builtin.diagnostics() end, opts)
-- vim.keymap.set('n', 'sf', function() 
--     telescope.extensions.file_browser.file_browser({
--         path = "%:p:h",
--         cwd = telescope_buffer_dir(),
--         respect_gitignore = false,
--         hidden = true,
--         grouped = true,
--         previewer = false,
--         initial_mode = "normal",
--         layout_config = { height = 40 }
--     })
-- end, opts)
