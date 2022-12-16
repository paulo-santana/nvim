local present, packer = pcall(require, "plugins.packerInit")

if not present then
    error("Error: " .. packer)
    return false
end

local use = packer.use

return packer.startup(function()
    use "nvim-lua/plenary.nvim"

    use {
        "wbthomason/packer.nvim",
    }

    use {
        "~/docs/projects/onechad.nvim",
        config = function()
            vim.cmd "colorscheme onechad"
        end,
    }

    use {
        "kyazdani42/nvim-web-devicons",
        after = "onechad.nvim",
    }

    use {
        "nvim-telescope/telescope.nvim",
        module = "telescope",
        cmd = "Telescope",
        requires = {
            { "nvim-lua/plenary.nvim" },
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                run = "make",
            },
            --{
            --    "nvim-telescope/telescope-media-files.nvim",
            --    disable = true,
            --    setup = function()
            --        require("core.mappings").telescope_media(),
            --    end,
            --}
        },
        config = function()
            require("plugins.config.telescope")
        end,
        setup = function()
            require("core.mappings").telescope()
        end,
    }

    use {
        "famiu/feline.nvim",
        after = "nvim-web-devicons",
        config = function()
            require('plugins.config.statusline')
        end,
    }

    use {
        "akinsho/bufferline.nvim",
        branch = "main",

        after = "onechad.nvim",
        config = function()
            require("plugins.config.bufferline")
        end,
        setup = function()
            require("core.mappings").bufferline()
        end,
    }

    use {
        'NvChad/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
            -- local ok, colorizer = pcall(require, "colorizer")
            -- if ok then
            --     colorizer.setup({ "*" }, {
            --         RGB = true, -- #RGB hex codes
            --         RRGGBB = true, -- #RRGGBB hex codes
            --         names = false, -- "Name" codes like Blue
            --         RRGGBBAA = true, -- #RRGGBBAA hex codes
            --         rgb_fn = false, -- CSS rgb() and rgba() functions
            --         hsl_fn = false, -- CSS hsl() and hsla() functions
            --         css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
            --         css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
            --
            --         -- Available modes: foreground, background
            --         mode = "background", -- Set the display mode.
            --     })
            --     vim.cmd "ColorizerReloadAllBuffers"
            -- end
        end,
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            local ok, ts_config = pcall(require, "nvim-treesitter.configs")

            if not ok then
                print('Error importing Treesitter')
                return
            end

            ts_config.setup {
                ensure_installed = {
                    "lua",
                    "vim",
                },
                indent = {
                    enable = true,
                },
                playground = {
                    enable = true,
                    disable = {},
                    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
                    persist_queries = false, -- Whether the query persists across vim sessions
                    keybindings = {
                        toggle_query_editor = 'o',
                        toggle_hl_groups = 'i',
                        toggle_injected_languages = 't',
                        toggle_anonymous_nodes = 'a',
                        toggle_language_display = 'I',
                        focus_language = 'f',
                        unfocus_language = 'F',
                        update = 'R',
                        goto_node = '<cr>',
                        show_help = '?',
                    },
                },
                highlight = {
                    enable = true,
                    use_languagetree = true,
                },
            }
        end,
    }

    use {
        'nvim-treesitter/playground',
        requires = {
            'nvim-treesitter/nvim-treesitter'
        }
    }

    use {
        "windwp/nvim-ts-autotag",
        config = function ()
            require('nvim-ts-autotag').setup()
        end
    }

    use {
        "neovim/nvim-lspconfig",
        config = function()
            -- require("core.utils").packer_lazy_load "nvim-lspconfig"
            -- vim.defer_fn(function()
            --     vim.cmd 'if &ft == "packer" | echo "" | else | silent! e %'
            --     require("plugins.config.lspconfig_setup")
            -- end, 0)
            require("plugins.config.lspconfig_setup")
        end
    }

    -- use{
    --     "jose-elias-alvarez/null-ls.nvim",
    --     -- after = "nvim-lspconfig",
    --     config = function()
    --         local nullls = require("null-ls")
    --
    --         nullls.setup({
    --             sources = {
    --                 nullls.builtins.formatting.prettierd
    --             },
    --             on_attach = function(client, buffnr)
    --                 if client.server_capabilities.documentFormattingProvider then
    --                     print("This is unacceptable")
    --                     vim.cmd("nnoremap <silent><buffer> <leader>p :lua vim.lsp.buf.formatting()<CR>")
    --
    --                     -- format on save
    --                     vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
    --                 end
    --
    --                 if client.server_capabilities.documentRangeFormattingProvider then
    --                     vim.cmd("xnoremap <silent><buffer> <leader>p :lua vim.lsp.buf.range_formatting({})<CR>")
    --                 end
    --                 print("Inside on_attach")
    --             end,
    --         })
    --     end,
    -- }

    use {
        "sbdchd/neoformat",
        config = function()
            vim.cmd[[autocmd BufWritePre *.js Neoformat]]
            vim.cmd[[autocmd BufWritePre *.ts Neoformat]]
            vim.cmd[[autocmd BufWritePre *.jsx Neoformat]]
            vim.cmd[[autocmd BufWritePre *.tsx Neoformat]]
            vim.cmd[[autocmd BufWritePre *.svelte Neoformat]]
        end
    }

    --use {
    --    "MunifTanjim/prettier.nvim",
    --    after = "null-ls.nvim",
    --    config = function ()
    --        local prettier = require("prettier")

    --        prettier.setup({
    --            bin = 'prettierd',
    --            filetypes = {
    --                "css",
    --                "graphql",
    --                "html",
    --                "javascript",
    --                "javascriptreact",
    --                "json",
    --                "less",
    --                "markdown",
    --                "scss",
    --                "typescript",
    --                "typescriptreact",
    --            }
    --        })
    --    end
    --}

    -- use {
    --     "tjdevries/nlua.nvim",
    --     after = "nvim-lspconfig",
    --     config = function()
    --         local config = require('plugins.config.lspconfig')
    --         local ok, lspconfig = pcall(require, 'lspconfig')
    --         if not ok then
    --             error('error loading lspconfig\n' .. lspconfig)
    --             return
    --         end
    --         require('nlua.lsp.nvim').setup(lspconfig, {
    --             -- cmd = { "/home/paulo/.language-servers/lua-language-server/bin/Linux/lua-language-server" },
    --             on_attach = config.on_attach,
    --             capabilities = config.capabilities,
    --             globals = {
    --                 "Color", "c", "Group", "g", "s",
    --             },
    --         })
    --     end,
    -- }
    --
    --
    --
    use {
        'folke/trouble.nvim',
        after = "nvim-lspconfig",
        requires = "kyazdani42/nvim-web-devicons",
        config = function ()
            require("plugins.config.trouble")
        end,
        setup = function ()
            require('core.mappings').trouble()
        end

    }

    use {
        'folke/todo-comments.nvim',
        after = "trouble.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup { }
        end,
        setup = function ()
            require("core.mappings").todo_comments()
        end
    }

    use {
        "ray-x/lsp_signature.nvim",
        after = "nvim-lspconfig",
        config = function()
            local lspsignature = require("lsp_signature")
            lspsignature.setup {
                bind = true,
                floating_window = true,
                fix_pos = true,
                hint_enable = true,
                hint_scheme = "String",
                hint_prefix = "🐼 ",
                hi_parameter = "Search",
                max_height = 22,
                max_width = 120,
                handler_opts = {
                    boerder = "rounded",
                },
                padding = " ",
                toggle_key = '<M-x>'
            }
        end,
    }

    -- use {
    --     "andymass/vim-matchup",
    --     opt = true,
    --     setup = function()
    --         require("core.utils").packer_lazy_load "vim-matchup"
    --     end,
    -- }

    use {
        "rafamadriz/friendly-snippets",
        -- event = "InsertEnter",
    }

    use {
        "hrsh7th/nvim-cmp",
        after = "friendly-snippets",
        config = function()
            require("plugins.config.cmp")
        end,
    }

    use {
        "L3MON4D3/LuaSnip",
        wants = "friendly-snippets",
        after = "nvim-cmp",
        config = function()
            require("plugins.config.luasnip")
        end,
    }

    use {
        "saadparwaiz1/cmp_luasnip",
        after = "LuaSnip",
    }

    use {
        "hrsh7th/cmp-nvim-lua",
        after = "cmp_luasnip",
    }

    use {
        "hrsh7th/cmp-nvim-lsp",
        after = "cmp-nvim-lua",
    }

    use {
        "hrsh7th/cmp-buffer",
        after = "cmp-nvim-lsp",
    }

    use {
        "hrsh7th/cmp-path",
        after = "cmp-buffer",
    }

    use {
        "windwp/nvim-autopairs",
        after = "nvim-cmp",
        config = function()
            local present1, autopairs = pcall(require, "nvim-autopairs")
            local present2, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")

            if present1 and present2 then
                autopairs.setup()

                local cmp = require "cmp"
                cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
            end
        end,
    }

    use {
        "glepnir/dashboard-nvim",
        event = "VimEnter",
        config = function()
            require('plugins.config.dashboard')
        end,
        setup = function()
            require('core.mappings').dashboard()
        end
    }

    use {
        "kyazdani42/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        config = function()
            require('plugins.config.nvimtree')
        end,
        setup = function()
            require('core.mappings').nvimtree()
        end
    }

    use {
        "numToStr/Comment.nvim",
        module = "Comment",
        config = function()
            local comment = require("Comment")
            comment.setup({ })
        end,
        setup = function()
            require('core.utils').packer_lazy_load "Comment.nvim"
            require('core.mappings').comment()
        end,
    }

    -- BUG: makes :wqa throw an error after opening it
    use {
        'TimUntersberger/neogit',
        cdm = 'Neogit',
        requires = {
            'sindrets/diffview.nvim',
            after = 'neogit',
        },
        config = function()
            local neogit = require('neogit')
            neogit.setup {
                integrations = {
                    diffview = true,
                },
            }
        end,
        setup = function()
            require('core.mappings').neogit()
        end,
    }

    use {
        'akinsho/toggleterm.nvim',
        branch = "main",
        -- branch = "refactor/use-nvim-set-hl",
        after = 'onechad.nvim',
        config = function()
            require("plugins.config.toggleterm")
        end,
    }

    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('plugins.config.gitsigns')
        end,
    }

    use {
        "andweeb/presence.nvim",
        config = function ()
            require("presence"):setup {}
        end
    }

    use {
        'j-hui/fidget.nvim',
        after = 'nvim-lspconfig',
        config = function()
            require('fidget').setup {}
        end,
    }

    -- use {
    --     'mfussenegger/nvim-dap',
    --     config = function ()
    --         require('plugins.config.dap')
    --     end,
    -- }
    --
    -- use {
    --     "rcarriga/nvim-dap-ui",
    --     requires = {
    --         "mfussenegger/nvim-dap"
    --     },
    --     config = function ()
    --         require('plugins.config.dap-ui')
    --     end
    -- }
    --
    -- use {
    --     'theHamsta/nvim-dap-virtual-text',
    --     requires = {
    --         "mfussenegger/nvim-dap"
    --     },
    --     config = function ()
    --         require('nvim-dap-virtual-text').setup()
    --     end
    -- }

end)
