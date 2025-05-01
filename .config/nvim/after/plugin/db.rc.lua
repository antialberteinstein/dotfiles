local status, dashboard = pcall(require, 'dashboard')

if not status then return end
--
-- local home = os.getenv('HOME')
--
-- db.custom_center = {
--     { icon = '  ',
--         desc = 'Recently opened files                   ',
--         action = 'DashboardFindHistory',
--         shortcut = 'SPC f h' },
--     { icon = '  ',
--         desc = 'File Browser                            ',
--         action = 'Telescope file_browser',
--         shortcut = 'SPC f b' },
-- }
dashboard.setup({
    theme = 'doom',
    config = {
        header = {
            '',
            '',
            ' █████╗ ██╗     ██╗   ██╗██╗  ██╗ ██████╗ ███╗   ██╗',
            '██╔══██╗██║     ██║   ██║╚██╗██╔╝██╔═══██╗████╗  ██║',
            '███████║██║     ██║   ██║ ╚███╔╝ ██║   ██║██╔██╗ ██║',
            '██╔══██║██║     ██║   ██║ ██╔██╗ ██║   ██║██║╚██╗██║',
            '██║  ██║███████╗╚██████╔╝██╔╝ ██╗╚██████╔╝██║ ╚████║',
            '╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝',
            '       ━━━━━━━━━━ ━━━━━━━━━☭━━━━━━━━━ ━━━━━━━━━',
            '',
        },
        center = {
            {
                icon = '  ',
                desc = 'Recently opened files                   ',
                action = 'Telescope oldfiles',
                shortcut = 'SPC f h'
            },
            {
                icon = '  ',
                desc = 'File Browser                            ',
                action = 'Telescope file_browser',
                shortcut = 'SPC f b'
            },
            {
                icon = '  ',
                desc = 'New file                               ',
                action = 'DashboardNewFile',
                shortcut = 'SPC c n'
            },
            {
                icon = '  ',
                desc = 'Update plugins                         ',
                action = 'PackerSync',
                shortcut = 'SPC p u'
            },
            {
                icon = '  ',
                desc = 'Configuration                          ',
                action = 'edit $MYVIMRC',
                shortcut = 'SPC e v'
            }
        },
        footer = {
            '',
            'Love you',
            ''
        }
    }
})
