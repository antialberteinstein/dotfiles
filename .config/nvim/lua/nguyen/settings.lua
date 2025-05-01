-- =================================== --
-- ██████╗  █████╗ ███████╗██╗ ██████╗ --
-- ██╔══██╗██╔══██╗██╔════╝██║██╔════╝ --
-- ██████╔╝███████║███████╗██║██║      --
-- ██╔══██╗██╔══██║╚════██║██║██║      --
-- ██████╔╝██║  ██║███████║██║╚██████╗ --
-- ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝ ╚═════╝ --
-- =================================== --

vim.cmd('autocmd!')
vim.opt.laststatus = 2
vim.opt.shell = '/usr/bin/fish'
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.inccommand = 'split'
vim.api.nvim_create_autocmd('InsertLeave', {
    pattern = '*',
    command = 'set nopaste'
})
-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }


-- ================================================================= --
-- ███████╗███╗   ██╗ ██████╗ ██████╗ ██████╗ ██╗███╗   ██╗ ██████╗  --
-- ██╔════╝████╗  ██║██╔════╝██╔═══██╗██╔══██╗██║████╗  ██║██╔════╝  --
-- █████╗  ██╔██╗ ██║██║     ██║   ██║██║  ██║██║██╔██╗ ██║██║  ███╗ --
-- ██╔══╝  ██║╚██╗██║██║     ██║   ██║██║  ██║██║██║╚██╗██║██║   ██║ --
-- ███████╗██║ ╚████║╚██████╗╚██████╔╝██████╔╝██║██║ ╚████║╚██████╔╝ --
-- ╚══════╝╚═╝  ╚═══╝ ╚═════╝ ╚═════╝ ╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝  --
-- ================================================================= --

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- ==================================================================== --
--  ██████╗██╗     ██╗██████╗ ██████╗  ██████╗  █████╗ ██████╗ ██████╗  --
-- ██╔════╝██║     ██║██╔══██╗██╔══██╗██╔═══██╗██╔══██╗██╔══██╗██╔══██╗ --
-- ██║     ██║     ██║██████╔╝██████╔╝██║   ██║███████║██████╔╝██║  ██║ --
-- ██║     ██║     ██║██╔═══╝ ██╔══██╗██║   ██║██╔══██║██╔══██╗██║  ██║ --
-- ╚██████╗███████╗██║██║     ██████╔╝╚██████╔╝██║  ██║██║  ██║██████╔╝ --
--  ╚═════╝╚══════╝╚═╝╚═╝     ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝  --
-- ==================================================================== --


vim.opt.clipboard:append { 'unnamedplus' }  -- Use system clipboard
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }  -- Completion options
vim.opt.mouse = 'a'  -- Enable mouse support

-- ================================================ --
-- ██╗███╗   ██╗██████╗ ███████╗███╗   ██╗████████╗ --
-- ██║████╗  ██║██╔══██╗██╔════╝████╗  ██║╚══██╔══╝ --
-- ██║██╔██╗ ██║██║  ██║█████╗  ██╔██╗ ██║   ██║    --
-- ██║██║╚██╗██║██║  ██║██╔══╝  ██║╚██╗██║   ██║    --
-- ██║██║ ╚████║██████╔╝███████╗██║ ╚████║   ██║    --
-- ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝╚═╝  ╚═══╝   ╚═╝    --
-- ================================================ --


vim.opt.tabstop = 4        -- Number of spaces tabs count for
vim.opt.softtabstop = 4    -- Number of spaces for soft tabs
vim.opt.shiftwidth = 4     -- Size of an indent
vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.ai = true         -- Auto indent
vim.opt.si = true         -- Smart indent
vim.opt.wrap = false      -- No wrap line
vim.opt.smarttab = true   -- Smart handling of tab key
vim.opt.breakindent = true -- Preserve indent on line wraps
vim.opt.backspace = 'start,eol,indent'  -- Backspace behavior

