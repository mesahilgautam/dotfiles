local opt = vim.opt

opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)
opt.ruler = false
opt.cmdheight = 0
opt.background = "dark"
opt.fillchars = "fold: "
opt.tabstop = 4 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 4 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.syntax = "on"
opt.wrap = false -- disable line wrapping
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
opt.cursorline = false -- highlight the current cursor line
opt.termguicolors = true
opt.signcolumn = "no" -- show sign column so that text doesn't shift
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position
opt.clipboard:append("unnamedplus") -- use system clipboard as default register
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom
opt.pumheight = 12
opt.conceallevel = 3
opt.guicursor = "i:block"
opt.hlsearch = true
opt.incsearch = true
opt.scrolloff = 8
-- vim.g.markdown_folding = 1
opt.guicursor =
	"n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
vim.opt.pumheight = 12

vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness
keymap.set("n", "<leader>w", ":w!<CR>")
keymap.set("n", "<leader>q", ":q!<CR>")
keymap.set("n", "<leader>nh", ":nohlsearch<CR>")
keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<CR>")
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "<leader>y", '"+y')
keymap.set("v", "<leader>y", '"+y')
keymap.set("n", "<leader>Y", '"+Y')
keymap.set("n", "q", ":MaximizerToggle!<CR>")
keymap.set("n", "<leader>mp", ":MarkdownPreviewToggle<CR>")
keymap.set("n", "<leader>s", ":source %<CR>")
keymap.set("n", "z", ":ToggleTerm<CR>")

keymap.set("n", "<leader>sv", ":vsplit<CR>")
keymap.set("n", "<leader>sh", ":split<CR>")

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary
keymap.set("n", "q", ":MaximizerToggle!<CR>") -- mapping to restart lsp if necessary

function ExecuteCurrentFileProgram()
	local file_extension = vim.fn.expand("%:e")

	if file_extension == "cpp" then
		vim.cmd(
			"!g++ -std=c++20 -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion -Wshadow -pedantic-errors  % -o exe && ./exe"
		)
	elseif file_extension == "c" then
		vim.cmd("!gcc -Wall -Wextra -Wconversion -Wsign-conversion -Wshadow -pedantic-errors  % -o exe && ./exe")
	elseif file_extension == "cxx" then
		vim.cmd(
			"!g++ -std=c++20 -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion -Wshadow -pedantic-errors  % -o exe && ./exe"
		)
	elseif file_extension == "py" then
		vim.cmd("!python %")
	elseif file_extension == "lua" then
		vim.cmd("!lua %")
	elseif file_extension == "go" then
		vim.cmd("!go run %")
	elseif file_extension == "sh" then
		vim.cmd("!sh %")
	elseif file_extension == "yaml" then
		vim.cmd("!yaml-parser %")
	elseif file_extension == "yml" then
		vim.cmd("!yaml-parser %")
	else
		print("Unsupported file type")
	end
end

