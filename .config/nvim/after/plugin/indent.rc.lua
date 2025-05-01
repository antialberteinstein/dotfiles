local status, indent = pcall(require, 'ibl')


if not status then return end
-- Cấu hình indent-blankline
indent.setup({
    indent = {
        char = "│"
    },
    scope = {
        enabled = true,
        show_start = true,
        show_end = false, -- hoặc true nếu bạn muốn
    },
    whitespace = {
        remove_blankline_trail = false,
    },
    exclude = {
        filetypes = {
            'dashboard',
            'alpha',
        }
    }
})