-- ============================================= --
-- ██╗   ██╗██╗███████╗██╗   ██╗ █████╗ ██╗      --
-- ██║   ██║██║██╔════╝██║   ██║██╔══██╗██║      --
-- ██║   ██║██║███████╗██║   ██║███████║██║      --
-- ╚██╗ ██╔╝██║╚════██║██║   ██║██╔══██║██║      --
--  ╚████╔╝ ██║███████║╚██████╔╝██║  ██║███████╗ --
--   ╚═══╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝ --
-- ============================================= --


vim.wo.number = true       -- Show line numbers
vim.opt.title = true      -- Show file title
-- vim.opt.relativenumber = true
vim.opt.cursorline = true -- Highlight current line
vim.opt.signcolumn = 'yes' -- Left columns for showing errors.
vim.opt.splitbelow = true -- Horizontal splits below
vim.opt.splitright = true -- Vertical splits to the right
vim.opt.termguicolors = true  -- True color support
vim.opt.showmode = false   -- Show mode under the bar
vim.opt.cc = '80'         -- Show column guide at 80 characters
vim.opt.scrolloff = 10    -- Lines of context above/below cursor
vim.opt.winblend = 0      -- Window transparency
vim.opt.wildoptions = 'pum'  -- Popup menu for wildcards
vim.opt.pumblend = 5      -- Popup menu transparency
vim.opt.background = 'dark'  -- Dark background

-- ================================================ --
-- ███████╗███████╗ █████╗ ██████╗  ██████╗██╗  ██╗ --
-- ██╔════╝██╔════╝██╔══██╗██╔══██╗██╔════╝██║  ██║ --
-- ███████╗█████╗  ███████║██████╔╝██║     ███████║ --
-- ╚════██║██╔══╝  ██╔══██║██╔══██╗██║     ██╔══██║ --
-- ███████║███████╗██║  ██║██║  ██║╚██████╗██║  ██║ --
-- ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝ --
-- ================================================ --

vim.opt.incsearch = true   -- Show search matches as you type
vim.opt.hlsearch = true    -- Highlight search results
vim.opt.ignorecase = true  -- Case insensitive search
vim.opt.smartcase = true   -- Case sensitive if uppercase present
vim.opt.backup = false     -- Don't create backup files
vim.opt.backupskip = '/tmp/*,/private/tmp/*'  -- Skip backup for temp files
vim.opt.path:append { '**' }  -- Finding files - Search in subfolders
vim.opt.wildignore:append { '*/node_modules/*' }  -- Ignore node_modules in search

-- ================================== --
-- ████████╗███████╗██╗  ██╗████████╗ --
-- ╚══██╔══╝██╔════╝╚██╗██╔╝╚══██╔══╝ --
--    ██║   █████╗   ╚███╔╝    ██║    --
--    ██║   ██╔══╝   ██╔██╗    ██║    --
--    ██║   ███████╗██╔╝ ██╗   ██║    --
--    ╚═╝   ╚══════╝╚═╝  ╚═╝   ╚═╝    --
-- ================================== --

-- Enable undercurl
vim.cmd[[let &t_Cs = "\e[4:3m"]]
vim.cmd[[let &t_Ce = "\e[4:0m"]]
-- Enable italics
vim.cmd[[let &t_ZH = "\e[3m"]]
vim.cmd[[let &t_ZR = "\e[23m"]]


-- ============================== --
-- ███╗   ███╗██╗███████╗ ██████╗ --
-- ████╗ ████║██║██╔════╝██╔════╝ --
-- ██╔████╔██║██║███████╗██║      --
-- ██║╚██╔╝██║██║╚════██║██║      --
-- ██║ ╚═╝ ██║██║███████║╚██████╗ --
-- ╚═╝     ╚═╝╚═╝╚══════╝ ╚═════╝ --
-- ============================== --


vim.opt.completeopt = 'menuone,noinsert'  -- Completion behavior
vim.g.python_host_prog = '/usr/bin/python3'  -- Python host program path
vim.opt.lazyredraw = false    -- Giảm render khi chạy macro
vim.opt.ttyfast = true       -- Tối ưu cho terminal hiện đại
vim.g.loaded_netrw = 1  -- Disable Netrw
vim.g.loaded_netrwPlugin = 1  -- Disable Netrw
