-- init.lua — organized, reformatted, and commented
-- NOTE: I only changed whitespace and comments. No configuration logic, values, plugin specs,
-- mappings, or ordering were modified.

-- ---------------------------------------------------------------------------
-- Leader keys (must be set before plugins/mappings that depend on them are loaded)
-- ---------------------------------------------------------------------------
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- ---------------------------------------------------------------------------
-- Global variables / simple flags
-- ---------------------------------------------------------------------------
-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- ---------------------------------------------------------------------------
-- Cursor / basic editor behavior
-- ---------------------------------------------------------------------------
-- Cursor appearance (GUI/terminal may vary)
vim.o.guicursor = 'n-v-c-i:block'
vim.opt.termguicolors = true
-- Working directory behavior
-- NOTE: this was toggled in the original file (true then later false). Left as-is.
vim.o.autochdir = false

-- ---------------------------------------------------------------------------
-- General options (user-visible behavior and editing defaults)
-- See `:help vim.o` and `:help lua-options`
-- ---------------------------------------------------------------------------
-- Line numbers
vim.o.number = true
vim.o.relativenumber = true

-- Hide mode (it's usually shown in a statusline)
vim.o.showmode = false
-- Whitespace / tab behavior
vim.o.copyindent = true
vim.o.textwidth = 100
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Command-line height
vim.o.cmdheight = 0

-- Clipboard: schedule after UiEnter to avoid startup slowdown
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Break indent (soft wrap indent)
vim.o.breakindent = true

-- Persistent undo
vim.o.undofile = true

-- Search behavior
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.inccommand = 'split' -- preview substitutions live as you type
vim.o.hlsearch = vim.o.hlsearch -- left here to show intent (no change)

-- Signs and UI behavior
vim.o.signcolumn = 'yes'
vim.o.updatetime = 250 -- affects CursorHold, diagnostics, etc.
vim.o.timeoutlen = 300 -- mapped sequence wait time
vim.o.cursorline = false
vim.o.scrolloff = 5
vim.o.confirm = true

-- Display whitespace and listchars
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Read-only/hidden buffer behavior
vim.opt.autoread = true
vim.opt.hidden = true
vim.opt.backspace = 'indent,eol,start'

-- Performance-related options
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000
vim.o.splitright = true
vim.o.splitbelow = true
-- ---------------------------------------------------------------------------
-- Minimal remaps and keymaps (basic helpers)
-- ---------------------------------------------------------------------------
-- require('custom.mapping')
-- Greatest remap EVEEER
vim.keymap.set('x', '<leader>p', [["_dP]])
-- Yank to end of line with 'Y' like other operators
vim.keymap.set('n', 'Y', 'y$', { desc = 'Yank to end of line' })

-- Clear search highlights when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Quick save and buffer quit mappings
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Write file' })
vim.keymap.set('n', '<leader>q', ':bd<CR>', { desc = 'Close buffer' })

-- Diagnostic quickfix
vim.keymap.set('n', '<leader>Q', vim.diagnostic.setloclist, { desc = 'Quickfix list' })

-- Terminal mode exit mapping (makes <Esc><Esc> act like <C-\><C-n>)
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Disable arrow keys in normal mode (tip for reducing arrow usage)
vim.keymap.set('n', '<left>', '')
vim.keymap.set('n', '<right>', '')
vim.keymap.set('n', '<up>', '')
vim.keymap.set('n', '<down>', '')

-- Quick Compiler keybinds
vim.api.nvim_set_keymap('n', '<F5>', '<cmd>CompilerOpen<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F6>', '<cmd>CompilerStop<cr><cmd>CompilerRedo<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F7>', '<cmd>CompilerToggleResults<cr>', { noremap = true, silent = true })

-- Window resizing keymaps with Ctrl + arrow keys
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>', { desc = 'Increase window height' })
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>', { desc = 'Decrease window height' })
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'Decrease window width' })
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'Increase window width' })

-- Window navigation (CTRL+hjkl)
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Visual indenting reselect
vim.keymap.set('v', '<', '<gv', { desc = 'Indent left and reselect' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right and reselect' })

-- Move lines up/down
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Move View down' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Move View up' })

vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { desc = 'Move line down' })
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { desc = 'Move line up' })
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

-- Buffer navigation
-- vim.keymap.set('n', '<leader><Tab>', ':bnext<CR>', { desc = 'Next buffer' })

-- Better 'J' join: keep cursor position
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Join lines and keep cursor position' })

