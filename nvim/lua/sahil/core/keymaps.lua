-- set leader key to space
vim.api.nvim_create_autocmd("filetype", {
  pattern = "markdown",
  callback = function()
    vim.opt.shiftwidth = 4
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
  end,
})
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode

-- keymap.set(
--   "n",
--   "<leader>tm",
-- ":! cd /home/sahil/gautamsahil1947/SFML-GameDevelopement-using-Modern-C++/project2/ && g++ Main.cpp -lsfml-graphics -lsfml-window -lsfml-system -lsfml-audio && ./a.out<CR>"
-- )

-- keymap.set(
--   "n",
--   "<leader>tm",
--   ":! cd /home/sahil/.config/repos/studies/src && g++ -std=c++20 cpp.cpp -o cpp -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion -Wshadow && ./cpp <CR>"
-- )

--------------------------------- The Name is The Primeagen ------------------
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "<leader>y", '"+y')
keymap.set("v", "<leader>y", '"+y')
keymap.set("n", "<leader>Y", '"+Y')

-- keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
keymap.set("n", "<leader>x", "<cmd>!lua %<CR>", { silent = true })

keymap.set(
  "n",
  "<leader>tm",
  "<cmd>!g++ -std=c++20 -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion -Wshadow -pedantic-errors  % -o exe && ./exe<CR>",
  { silent = true }
)

--
--
--

-- keymap.set("n", "<leader>tm", "<cmd>!gcc  % -o exe && ./exe<CR>", { silent = true })

keymap.set(
  "n",
  "<leader>;",
  ":! cd /home/sahil/.config/repos/studies/cpp/ && rm -f exe && make 1>/dev/null && ./exe<CR>",
  { silent = true }
)
--------------------------------- The Name is The Primeagen ------------------

keymap.set("n", "<leader>no", "<cmd>Neorg workspace notes<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>mt", ":! cd /home/sahil/.config/repos/studies/src && python python.py<CR>")
keymap.set("n", "<leader>mp", ":MarkdownPreviewToggle<CR>")
-- clear search highlights

keymap.set("n", "<leader>nh", ":nohlsearch<CR>")
keymap.set("n", "<leader>s", ":source %<CR>")
keymap.set("n", "<leader>q", ":q<CR>")
keymap.set("n", "<leader>w", ":w!<CR>")
-- keymap.set("n", "z", ":ToggleTerm<CR>")
-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
-- keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- https://github.com/nvim-telescope/telescope.nvim/issues/2024 (source github)
-- while fuzzy finding a string, remember where i was
local telescope = require("telescope.builtin")
local telescope_last = 0
function G_telescope_resume()
  if telescope_last == 0 then
    telescope_last = 1
    telescope.live_grep()
  else
    telescope.resume()
  end
end
vim.keymap.set("n", " fs", G_telescope_resume)
