-- Cấu hình chung cho LSP
local status1, lspconfig = pcall(require, 'lspconfig')
local status2, mason = pcall(require, 'mason')
local status3, mason_lspconfig = pcall(require, 'mason-lspconfig')
local status4, neodev = pcall(require, 'neodev')
local status5, navic = pcall(require, 'nvim-navic')

if not status1 or not status2 or not status3 or not status4 or not status5 then return end

-- Cấu hình Neodev (hỗ trợ Lua/Neovim)
neodev.setup({})

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
    ensure_installed = { "lua_ls", "pyright", "html", "cssls", "jsonls", "ts_ls", "tailwindcss" },
    automatic_installation = true,
})

-- Thiết lập biến toàn cục để sử dụng với nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

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

-- Handlers for servers
local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
}

-- Setup servers using mason-lspconfig (new API)
mason_lspconfig.setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            handlers = handlers
        })
    end,
    
    ["lua_ls"] = function()
        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            handlers = handlers,
            settings = {
                Lua = {
                    diagnostics = { globals = { "vim" } },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                        checkThirdParty = false,
                    },
                    telemetry = { enable = false },
                },
            },
        })
    end,
})

-- Thiết lập thanh breadcrumb
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