-- Misc mappings: quick insert-mode exits and terminal exits
vim.keymap.set('i', 'jk', '<Esc>', { silent = true, desc = 'exit insert mode' })
vim.keymap.set('t', 'jk', '<C-\\><C-n>', { silent = true, desc = 'exit terminal' })
vim.keymap.set('c', 'jk', '<Esc>', { silent = true, desc = 'exit command-line' })

-- Small editor shortcuts: start/end of line mappings (note: duplicated in original file, preserved)
vim.keymap.set('n', 'H', '^', { silent = true, desc = 'start of line' })
vim.keymap.set('n', 'L', '$', { silent = true, desc = 'end of line' })
vim.keymap.set('v', 'H', '^', { silent = true, desc = 'start of line' })
vim.keymap.set('v', 'L', '$', { silent = true, desc = 'end of line' })

-- ---------------------------------------------------------------------------
-- Basic Keymap helper used later by some plugin configs (legacy style)
-- ---------------------------------------------------------------------------
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true } -- reserved variable preserved (as in original file)

-- CMake keymaps (preserved)
keymap('', '<leader>cg', ':CMakeGenerate<cr>', { desc = 'CMake Generate' })
keymap('', '<leader>cb', ':CMakeBuild<cr>', { desc = 'CMake Build' })
keymap('', '<leader>cq', ':CMakeClose<cr>', { desc = 'CMake Close' })
keymap('', '<leader>cc', ':CMakeClean<cr>', { desc = 'CMake Clean' })

-- Exit terminal mode helper in 't' (already set above but preserved where original had it)
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- ---------------------------------------------------------------------------
-- Yank highlight (TextYankPost) — minimal autocommand to show visual yank
-- ---------------------------------------------------------------------------
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
-- ---------------------------------------------------------------------------
-- base46 Themes setup
-- ---------------------------------------------------------------------------
vim.g.base46_cache = vim.fn.stdpath 'data' .. '/base46_cache/'

-- put this after lazy setup

