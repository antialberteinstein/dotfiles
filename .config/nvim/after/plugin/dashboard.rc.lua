local status, dashboard = pcall(require, "dashboard")
if not status then return end

-- Conflicting setup removed

-- Custom Project/Center configuration for Hyper theme
-- Or switching to 'doom' theme which is often cleaner for shortcuts
dashboard.setup({
    theme = 'doom',
    config = {
        header = {
            "",
            " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
            " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
            " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
            " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
            " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
            " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
            "",
        },
        center = {
            {
                icon = "  ",
                desc = "Find File",
                action = "Telescope find_files",
                key = "f",
            },
            {
                icon = "  ",
                desc = "Recent Files",
                action = "Telescope oldfiles",
                key = "r",
            },
            {
                icon = "  ",
                desc = "File Browser",
                action = "Telescope file_browser",
                key = "b",
            },
            {
                icon = "  ",
                desc = "LazyGit",
                action = "LazyGit",
                key = "g",
            },
            {
                icon = "  ",
                desc = "Settings",
                action = "e $MYVIMRC",
                key = "s",
            },
        },
        footer = {
            "Neovim loaded " .. (packer_plugins and vim.tbl_count(packer_plugins) or 0) .. " plugins"
        },
    },
})
