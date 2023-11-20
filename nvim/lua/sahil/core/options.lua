local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)
opt.ruler = false
opt.cmdheight = 0
opt.background = "dark"
-- vim.cmd([[colorscheme gruvbox]])

-- tabs & indentation
opt.tabstop = 4 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 4 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.syntax = "on"

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = false -- highlight the current cursor line

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
-- opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "no" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register
-- this is why all the vim selections are in the system clipboard
-- and therefore accessible using ctrl+v (ctrl+shift+v for terminal), and middle button

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom
opt.pumheight = 12
opt.conceallevel = 1
opt.guicursor = "i:block"

opt.hlsearch = true
opt.incsearch = true
opt.scrolloff = 8
-- vim.g.markdown_folding = 1 -- for folding markdown headings
opt.guicursor =
  "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
--
-- vim.g.clang_format = llvm

local cpp_formating_group = vim.api.nvim_create_augroup("CppFormatingWithClangd", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  group = cpp_formating_group,
  callback = function(args)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = args.buf,
      group = cpp_formating_group,
      callback = function()
        if not string.find(vim.fn.expand("%:p"), "/home/sahil/libreoffice") then
          vim.lsp.buf.format({ async = false, bufnr = args.buf })
        end
      end,
    })
  end,
})

local indent_blankline_group = vim.api.nvim_create_augroup("DisableIndentBlanklineForNorg", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = "norg",
  group = indent_blankline_group,
  callback = function(args)
    vim.api.nvim_create_autocmd("BufEnter", {
      buffer = args.buf,
      group = indent_blankline_group,
      callback = function()
        vim.cmd("IBLDisable")
      end,
    })
  end,
})
