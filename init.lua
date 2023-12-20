local opt = vim.opt
opt.relativenumber = true 
opt.number = true 
opt.ruler = false
opt.cmdheight = 0
opt.background = "dark"
opt.fillchars = "fold: "
opt.tabstop = 4 
opt.shiftwidth = 4 
opt.expandtab = true 
opt.autoindent = true 
opt.syntax = "on"
opt.wrap = false 
opt.ignorecase = true 
opt.smartcase = true 
opt.cursorline = false 
opt.termguicolors = true
opt.background = "dark" 
opt.signcolumn = "no" 
opt.backspace = "indent,eol,start" 
opt.clipboard:append("unnamedplus") 
opt.splitright = true 
opt.splitbelow = true 
opt.conceallevel = 3
opt.guicursor = "i:block"
opt.hlsearch = true
opt.incsearch = true
opt.scrolloff = 8
-- vim.g.markdown_folding = 1
opt.pumheight = 14
opt.guicursor =
"n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"


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
                    -- completion = cmp.config.window.bordered(),
                    -- documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "path" },
                    { name = "buffer" },

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

            -- local lspconfig = require('lspconfig').setup{}

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
                capabilities = capabilities,
            }

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
        'akinsho/toggleterm.nvim',
        version = "*",

        keys = {
            {mode = 'n', 'z', ":ToggleTerm<CR>",desc= ""},
        },
        config = function ()
            require("toggleterm").setup({
                direction = 'float',
                start_in_insert = true,
                insert_mappings = true, -- whether or not the open mapping applies in insert mode
                terminal_mappings = false, -- whether or not the open mapping applies in the opened terminals
                persist_size = true,
                persist_mode = true, 
                auto_scroll = true, 
            })

            function _G.set_terminal_keymaps()
                local opts = {buffer = 0}
                vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
                vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
                vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
                vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
                vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
                vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
                vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
            end
            -- if you only want these mappings for toggle term use term://*toggleterm#* instead
            vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
        end
    },


    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
        keys = {
            { mode = 'n', '<leader>mp', ':MarkdownPreviewToggle<CR>' },
        },
    },

    {
        "neovim/nvim-lspconfig",
        config = function ()
            
            local lspconfig_status, lspconfig = pcall(require, "lspconfig")
            if not lspconfig_status then
                return
            end

            -- import cmp-nvim-lsp plugin safely
            local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
            if not cmp_nvim_lsp_status then
                return
            end

            -- import typescript plugin safely
            local typescript_setup, typescript = pcall(require, "typescript")
            if not typescript_setup then
                return
            end

            local keymap = vim.keymap -- for conciseness

            -- Set up the key mapping to call the custom function
            -- enable keybinds only for when lsp server available
            local on_attach = function(client, bufnr)
                -- keybind options
                local opts = { noremap = true, silent = true, buffer = bufnr }

                -- set keybinds
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

                -- typescript specific keymaps (e.g. rename file and update imports)
                if client.name == "tsserver" then
                    keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
                    keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
                    keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
                end
            end

            -- used to enable autocompletion (assign to every lsp server config)
            local capabilities = cmp_nvim_lsp.default_capabilities()

            -- Change the Diagnostic symbols in the sign column (gutter)
            -- (not in youtube nvim video)
            local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
            end

            -- configure html server
            lspconfig["html"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            -- configure typescript server with plugin
            typescript.setup({
                server = {
                    capabilities = capabilities,
                    on_attach = on_attach,
                },
            })

            -- configure css server
            lspconfig["cssls"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            -- configure tailwindcss server
            lspconfig["tailwindcss"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            lspconfig["pyright"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
                filetype = { "python" },
            })

            -- lspconfig["jdlts"].setup({
            --   capabilities = capabilities,
            --   on_attach = on_attach,
            -- })

            lspconfig["clangd"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            lspconfig["bashls"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

            -- lspconfig["gopls"].setup({
            --   capabilities = capabilities,
            --   on_attach = on_attach,
            -- })
            -- lspconfig["codelldb"].setup({
            --   capabilities = capabilities,
            --   on_attach = on_attach,
            -- })
            -- configure emmet language server
            lspconfig["emmet_ls"].setup({
                capabilities = capabilities,
                on_attach = on_attach,
                filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
            })

            -- configure lua server (with special settings)
            lspconfig["lua_ls"].setup({
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
        end
    },

    {
        "3rd/image.nvim",
        config = function()
            -- Example for configuring Neovim to load user-installed installed Lua rocks:
            package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
            package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"

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
        end,
    },

})

