local status, bufferline = pcall(require, 'bufferline')
if (not status) then return end

bufferline.setup({
    options = {
        mode = 'tabs',
        separator_style = 'slant',
        always_show_bufferline = false,
        show_buffer_close_icons = false,
        show_close_icons = false,
        color_icons = true,
        diagnostics = "nvim_lsp", -- Show diagnostics in bufferline
        diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end,
        offsets = {
            {
                filetype = 'NvimTree',
                text = 'File Explorer',
                highlight = 'Directory',
                text_align = 'left'
            }
        },
        hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
        }
    },
    highlights = {
        separator = {
            fg = '#073642',
            bg = '#002b36',
        },
        separator_selected = {
            fg = '#073642',
        },
        background = {
            fg = '#657b83',
            --bg = '#002b36'
        },
        buffer_selected = {
            fg = '#fdf6e3',
            bold = true,
            italic = true,
        },
        fill = {
            bg = '#073642'
        }
    },
})

-- Next buffer mappings
vim.keymap.set('n', '<Tab>l', '<Cmd>BufferLineCycleNext<CR>')
vim.keymap.set('n', '<Tab><Down>', '<Cmd>BufferLineCycleNext<CR>')
vim.keymap.set('n', '<Tab><Right>', '<Cmd>BufferLineCycleNext<CR>')

-- Previous buffer mappings
vim.keymap.set('n', '<Tab>h', '<Cmd>BufferLineCyclePrev<CR>')
vim.keymap.set('n', '<Tab><Up>', '<Cmd>BufferLineCyclePrev<CR>')
vim.keymap.set('n', '<Tab><Left>', '<Cmd>BufferLineCyclePrev<CR>')


-- Additional useful keymaps (optional)
vim.keymap.set('n', '<leader>bp', '<Cmd>BufferLinePick<CR>')
vim.keymap.set('n', '<leader>bc', '<Cmd>BufferLinePickClose<CR>')
