-- OPTIONS
vim.opt.relativenumber = true
vim.opt.tabstop = 4;
vim.opt.softtabstop = 4;
vim.opt.shiftwidth = 4;
vim.g.mapleader = ' '

vim.keymap.set("n", "<leader>w", ":w!<CR>")
vim.keymap.set("n", "<leader>q", ":q!<CR>")
vim.keymap.set("n", "<leader>nh", ":nohlsearch<CR>")

-- <leader>x for executing anything

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

-- PLUGIN SETUP
require("lazy").setup({

	{ 
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000 ,
		config = function()
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
					functions = {"bold", "italic"},
					keywords = {"bold"},
					strings = {},
					variables = {"bold"},
					numbers = {},
					booleans = {},
					properties = {},
					types = {"italic"},
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
		end
	},

	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			vim.cmd([[colorscheme tokyonight-night]])
		end
	},

	{ 
		"lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {},
		config = function() 
			require("ibl").setup {
				indent = { char = "│" },
				whitespace = {
					remove_blankline_trail = false,
				},
				scope = { enabled = false },
			}
		end
	},

	{
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		dependencies = { 'nvim-lua/plenary.nvim' },

		keys = {
			{mode = 'n', '<leader>ff', ":lua require('telescope.builtin').find_files()<CR>",desc= ""},
			{mode = 'n', '<leader>fs', ":lua require('telescope.builtin').live_grep()<CR>", desc = ""},
			-- {mode = 'n', '<leader>fb', ":lua require('telescope.builtin').buffers()<CR>", desc = ""},
			{mode = 'n', '<leader>fh', ":lua require('telescope.builtin').help_tags()<CR>", desc=""},
		},
		config = function() 
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
		end
	},

	{
		"cohama/lexima.vim", -- autopairing
	},

	{
		"ThePrimeagen/harpoon",
		dependencies = {"nvim-lua/plenary.nvim"},
		keys = {
			{mode = 'n', "<leader>mm", ":lua require(\"harpoon.mark\").add_file()<CR>", desc = "Mark a file using Harpoon"},
			{mode = 'n', "<C-e>", ":lua require(\"harpoon.ui\").toggle_quick_menu()<CR>", desc = "Toggle quick menu"},
			{mode = 'n', "<leader>1", ":lua require(\"harpoon.ui\").nav_file(3)<CR>", desc = "Toggle to file 1"},
			{mode = 'n', "<leader>2", ":lua require(\"harpoon.ui\").nav_file(2)<CR>", desc = "Toggle to file 2"},
			{mode = 'n', "<leader>3", ":lua require(\"harpoon.ui\").nav_file(3)<CR>", desc = "Toggle to file 3"},
			{mode = 'n', "<leader>4", ":lua require(\"harpoon.ui\").nav_file(4)<CR>", desc = "Toggle to file 4"},
			{mode = 'n', "<leader>5", ":lua require(\"harpoon.ui\").nav_file(5)<CR>", desc = "Toggle to file 5"},
		},
	},

	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},

		keys = {
			{mode = 'n', '<leader>e', ":NvimTreeFindFileToggle<CR>",desc= "Toggle nvim-tree"},
		},
		config = function()
			require("nvim-tree").setup ({
				view = {
					width = 30,
				},
			})
		end,
	},

	{
		'christoomey/vim-tmux-navigator',
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",

		config = function () 
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				auto_install = false, -- don't automatically install the parsers
				ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },  
			})
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"L3MON4D3/LuaSnip",
			'saadparwaiz1/cmp_luasnip',
		},

	},

	-- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
	{
		'numToStr/Comment.nvim',
		opts = {},
		lazy = false,
		config = function()
			require("Comment").setup()
		end
	},

})
