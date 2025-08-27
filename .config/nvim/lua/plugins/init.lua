return {
    {
        "stevearc/conform.nvim",
        event = "BufWritePre", -- uncomment for format on save
        opts = require "configs.conform",
    },
    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require "configs.lspconfig"
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "lua-language-server",
                "stylua", -- LSP and formatter for Lua
                "html-lsp",
                "css-lsp",
                "prettier",     -- LSP and formatter for html,css
                "pyright",      -- a lightweight LSP for python
                "mypy",         -- a null-ls tool for python static type checking
                "ruff",         -- a null-ls tool for python linting
                "black",        -- an auto-formating tool for pyhton
                "clangd",       -- a powerful LSP for C++
                -- (includes linting, static analysis, etc.)
                "clang-format", -- a c++ formatter
                "gopls",        -- an LSP for GO
            },
        },
    },
    { import = "nvchad.blink.lazyspec" },
    {
        'mvllow/modes.nvim',
        tag = 'v0.2.1',
        config = function()
            require('modes').setup({
                colors = {
                    bg = "", -- Optional bg param, defaults to Normal hl group
                    copy = "#f5c359",
                    delete = "#c75c6a",
                    change = "#c75c6a", -- Optional param, defaults to delete
                    format = "#c79585",
                    insert = "#ecbe7b",
                    replace = "#245361",
                    select = "#9745be", -- Optional param, defaults to visual
                    visual = "#9745be",
                },

                -- Enable cursor highlights
                set_cursor = true,

                set_cursorline = false,

            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "vim",
                "lua",
                "vimdoc",
                "python",
                "cpp",
                "make",
                "dockerfile",
                "markdown",
                "markdown_inline",
                "html",
                "css",
                "go",
            },
        },
    },

    {
        "jose-elias-alvarez/null-ls.nvim",
        opts = function()
            return require "configs.null-ls" -- load the options from a custom
            -- 'null-ls' config file
        end,
    },
}
