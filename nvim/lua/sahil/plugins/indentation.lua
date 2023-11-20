require("ibl").setup({
  indent = { char = "│" },
  whitespace = {
    -- highlight = highlight,
    -- remove_blankline_trail = false,
  },
  scope = { enabled = false },
  -- highlight = highlight,
})

-- local highlight = {
--   "CursorColumn",
--   "Whitespace",
-- }

-- require("ibl").setup({
--   -- for example, context is off by default, use this to turn it on
--   --show_current_context = true,
--   --
--   char_blankline = "│",
--   use_treesitter = false,
--   buftype_exclude = { "terminal" },
--   filetype_exclude = { "dashboard", "NvimTree", "packer", "mason" },
--   show_trailing_blankline_indent = false,
--   show_first_indent_level = true,
--   show_current_context = false,
--   show_current_context_start = false,
-- })