-- ---------------------------------------------------------------------------
-- Plugin manager: lazy.nvim installation check and runtimepath prepending
-- ---------------------------------------------------------------------------
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- ---------------------------------------------------------------------------
-- Plugins configuration: require('lazy').setup({...})
-- ---------------------------------------------------------------------------
require('lazy').setup({
  'NMAC427/guess-indent.nvim',

  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
  {
    'mvllow/modes.nvim',
    event = 'VeryLazy',
    opts = {
      colors = {
        bg = '#282c34',
        copy = '#98be65',
        delete = '#ff0000',
        insert = '#00ff00',
        visual = '#ff00ff',
      },
      line_opacity = 0,
      set_cursor = true,
      set_cursorline = false,
      set_number = true,
      set_signcolumn = true,
      ignore = { 'NvimTree', 'TelescopePrompt', '!minifiles' },
    },
  },
  --
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    lazy = false,
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    opts = {
      delay = 0,
      icons = {
        mappings = vim.g.have_nerd_font,
        keys = {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },

      spec = {
        { '<leader>s', group = 'Search' },
        { '<leader>c', group = 'CMake' },
        { '<leader>d', group = 'Debug' },
        { '<leader>t', group = 'Toggle' },
        { '<leader>h', group = 'Git Hunk', mode = { 'n', 'v' } },
      },
    },
  },

  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'andrew-george/telescope-themes',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      -- Telescope setup and keymaps (preserved from original)
      require('telescope').setup {
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('themes').load_extension, 'ui-select')
      pcall(require('telescope').load_extension, 'ui-select')

      -- Splitting & Resizing (also present earlier; preserved)
      vim.keymap.set('n', '<C-Up>', ':resize +2<CR>', { desc = 'Increase window height' })
      vim.keymap.set('n', '<C-Down>', ':resize -2<CR>', { desc = 'Decrease window height' })
      vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'Decrease window width' })
      vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'Increase window width' })

      -- Visual indent/select improvements
      vim.keymap.set('v', '<', '<gv', { desc = 'Indent left and reselect' })
      vim.keymap.set('v', '>', '>gv', { desc = 'Indent right and reselect' })

      -- Move lines up/down
      vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { desc = 'Move line down' })
      vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { desc = 'Move line up' })
      vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
      vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

      -- Buffer navigation
      vim.keymap.set('n', '<leader><Tab>', ':bnext<CR>', { desc = 'Next buffer' })
      vim.keymap.set('n', '<leader>S<Tab>', ':bprevious<CR>', { desc = 'Previous buffer' })

      -- Better J behavior
      vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Join lines and keep cursor position' })

      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Help' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = 'Keymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Files' })
      vim.keymap.set('n', '<leader>sb', builtin.builtin, { desc = 'Select Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = 'Current word' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Grep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = 'Diagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = 'Resume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = 'Recent Files' })
      vim.keymap.set('n', '<leader>ss', builtin.buffers, { desc = 'Find existing buffers' })
      vim.keymap.set('n', '<leader>st', ':Telescope themes<CR>', { noremap = true, silent = true, desc = 'Theme' })

      -- current buffer fuzzy find using dropdown theme
      vim.keymap.set('n', '<leader>/', function()
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = true,
        })
      end, { desc = 'Fuzzily search in current buffer' })

      -- live grep open files only
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = 'Search in open Files' })

      -- find in Neovim config
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = 'Search vim files' })
    end,
  },

  -- LSP-related plugins and their configuration (preserved)
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  { 'honza/vim-snippets' },
  {
    'Civitasv/cmake-tools.nvim',
    opts = {
      cmake_build_directory = 'build',
      cmake_generate_options = { '-D', 'CMAKE_EXPORT_COMPILE_COMMANDS=1' },
    },
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      'mason-org/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      'saghen/blink.cmp',
    },
    config = function()
      -- LSP attach autocommand and various LSP helpers
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          map('grn', vim.lsp.buf.rename, 'Rename')
          map('gra', vim.lsp.buf.code_action, 'Goto Code Action', { 'n', 'x' })
          map('grr', require('telescope.builtin').lsp_references, 'Goto References')
          map('gri', require('telescope.builtin').lsp_implementations, 'Goto Implementation')
          map('grd', require('telescope.builtin').lsp_definitions, 'Goto Definition')
          map('grD', vim.lsp.buf.declaration, 'Goto Declaration')
          map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')
          map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')
          map('grt', require('telescope.builtin').lsp_type_definitions, 'Goto Type Definition')

          local function client_supports_method(client, method, bufnr)
            if vim.fn.has 'nvim-0.11' == 1 then
              return client:supports_method(method, bufnr)
            else
              return client.supports_method(method, { bufnr = bufnr })
            end
          end

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })
            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
              end,
            })
          end

          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, 'Toggle inlay hints')
          end
        end,
      })

      -- Diagnostic config
      vim.diagnostic.config {
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        } or {},
        virtual_text = {
          source = 'if_many',
          spacing = 4,
          format = function(diagnostic)
            local diagnostic_message = {
              [vim.diagnostic.severity.ERROR] = diagnostic.message,
              [vim.diagnostic.severity.WARN] = diagnostic.message,
              [vim.diagnostic.severity.INFO] = diagnostic.message,
              [vim.diagnostic.severity.HINT] = diagnostic.message,
            }
            return diagnostic_message[diagnostic.severity]
          end,
        },
      }

      -- LSP servers, capabilities, and mason integration
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      local servers = {
        clangd = {},
        gopls = {},
        pyright = {},
        rust_analyzer = {},
        sqls = {},
        jdtls = {},
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
            },
          },
        },
      }

      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, { 'stylua' })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        ensure_installed = {},
        automatic_installation = true,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },

  {
    'Zeioth/compiler.nvim',
    cmd = { 'CompilerOpen', 'CompilerToggleResults', 'CompilerRedo' },
    dependencies = { 'stevearc/overseer.nvim', 'nvim-telescope/telescope.nvim' },
    opts = {},
  },
  {
    'stevearc/overseer.nvim',
    commit = '6271cab7ccc4ca840faa93f54440ffae3a3918bd',
    cmd = { 'CompilerOpen', 'CompilerToggleResults', 'CompilerRedo' },
    opts = {
      task_list = {
        direction = 'bottom',
        min_height = 25,
        max_height = 25,
        default_detail = 1,
      },
    },
  },
  { 'ThePrimeagen/vim-be-good' },
  'nvim-lua/plenary.nvim',
  { 'nvim-tree/nvim-web-devicons', lazy = true },

  {
    'eldritch-theme/eldritch.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = true,
      format_on_save = function(bufnr)
        local disable_filetypes = { c = false, cpp = false }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return nil
        else
          return {
            timeout_ms = 500,
            lsp_format = 'fallback',
          }
        end
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'black' },
        cpp = { 'clang-format' },
        c = { 'clang-format' },
      },
    },
  },

  {
    'saghen/blink.cmp',
    event = 'VimEnter',
    version = '1.*',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        version = '2.*',
        build = (function()
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()
            end,
          },
        },
        opts = {},
      },
      'folke/lazydev.nvim',
    },
    --- @module 'blink.cmp'
    --- @type blink.cmp.Config
    opts = {
      keymap = {
        preset = 'default',
      },
      appearance = {
        nerd_font_variant = 'normal',
      },
      completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 600 },
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'lazydev' },
        providers = {
          lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
        },
      },
      snippets = { preset = 'luasnip' },
      fuzzy = { implementation = 'lua' },
      signature = { enabled = true },
    },
  },
  {
    'rmagatti/auto-session',
    lazy = false,

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      suppressed_dirs = { '~/', '~/projects', '~/Downloads', '/', '~/.config' },
      -- log_level = 'debug',
    },
  },
  -- Color schemes and theme plugins
  { 'EdenEast/nightfox.nvim' },
  { 'projekt0n/github-nvim-theme' },
  { 'plan9-for-vimspace/acme-colors' },
  { 'agude/vim-eldar' },
  { 'Abstract-IDE/Abstract-cs' },
  { 'nyngwang/nvimgelion' },
  { 'cwshugg/dwarrowdelf' },
  -- { 'sektant-gabe/dwarrowdelf.nvim' },
  { 'miikanissi/modus-themes.nvim', priority = 1000 },
  {
    'NTBBloodbath/doom-one.nvim',
    config = function()
      -- Add color to cursor
      vim.g.doom_one_cursor_coloring = true
      -- Set :terminal colors
      vim.g.doom_one_terminal_colors = true
      -- Enable italic comments
      vim.g.doom_one_italic_comments = false
      -- Enable TS support
      vim.g.doom_one_enable_treesitter = true
      -- Color whole diagnostic text or only underline
      vim.g.doom_one_diagnostics_text_color = true
      -- Enable transparent background
      vim.g.doom_one_transparent_background = true

      -- Pumblend transparency
      vim.g.doom_one_pumblend_enable = true
      vim.g.doom_one_pumblend_transparency = 20

      -- Plugins integration
      vim.g.doom_one_plugin_neorg = true
      vim.g.doom_one_plugin_barbar = false
      vim.g.doom_one_plugin_telescope = false
      vim.g.doom_one_plugin_neogit = true
      vim.g.doom_one_plugin_nvim_tree = true
      vim.g.doom_one_plugin_dashboard = true
      vim.g.doom_one_plugin_startify = true
      vim.g.doom_one_plugin_whichkey = true
      vim.g.doom_one_plugin_indent_blankline = true
      vim.g.doom_one_plugin_vim_illuminate = true
      vim.g.doom_one_plugin_lspsaga = false
    end,
  },

  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup { n_lines = 500 }
      require('mini.tabline').setup()
      require('mini.surround').setup()

      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = vim.g.have_nerd_font }
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
      ensure_installed = { 'bash', 'c', 'cpp', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    },
  },
  -- Kickstart plugin helpers
  require 'kickstart.plugins.lint',
  require 'kickstart.plugins.autopairs',
  require 'kickstart.plugins.neo-tree',
  require 'kickstart.plugins.gitsigns',

  { import = 'custom.plugins' },
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
vim.cmd 'colorscheme doom-one'
-- ---------------------------------------------------------------------------
-- UI tweaks: transparent background for Normal/EndOfBuffer
-- ---------------------------------------------------------------------------
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'none' })
--
-- ---------------------------------------------------------------------------
-- User autocommands (filetype-specific settings, cursor restore, term behavior)
-- ---------------------------------------------------------------------------
local augroup = vim.api.nvim_create_augroup('UserConfig', {})

