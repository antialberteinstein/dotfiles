local status, noice = pcall(require, 'noice')
if not status then return end

noice.setup({
  -- Cấu hình tối giản nhưng xinh xắn
  cmdline = {
    view = "cmdline_popup",
    format = {
      cmdline = { pattern = "^:", icon = "󰘳 ", lang = "vim" },
      search_down = { kind = "search", pattern = "^/", icon = "🔍 ", lang = "regex" },
      search_up = { kind = "search", pattern = "^%?", icon = "🔍 ", lang = "regex" },
      filter = { pattern = "^:%s*!", icon = "$ ", lang = "bash" },
    },
  },

  -- Thông báo nhỏ nhẹ
  messages = {
    view = "mini",
    view_error = "notify",
    view_warn = "notify",
  },

  -- LSP thông tin gọn gàng
  lsp = {
    override = {
      "vim.lsp.util.convert_input_to_markdown_lines",
      "vim.lsp.util.stylize_markdown",
      "cmp.entry.get_documentation",
    },
    hover = {
      enabled = true,
      silent = false,
    },
    signature = {
      enabled = true,
      auto_open = {
        enabled = true,
        trigger = true,
        luasnip = true,
        throttle = 50,
      },
    },
  },

  -- Preset xinh xắn
  presets = {
    bottom_search = false,         -- Tìm kiếm ở dưới
    command_palette = true,       -- Bảng lệnh đẹp
    long_message_to_split = true, -- Chia nhỏ tin nhắn dài
    inc_rename = true,            -- Đổi tên với giao diện đẹp
    lsp_doc_border = true,        -- Thêm viền cho docs LSP
  },

  -- Giao diện popup nhỏ nhắn
  views = {
    cmdline_popup = {
      position = {
        row = 5,
        col = "50%",
      },
      size = {
        width = 60,
        height = "auto",
      },
      border = {
        style = "rounded",
        padding = { 0, 1 },
      },
    },
    popupmenu = {
      relative = "cmdline_popup",
      position = {
        row = 8,
        col = "50%",
      },
      size = {
        width = 60,
        height = 10,
      },
      border = {
        style = "rounded",
        padding = { 1, 1 },
      },
      win_options = {
        winhighlight = { 
          Normal = "Normal", 
          FloatBorder = "DiagnosticInfo" 
        },
      },
    },
  },

  -- Tắt một số thông báo không cần thiết
  routes = {
    {
      filter = {
        event = "msg_show",
        kind = "",
        find = "written",
      },
      opts = { skip = true },
    },
    {
      filter = {
        event = "msg_show",
        find = "%d+L, %d+B",
      },
      view = "mini",
    },
  },
})

-- Phím tắt tiện lợi
vim.keymap.set("n", "<leader>nd", function()
  require("noice").cmd("dismiss")
end, { desc = "Dismiss Noice Messages" })

vim.keymap.set("n", "<leader>nh", function()
  require("noice").cmd("history")
end, { desc = "Noice History" })

vim.keymap.set("n", "<C-f>", function()
  if not require("noice.lsp").scroll(4) then
    return "<C-f>"
  end
end, { silent = true, expr = true })

vim.keymap.set("n", "<C-b>", function()
  if not require("noice.lsp").scroll(-4) then
    return "<C-b>"
  end
end, { silent = true, expr = true })
