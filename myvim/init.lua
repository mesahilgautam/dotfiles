-- OPTIONS
--
local opt = vim.opt

opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)
opt.ruler = false
opt.cmdheight = 0
opt.background = "dark"
opt.fillchars = "fold: "
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
opt.conceallevel = 3
opt.guicursor = "i:block"

opt.hlsearch = true
opt.incsearch = true
opt.scrolloff = 8
-- vim.g.markdown_folding = 1 -- for folding markdown headings
opt.guicursor =
  "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

-- max height and width for popup window
vim.opt.pumheight = 12
-- vim.opt.pumwidth = 20 for min width

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
            {mode = 'n', "<leader>1", ":lua require(\"harpoon.ui\").nav_file(1)<CR>", desc = "Toggle to file 1"},
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
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },

        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },

    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            "L3MON4D3/LuaSnip",
            'saadparwaiz1/cmp_luasnip',
            'onsails/lspkind.nvim',
        },

        config = function()
            local cmp = require'cmp'

            cmp.setup({
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                    { name = "buffer", max_item_count = 3 },
                    { name = "path", max_item_count = 3 },
                    { name = "nvim_lsp", max_item_count = 3 },
                    { name = "luasnip", max_item_count = 3 },

                    -- {name = 'path'},
                    -- { name = 'nvim_lsp' },
                    -- { name = 'vsnip' }, -- For vsnip users.
                    -- { name = 'luasnip' }, -- For luasnip users.
                    -- { name = 'ultisnips' }, -- For ultisnips users.
                    -- { name = 'snippy' }, -- For snippy users.
                    }, {
                        { name = 'buffer' },
                })
            })

            -- Set configuration for specific filetype.
            cmp.setup.filetype('gitcommit', {
                sources = cmp.config.sources({
                    { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
                    }, {
                        { name = 'buffer' },
                })
            })

            -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })

            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                    }, {
                        { name = 'cmdline' }
                })
            })


            -- Set up lspconfig.
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
            require('lspconfig')['lua_ls'].setup {
                capabilities = capabilities
            }
            require('lspconfig')['clangd'].setup {
                capabilities = capabilities
            }
            require('lspconfig')['pyright'].setup {
                capabilities = capabilities
            }
            require('lspconfig')['html'].setup {
                capabilities = capabilities
            }
            -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
            -- 	capabilities = capabilities
            -- }
        end

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

    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
        },

        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "pyright", "html" },
                automatic_installation = true,

            })

            -- After setting up mason-lspconfig you may set up servers via lspconfig
            -- require("lspconfig").lua_ls.setup {}
            -- require("lspconfig").rust_analyzer.setup {}
            -- ...
        end,
    },

    {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.diagnostics.eslint,
                    null_ls.builtins.completion.spell,
                },
            })
        end,
        requires = { "nvim-lua/plenary.nvim" },
    },

    {
        {'akinsho/toggleterm.nvim', version = "*"},
    },

})