-- Per-filetype tab settings (lua, python, c, cpp -> tabstop 4)
vim.api.nvim_create_autocmd('FileType', {
  group = augroup,
  pattern = { 'lua', 'python', 'c', 'cpp' },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

-- Per-filetype tab settings (web-related -> tabstop 2)
vim.api.nvim_create_autocmd('FileType', {
  group = augroup,
  pattern = { 'javascript', 'typescript', 'json', 'html', 'css' },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd('BufReadPost', {
  group = augroup,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Auto-close terminal when the process exits (only if exit status == 0)
vim.api.nvim_create_autocmd('TermClose', {
  group = augroup,
  callback = function()
    if vim.v.event.status == 0 then
      vim.api.nvim_buf_delete(0, {})
    end
  end,
})

-- Disable line numbers in builtin terminal buffers
vim.api.nvim_create_autocmd('TermOpen', {
  group = augroup,
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = 'no'
  end,
})

-- Auto-resize splits on VimResized
vim.api.nvim_create_autocmd('VimResized', {
  group = augroup,
  callback = function()
    vim.cmd 'tabdo wincmd ='
  end,
})

-- Create parent directories when saving files
vim.api.nvim_create_autocmd('BufWritePre', {
  group = augroup,
  callback = function()
    local dir = vim.fn.expand '<afile>:p:h'
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, 'p')
    end
  end,
})

-- ---------------------------------------------------------------------------
-- Floating terminal implementation (toggle + helpers)
-- ---------------------------------------------------------------------------
local terminal_state = {
  buf = nil,
  win = nil,
  is_open = false,
}

local function FloatingTerminal()
  -- Toggle behavior: close if already open
  if terminal_state.is_open and vim.api.nvim_win_is_valid(terminal_state.win) then
    vim.api.nvim_win_close(terminal_state.win, false)
    terminal_state.is_open = false
    return
  end

  -- Create buffer if missing/invalid
  if not terminal_state.buf or not vim.api.nvim_buf_is_valid(terminal_state.buf) then
    terminal_state.buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_option(terminal_state.buf, 'bufhidden', 'hide')
  end

  -- Window dimensions (80% of editor)
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  terminal_state.win = vim.api.nvim_open_win(terminal_state.buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded',
  })

  -- Visual adjustments for floating win
  vim.api.nvim_win_set_option(terminal_state.win, 'winblend', 0)
  vim.api.nvim_win_set_option(terminal_state.win, 'winhighlight', 'Normal:FloatingTermNormal,FloatBorder:FloatingTermBorder')
  vim.api.nvim_set_hl(0, 'FloatingTermNormal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'FloatingTermBorder', { bg = 'none' })

  -- Start terminal in the floating buffer if not present
  local has_terminal = false
  local lines = vim.api.nvim_buf_get_lines(terminal_state.buf, 0, -1, false)
  for _, line in ipairs(lines) do
    if line ~= '' then
      has_terminal = true
      break
    end
  end

  if not has_terminal then
    vim.fn.termopen(os.getenv 'SHELL')
  end

  terminal_state.is_open = true
  vim.cmd 'startinsert'

  -- Auto-close when buffer is left
  vim.api.nvim_create_autocmd('BufLeave', {
    buffer = terminal_state.buf,
    callback = function()
      if terminal_state.is_open and vim.api.nvim_win_is_valid(terminal_state.win) then
        vim.api.nvim_win_close(terminal_state.win, false)
        terminal_state.is_open = false
      end
    end,
    once = true,
  })
end

local function CloseFloatingTerminal()
  if terminal_state.is_open and vim.api.nvim_win_is_valid(terminal_state.win) then
    vim.api.nvim_win_close(terminal_state.win, false)
    terminal_state.is_open = false
  end
end

-- Key mappings for floating tertrue
vim.keymap.set('n', '<Leader>tt', FloatingTerminal, { noremap = true, silent = true, desc = 'Toggle floating terminal' })
vim.keymap.set('t', '<Esc>', function()
  if terminal_state.is_open then
    vim.api.nvim_win_close(terminal_state.win, false)
    terminal_state.is_open = false
  end
end, { noremap = true, silent = true, desc = 'Close floating terminal from terminal mode' })

local harpoon = require 'harpoon'
harpoon:setup()

vim.keymap.set('n', '<leader>a', function()
  harpoon:list():add()
end, { noremap = true, silent = true, desc = 'Harpoon tf out this file' })
vim.keymap.set('n', '<leader><leader>', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { noremap = true, silent = true, desc = 'Harpoon Quick List' })

vim.keymap.set('n', '<leader>1', function()
  harpoon:list():select(1)
end, { noremap = true, silent = true, desc = 'Harpoon: 1' })
vim.keymap.set('n', '<leader>2', function()
  harpoon:list():select(2)
end, { noremap = true, silent = true, desc = 'Harpoon: 2' })
vim.keymap.set('n', '<leader>3', function()
  harpoon:list():select(3)
end, { noremap = true, silent = true, desc = 'Harpoon: 3' })
vim.keymap.set('n', '<leader>4', function()
  harpoon:list():select(4)
end, { noremap = true, silent = true, desc = 'Harpoon: 4' })

vim.keymap.set('n', '<leader><tab>', function()
  harpoon:list():next()
end, { noremap = true, silent = true, desc = 'Next File Harpooned' })