-- Bind the function to leader + X
vim.api.nvim_set_keymap("n", "<leader>x", ":lua ExecuteCurrentFileProgram()<CR>", { noremap = true, silent = true })

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
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				background = { -- :h background
					light = "latte",
					dark = "mocha",
				},
				transparent_background = true, -- disables setting the background color.
				show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
				term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
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
					conditionals = {},
					loops = {},
					functions = { "bold" },
					keywords = { "bold" },
					strings = {},
					variables = { "bold" },
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
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",

		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				auto_install = true, -- don't automatically install the parsers
				ensure_installed = {
					"c",
					"cpp",
					"markdown",
					"lua",
					"vim",
					"vimdoc",
					"go",
					"python",
					"java",
					"bash",
					"html",
				},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = false },
			})
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		config = function()
			require("ibl").setup({
				indent = { char = "│" },
				whitespace = {
					remove_blankline_trail = false,
				},
				scope = { enabled = false },
			})
		end,
	},

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },

		keys = {
			{ mode = "n", "<leader>ff", ":lua require('telescope.builtin').find_files()<CR>", desc = "" },
			{ mode = "n", "<leader>fs", ":lua require('telescope.builtin').live_grep()<CR>", desc = "" },
			-- {mode = 'n', '<leader>fb', ":lua require('telescope.builtin').buffers()<CR>", desc = ""},
			{ mode = "n", "<leader>fh", ":lua require('telescope.builtin').help_tags()<CR>", desc = "" },
		},
		config = function()
			require("telescope").setup({
				defaults = {},
			})

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
		end,
	},

	{
		"cohama/lexima.vim", -- autopairing
	},

	{
		"ThePrimeagen/harpoon",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{
				mode = "n",
				"<leader>mm",
				':lua require("harpoon.mark").add_file()<CR>',
				desc = "Mark a file using Harpoon",
			},
			{ mode = "n", "<C-e>", ':lua require("harpoon.ui").toggle_quick_menu()<CR>', desc = "Toggle quick menu" },
			{ mode = "n", "<leader>1", ':lua require("harpoon.ui").nav_file(1)<CR>', desc = "Toggle to file 1" },
			{ mode = "n", "<leader>2", ':lua require("harpoon.ui").nav_file(2)<CR>', desc = "Toggle to file 2" },
			{ mode = "n", "<leader>3", ':lua require("harpoon.ui").nav_file(3)<CR>', desc = "Toggle to file 3" },
			{ mode = "n", "<leader>4", ':lua require("harpoon.ui").nav_file(4)<CR>', desc = "Toggle to file 4" },
			{ mode = "n", "<leader>5", ':lua require("harpoon.ui").nav_file(5)<CR>', desc = "Toggle to file 5" },
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
			{ mode = "n", "<leader>e", ":NvimTreeFindFileToggle<CR>", desc = "Toggle nvim-tree" },
		},
		config = function()
			require("nvim-tree").setup({
				view = {
					width = 30,
				},
				renderer = {
					icons = {
						glyphs = {
							folder = {
								arrow_closed = "", -- arrow when folder is closed
								arrow_open = "", -- arrow when folder is open
							},
						},
					},
				},

				actions = {
					open_file = {
						window_picker = {
							enable = false,
						},
					},
				},
			})

			local function open_nvim_tree(data)
				-- buffer is a [No Name]
				local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

				-- buffer is a directory
				local directory = vim.fn.isdirectory(data.file) == 1

				if not no_name and not directory then
					return
				end

				-- change to the directory
				if directory then
					vim.cmd.cd(data.file)
				end

				-- open the tree
				require("nvim-tree.api").tree.open()
			end

			vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
		end,
	},

	{
		"christoomey/vim-tmux-navigator",
	},

	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				direction = "float",
				float_opts = {
					border = "curved",
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

			vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
		end,
	},

	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
		lazy = false,
	},

	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		keys = {},
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/nvim-cmp",

			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"onsails/lspkind.nvim",
			"nvimdev/lspsaga.nvim",
		},

		config = function()
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
					completion = {
						scrollbar = false,
					},
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<tab>"] = cmp.mapping.confirm({ select = true }),
				}),

				formatting = {
					format = require("lspkind").cmp_format({
						maxwidth = 20,
						ellipsis_char = "...",
					}),
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- For luasnip users.
					{ name = "buffer" },
					{ name = "path" },
				}),
			})
			require("lspsaga").setup({})
			-- Set up lspconfig.
			local keymap = vim.keymap
			local on_attach = function(client, bufnr)
				local opts = { noremap = true, silent = true, buffer = bufnr }
				keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
				keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
				keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
				keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
				keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
				keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
				keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
				keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
				keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
				keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
				keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
				keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side
				keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
			end

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local servers = {
				"clangd",
				"lua_ls",
				"html",
				"cssls",
				"pyright",
				"bashls",
				"gopls",
				"emmet_ls",
			}

			for _, server in ipairs(servers) do
				require("lspconfig")[server].setup({
					capabilities = capabilities,
					on_attach = on_attach,
				})
			end

			require("lspconfig")["lua_ls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = { -- custom settings for lua
					Lua = {
						-- make the language server recognize "vim" global
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							-- make language server aware of runtime files
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
			"jay-babu/mason-null-ls.nvim",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "bashls" },
			})
			require("mason-null-ls").setup({
				ensure_installed = {
					"prettier", -- ts/js formatter
					"stylua", -- lua formatter
					"eslint_d", -- ts/js linter
					-- "mypy",
					"ruff",
					"black",
					"clang-format",
				},
				-- auto-install configured formatters & linters (with null-ls)
				automatic_installation = true,
			})
		end,
	},

	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
				auto_install = true,
			})
		end,
	},

	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			local null_ls = require("null-ls")

			local formatting = null_ls.builtins.formatting
			local diagnostics = null_ls.builtins.diagnostics
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

			null_ls.setup({
				sources = {
					--  "formatting.prettier.with({disabled_filetypes = {}})" (see null-ls docs)
					formatting.prettier, -- js/ts formatter
					formatting.stylua, -- lua formatter
					formatting.black, -- for python formatting
					-- formatting.clang_format,
					-- diagnostics.mypy,
					diagnostics.ruff,
					diagnostics.eslint_d.with({ -- js/ts linter

						condition = function(utils)
							return utils.root_has_file(".eslintrc.js") -- change file extension if you use something else
						end,
					}),
				},
				-- configure format on save
				on_attach = function(current_client, bufnr)
					if current_client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({
									filter = function(client)
										--  only use null-ls for formatting instead of lsp server
										return client.name == "null-ls"
									end,
									bufnr = bufnr,
								})
							end,
						})
					end
				end,
			})
		end,
	},

	{
		"szw/vim-maximizer",
	},

	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "│" },
					change = { text = "│" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "┆" },
				},
				signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
				numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
				linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
				word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
				watch_gitdir = {
					follow_files = true,
				},
				attach_to_untracked = true,
				current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
					delay = 1000,
					ignore_whitespace = false,
					virt_text_priority = 100,
				},
				current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
				sign_priority = 6,
				update_debounce = 100,
				status_formatter = nil, -- Use default
				max_file_length = 40000, -- Disable if file is longer than this (in lines)
				preview_config = {
					-- Options passed to nvim_open_win
					border = "single",
					style = "minimal",
					relative = "cursor",
					row = 0,
					col = 1,
				},
				yadm = {
					enable = false,
				},
			})
		end,
	},

	{
		"jghauser/follow-md-links.nvim",
	},

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
})

local cpp_formating_group = vim.api.nvim_create_augroup("CppFormatingWithClangd", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = "cpp",
	group = cpp_formating_group,
	callback = function(args)
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = args.buf,
			group = cpp_formating_group,
			callback = function()
				if not string.find(vim.fn.expand("%:p"), "/home/sahil/repos/libreoffice/") then
					vim.lsp.buf.format({ async = false, bufnr = args.buf })
				end
			end,
		})
	end,
})
