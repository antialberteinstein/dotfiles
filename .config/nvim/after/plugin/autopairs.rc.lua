local status, autopairs = pcall(require, 'nvim-autopairs')

if not status then return end

-- Cấu hình autopairs
autopairs.setup({
    check_ts = true,  -- Kiểm tra treesitter
    ts_config = {
        lua = {'string'},
        javascript = {'template_string'},
    },
    disable_filetype = { "TelescopePrompt" },
    fast_wrap = {
        map = "<M-e>",  -- Alt+e để wrap nhanh
        chars = { "{", "[", "(", '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        offset = 0,
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "PmenuSel",
        highlight_grey = "LineNr",
    },
})

local cmp_exist, cmp = pcall(require, 'cmp')

if not cmp_exist then return end

-- Tích hợp autopairs với cmp
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)
