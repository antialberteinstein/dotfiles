if not vim.g.neovide then return end

-- 🖋 Font: Professional, legible for code
vim.o.guifont = "JetBrainsMono Nerd Font:h14" -- Slightly larger for modern displays

-- 🌟 Opacity: Translucent to see background
vim.g.neovide_transparency = 0.90 -- Use `neovide_transparency` instead of opacity for newer versions usually
-- Fallback if version usage differs
vim.g.neovide_opacity = 0.90

-- ✨ Cursor: Smooth and minimal
vim.g.neovide_cursor_animation_length = 0.05
vim.g.neovide_cursor_trail_length = 0.1
vim.g.neovide_cursor_antialiasing = true
vim.g.neovide_cursor_vfx_mode = "sonicboom" -- "ripple", "wireframe", "pixiedust", "sonicboom", "railgun", "torpedo"

-- 🪟 Window: Blurred background
vim.g.neovide_window_blurred = true
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0

-- Decor
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_confirm_quit = true

-- MacOS specific
vim.g.neovide_input_macos_alt_is_meta = true -- Use Option as Meta if needed
vim.g.neovide_input_use_logo = true -- Enable use of Command key (Logo)
