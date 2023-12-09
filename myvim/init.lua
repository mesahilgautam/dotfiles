-- Options

vim.opt.relativenumber = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"


-- Keymaps

vim.g.mapleader = " "
-- Basic Keymaps
vim.keymap.set("n", "<leader>w", ":w!<CR>") -- write
vim.keymap.set("n", "<leader>q", ":q!<CR>") -- quit
vim.keymap.set("n", "<leader>nh", ":nohlsearch<CR>") -- nohlsearch
vim.keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<CR>") -- nohlsearch
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>") -- Split in 2 vertical halves
vim.keymap.set("n", "<leader>sh", ":split<CR>") -- Split in 2 horizontal halves
vim.keymap.set("n", "z", ":ToggleTerm<CR>") -- Split in 2 horizontal halves
vim.keymap.set("n", "<leader>mp", ":MarkdownPreviewToggle<CR>") -- Split in 2 horizontal halves

-- Harpoon Keymaps
vim.keymap.set("n", "<leader>mm", ":lua require(\"harpoon.mark\").add_file()<CR>")
vim.keymap.set("n", "<C-e>", ":lua require(\"harpoon.ui\").toggle_quick_menu()<CR>")
vim.keymap.set("n", "<leader>1", ":lua require(\"harpoon.ui\").nav_file(1)<CR>")
vim.keymap.set("n", "<leader>2", ":lua require(\"harpoon.ui\").nav_file(2)<CR>")
vim.keymap.set("n", "<leader>3", ":lua require(\"harpoon.ui\").nav_file(3)<CR>")
vim.keymap.set("n", "<leader>4", ":lua require(\"harpoon.ui\").nav_file(4)<CR>")
vim.keymap.set("n", "<leader>5", ":lua require(\"harpoon.ui\").nav_file(5)<CR>")

-- Telescope Keymaps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

--====================================================================================================
--                                                   _             _
--                                             _ __ | |_   _  __ _(_)_ __  ___
--                                            | '_ \| | | | |/ _` | | '_ \/ __|
--                                            | |_) | | |_| | (_| | | | | \__ \
--                                            | .__/|_|\__,_|\__, |_|_| |_|___/
--                                            |_|            |___/
--
--====================================================================================================
-- https://github.com/folke/lazy.nvim to read more about lazy nvim and various options
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- treesitter
-- comment on gc
-- vim-maximizer
-- "jghauser/follow-md-links.nvim",
-- markdown preview
-- toggleterm
-- nvim colorizer

require("lazy").setup({

	disabled_plugins = {
		"nvim-treesitter",
	},

	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },

	{
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		--		config = function()
		--			require("nvim-tree").setup {}
		--		end,
	},
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	{"christoomey/vim-tmux-navigator"},
	{"ThePrimeagen/harpoon",
		dependencies = {"nvim-lua/plenary.nvim"},

	},
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {} -- this is equalent to setup({}) function
	},
	{"norcalli/nvim-colorizer.lua"},

	{'akinsho/toggleterm.nvim', version = "*", config = true},
	{'tpope/vim-commentary'},

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function() vim.fn["mkdp#util#install"]() end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function () 
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				-- enable syntax highlighting
				highlight = {
					enable = true,
				},
				-- enable indentation
				indent = { enable = false },
				-- enable autotagging (w/ nvim-ts-autotag plugin)
				autotag = { enable = true },
				-- ensure these language parsers are installed
				ensure_installed = {
					"json",
					"javascript",
					"typescript",
					"tsx",
					"yaml",
					"html",
					"css",
					"markdown",
					"markdown_inline",
					"svelte",
					"graphql",
					"bash",
					"lua",
					"vim",
					"dockerfile",
					"gitignore",
				},
				-- auto install above language parsers
				auto_install = true,
			})
		end
	},
})

-- ==========================================================================================================
--                                    _             _                          __ _
--                              _ __ | |_   _  __ _(_)_ __     ___ ___  _ __  / _(_) __ _
--                             | '_ \| | | | |/ _` | | '_ \   / __/ _ \| '_ \| |_| |/ _` |
--                             | |_) | | |_| | (_| | | | | | | (_| (_) | | | |  _| | (_| |
--                             | .__/|_|\__,_|\__, |_|_| |_|  \___\___/|_| |_|_| |_|\__, |
--                             |_|            |___/                                 |___/
--
-- ==========================================================================================================

require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = { -- :h background
	light = "latte",
	dark = "mocha",
},
transparent_background = true, -- disables setting the background color.
show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
dim_inactive = {
	enabled = false, -- dims the background color of inactive window
	shade = "dark",
	percentage = 0.15, -- percentage of the shade to apply to the inactive window
},
no_italic = false, -- Force no italic
no_bold = false, -- Force no bold
no_underline = false, -- Force no underline
styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
comments = { "italic" }, -- Change the style of comments
conditionals = { "italic" },
loops = {},
functions = {},
keywords = {},
strings = {},
variables = {},
numbers = {},
booleans = {},
properties = {},
types = {},
operators = {},
	},
	color_overrides = {},
	custom_highlights = {},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
		notify = false,
		mini = {
			enabled = true,
			indentscope_color = "",
		},
		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	},
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"

-- To be changed Later (size, orientation etc)
require('telescope').setup{
	defaults = {
		-- Default configuration for telescope goes here:
		-- config_key = value,
		mappings = {
			i = {
				-- map actions.which_key to <C-h> (default: <C-/>)
				-- actions.which_key shows the mappings for your picker,
				-- e.g. git_{create, delete, ...}_branch for the git_branches picker
				["<C-h>"] = "which_key"
			}
		}
	},
	pickers = {
		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
	},
	extensions = {
		-- Your extension configuration goes here:
		-- extension_name = {
		--   extension_config_key = value,
		-- }
		-- please take a look at the readme of the extension you want to configure
	}
}




-- OR setup with some options
require("nvim-tree").setup({
	--  sort = {
	--    sorter = "case_sensitive",
	--  },
	view = {
		width = 30,
	},
	--  renderer = {
	--    group_empty = true,
	--  },
	--  filters = {
	--    dotfiles = true,
	--  },
})


require("ibl").setup {
	indent = { char = "│" },
	scope = { enabled = false },
}

-- more customization options are available, if needed
require 'colorizer'.setup {
	'css';
	'javascript';
	'markdown';
	html = {
		mode = 'foreground';
	},
}



require("toggleterm").setup({
	size = 10,
	open_mapping = [[<c-\>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

function _G.set_terminal_keymaps()
	local opts = { noremap = true }
	vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()") -- all thanks to neovim-from-scratch :)
