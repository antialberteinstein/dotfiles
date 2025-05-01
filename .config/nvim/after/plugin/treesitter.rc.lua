local status, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status then return end


treesitter.setup({
    ensure_installed = {
        'c', 'cpp', 'java', 'python', 'lua',
        'bash', 'javascript', 'typescript', 'html', 'css',
        'json', 'yaml', 'markdown', 'vim', 'vimdoc',
        'query'
    },
    sync_install = false,  -- Đổi thành false để tránh block UI
    auto_install = true,
    ignore_install = { 'help' },  -- Bỏ qua file help

    highlight = {
        enable = true,
        disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
        additional_vim_regex_highlighting = false,
    },

    indent = {
        enable = true,
        disable = { 'yaml', 'html' }
    },

    autotag = {
        enable = true,
        filetypes = {
            'html', 'javascript', 'typescript', 'javascriptreact',
            'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'rescript',
            'xml', 'php', 'markdown', 'glimmer', 'handlebars', 'hbs'
        }
    },

    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = 1000,
        colors = {
            '#cc241d', '#98971a', '#d79921', '#458588',
            '#b16286', '#689d6a', '#d65d0e'
        },  -- Màu phù hợp với theme
        query = 'rainbow-parens',  -- Sử dụng query chính xác hơn
    },

    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = 'gnn',
            node_incremental = 'grn',
            scope_incremental = 'grc',
            node_decremental = 'grm',
        }
    },

    playground = {
        enable = false,
        updatetime = 25,
        persist_queries = true,
        keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
        }
    }
})

-- Keymaps hữu ích
vim.keymap.set('n', '<leader>th', ':TSHighlightCapturesUnderCursor<CR>', { desc = 'Highlight Capture' })
vim.keymap.set('n', '<leader>tu', ':TSUpdate<CR>', { desc = 'Update Treesitter' })
