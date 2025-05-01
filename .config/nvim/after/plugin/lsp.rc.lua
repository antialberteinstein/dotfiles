-- Cấu hình chung cho LSP
local status1, lspconfig = pcall(require, 'lspconfig')
local status2, mason = pcall(require, 'mason')
local status3, mason_lspconfig = pcall(require, 'mason-lspconfig')
local status4, neodev = pcall(require, 'neodev')
local status5, navic = pcall(require, 'nvim-navic')

if not status1 or not status2 or not status3 or not status4
    or not status5 then
    return
end


-- Cấu hình Neodev (hỗ trợ Lua/Neovim)
neodev.setup({
    library = { plugins = { "nvim-dap-ui" }, types = true },
})

-- Cấu hình Mason
mason.setup({
    ui = {
        border = "rounded",
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

-- Cấu hình Mason-LSPConfig
mason_lspconfig.setup({
    ensure_installed = {
        "lua_ls",      -- Lua
        "pyright",     -- Python
        "html",        -- HTML
        "cssls",       -- CSS
        "jsonls",      -- JSON
    },
    automatic_installation = true,
})

-- Thiết lập biến toàn cục để sử dụng với nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Hàm được gọi khi một language server được gắn vào buffer
local on_attach = function(client, bufnr)
    -- Các phím tắt
    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- Định nghĩa các key mapping cho LSP
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, opts)

    -- Thiết lập navic (breadcrumb)
    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end
end

-- Thiết lập cho từng language server
mason_lspconfig.setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })
    end,

    -- Thiết lập riêng cho từng server (nếu cần)
    ["lua_ls"] = function()
        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" }
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                        checkThirdParty = false
                    },
                    telemetry = {
                        enable = false
                    }
                }
            }
        })
    end,
})

-- Thiết lập cho Fidget (thông báo LSP)
require('fidget').setup({
    text = {
        spinner = "pipe",
    },
    window = {
        blend = 0,
    },
})

-- Thiết lập cho Trouble (hiển thị lỗi)
require('trouble').setup({
    position = "bottom",
    icons = true,
    mode = "workspace_diagnostics",
    action_keys = {
        close = "q",
        cancel = "<esc>",
        refresh = "r",
        jump = { "<cr>", "<tab>" },
        toggle_mode = "m",
        toggle_preview = "P",
        hover = "K",
        preview = "p",
        close_folds = { "zM", "zm" },
        open_folds = { "zR", "zr" },
        toggle_fold = { "zA", "za" },
        previous = "k",
        next = "j"
    },
    indent_lines = true,
    auto_open = false,
    auto_close = false,
    auto_preview = true,
    auto_fold = false,
    signs = {
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "﫠"
    },
    use_diagnostic_signs = false
})

-- Key mapping cho Trouble
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { silent = true, noremap = true })

-- Thiết lập cho nvim-code-action-menu
vim.keymap.set('n', '<leader>ca', '<cmd>CodeActionMenu<CR>', { noremap = true, silent = true })

-- Thiết lập thanh breadcrumb
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
