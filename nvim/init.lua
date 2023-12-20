-- Example for configuring Neovim to load user-installed installed Lua rocks:
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"

require("sahil.plugins-setup")
require("sahil.core.options")
require("sahil.core.keymaps")
require("sahil.core.colorscheme")
require("sahil.plugins.comment")
require("sahil.plugins.nvim-tree")
-- require("sahil.plugins.lualine")
require("sahil.plugins.telescope")
require("sahil.plugins.nvim-cmp")
require("sahil.plugins.lsp.mason")
require("sahil.plugins.lsp.lspsaga")
require("sahil.plugins.lsp.lspconfig")
require("sahil.plugins.lsp.null-ls")
require("sahil.plugins.autopairs")
require("sahil.plugins.gitsigns")
require("sahil.plugins.treesitter")
require("sahil.plugins.harpoon")
require("sahil.plugins.toggleterm")
require("sahil.plugins.indentation")
require("sahil.plugins.nvim-colorizer")
require("sahil.plugins.dap")
-- require("sahil.plugins.image")
-- default config
require("image").setup({
  backend = "kitty",
  integrations = {
    markdown = {
      enabled = true,
      clear_in_insert_mode = false,
      download_remote_images = true,
      only_render_image_at_cursor = false,
      filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
    },
    neorg = {
      enabled = true,
      clear_in_insert_mode = false,
      download_remote_images = true,
      only_render_image_at_cursor = false,
      filetypes = { "norg" },
    },
  },
  max_width = nil,
  max_height = nil,
  max_width_window_percentage = nil,
  max_height_window_percentage = 50,
  window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
  window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
  editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
  tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
  hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" }, -- render image files as images when opened
})
