local status, comment = pcall(require, 'Comment')
if not status then return end

comment.setup({
    -- Add pre and post hooks for JSX/TSX commenting
    pre_hook = function(ctx)
        -- Check if we have a plugin for context-aware commenting
        local U = require("Comment.utils")
        
        -- Determine whether to use linewise or blockwise commenting
        local location = nil
        if ctx.ctype == U.ctype.linewise then
            location = require("ts_context_commentstring.utils").get_cursor_location()
        elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
            location = require("ts_context_commentstring.utils").get_visual_start_location()
        end

        -- Try to load ts_context_commentstring for better JSX/TSX support
        local status_ok, ts_context = pcall(require, "ts_context_commentstring.internal")
        if status_ok then
            return ts_context.calculate_commentstring {
                key = ctx.ctype == U.ctype.linewise and "__default" or "__multiline",
                location = location,
            }
        end
    end,
    
    -- Enable sticky commenting (cursor stays in same column after commenting)
    sticky = true,
    
    -- Add keyboard shortcut to comment current line
    -- These are built-in defaults, but good to know:
    -- gcc: Comment current line
    -- gbc: Comment current block
    -- gc{motion}: Comment motion (like gc3j to comment 3 lines down)
    -- gb{motion}: Comment block for motion
    
    -- Mappings in NORMAL mode
    toggler = {
        line = 'gcc',  -- Line-comment toggle
        block = 'gbc', -- Block-comment toggle
    },
    
    -- Mappings in VISUAL mode
    opleader = {
        line = 'gc',   -- Line-comment operator
        block = 'gb',  -- Block-comment operator
    },
})

-- Ctrl+/ mappings for commenting (like in most modern editors)
-- Note: In terminal, Ctrl+/ might register as Ctrl+_ 
vim.keymap.set('n', '<C-/>', '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>', 
    { desc = "Toggle comment current line" })
vim.keymap.set('n', '<C-_>', '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>', 
    { desc = "Toggle comment current line (terminal)" })
    
vim.keymap.set('v', '<C-/>', '<ESC><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', 
    { desc = "Toggle comment selection" })
vim.keymap.set('v', '<C-_>', '<ESC><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', 
    { desc = "Toggle comment selection (terminal)" })

-- Allow commenting from insert mode too (like VS Code)
vim.keymap.set('i', '<C-/>', '<ESC><cmd>lua require("Comment.api").toggle.linewise.current()<CR>i', 
    { desc = "Toggle comment current line" })
vim.keymap.set('i', '<C-_>', '<ESC><cmd>lua require("Comment.api").toggle.linewise.current()<CR>i', 
    { desc = "Toggle comment current line (terminal)" })
