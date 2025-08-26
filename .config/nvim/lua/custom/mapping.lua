-- init.lua — keybindings-only (AstroNvim-inspired)
-- NOTE: This file contains only key mappings and which-key registrations,
-- modeled after common AstroNvim mappings and the keybinds already present
-- in your config. It is intended to be used as a keymaps module or as the
-- keymap section of your init: it does not set up plugins or other options.
--
-- If you already have a full init.lua, prefer requiring this file (e.g.
-- require('custom.keymaps')) from it instead of replacing the whole file.
--
-- I wasn't able to fetch AstroNvim directly here; these mappings follow
-- AstroNvim conventions (leader-space groups, Telescope integration, LSP
-- helpers, diagnostics, terminal toggles, buffer/window helpers) and
-- also keep the bindings I judged useful from your existing init.lua.

-- Leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Basic ergonomics
map('n', '<Esc>', '<cmd>nohlsearch<CR>', opts)                  -- clear search highlight
map('n', 'Y', 'y$', { desc = 'Yank to end of line', noremap = true }) -- behave like other ops
map('i', 'jj', '<Esc>', { silent = true, desc = 'Exit insert mode' })
map('c', 'jj', '<Esc>', { silent = true, desc = 'Exit command-line' })

-- Clipboard (safe, non-destructive mapping left out; keep your existing behavior)

-- Window navigation (consistent with many setups / AstroNvim)
map('n', '<C-h>', '<C-w>h', { desc = 'Window: left', noremap = true })
map('n', '<C-j>', '<C-w>j', { desc = 'Window: down', noremap = true })
map('n', '<C-k>', '<C-w>k', { desc = 'Window: up', noremap = true })
map('n', '<C-l>', '<C-w>l', { desc = 'Window: right', noremap = true })

-- Window resizing
map('n', '<C-Up>', ':resize +2<CR>', { desc = 'Increase window height' })
map('n', '<C-Down>', ':resize -2<CR>', { desc = 'Decrease window height' })
map('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'Decrease window width' })
map('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'Increase window width' })

-- Buffer navigation and management
map('n', '<Tab>', ':bnext<CR>', { desc = 'Buffer: Next', noremap = true })
map('n', '<S-Tab>', ':bprevious<CR>', { desc = 'Buffer: Previous', noremap = true })
map('n', '<leader>bd', ':bd<CR>', { desc = 'Buffer: Delete', noremap = true })
map('n', '<leader>w', ':w<CR>', { desc = '[W]rite file', noremap = true })
map('n', '<leader>q', ':bd<CR>', { desc = '[Q]uit buffer', noremap = true })

-- Move lines up/down (keep Alt variants and add leader fallbacks)
map('n', '<A-j>', ':m .+1<CR>==', { desc = 'Move line down (Alt-j)' })
map('n', '<A-k>', ':m .-2<CR>==', { desc = 'Move line up (Alt-k)' })
map('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down (Alt-j)' })
map('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up (Alt-k)' })
map('n', '<leader>J', ':m .+1<CR>==', { desc = 'Move line down (fallback)' })
map('n', '<leader>K', ':m .-2<CR>==', { desc = 'Move line up (fallback)' })

-- Indentation in visual mode: keep selection
map('v', '<', '<gv', { desc = 'Indent left and reselect' })
map('v', '>', '>gv', { desc = 'Indent right and reselect' })

-- Yank/paste helpers (explicit descriptions so which-key shows them)
map('x', '<leader>p', [["_dP]], { desc = 'Visual: Paste without overwriting register' })

-- Diagnostics navigation & quick actions (AstroNvim-style)
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Diagnostics: previous' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Diagnostics: next' })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Diagnostics: open float' })
map('n', '<leader>qf', vim.diagnostic.setloclist, { desc = 'Diagnostics: set loclist' })

-- Telescope (Search) — gracefully require telescope if available
local has_telescope, builtin = pcall(require, 'telescope.builtin')
if has_telescope and builtin then
  map('n', '<leader>ff', builtin.find_files, { desc = '[F]ind files' })
  map('n', '<leader>fg', builtin.live_grep, { desc = '[G]rep (live)' })
  map('n', '<leader>fb', builtin.buffers, { desc = '[B]uffers' })
  map('n', '<leader>fh', builtin.help_tags, { desc = '[H]elp tags' })
  map('n', '<leader>fr', builtin.resume, { desc = '[R]esume telescope' })
  map('n', '<leader>/', function()
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
      winblend = 10,
      previewer = true,
    })
  end, { desc = 'Fuzzily search in current buffer' })
else
  -- Fallbacks: simple commands if telescope missing
  map('n', '<leader>ff', ':edit .<CR>', { desc = '[F]ind files (fallback)', noremap = true })
end

-- Which-key registration for leader groups (AstroNvim uses many clear groups)
local wk_ok, which_key = pcall(require, 'which-key')
if wk_ok and which_key then
  which_key.register({
    ["<leader>"] = {
      f = { name = 'File/Search' },
      b = { name = 'Buffers' },
      w = { name = 'Window' },
      t = { name = 'Toggle/Terminal' },
      g = { name = 'Git' },
      c = { name = 'CMake/Compile' },
      d = { name = 'Debug' },
      h = { name = 'Git Hunk' },
      s = { name = 'Search' },
    },
  }, { prefix = '<leader>' })
end

-- Compiler key mappings (make descriptive so which-key or help shows intent)
map('n', '<F5>', '<cmd>CompilerOpen<cr>', { desc = 'Compiler: Open' })
map('n', '<F6>', '<cmd>CompilerStop<cr><cmd>CompilerRedo<cr>', { desc = 'Compiler: Stop & Redo' })
map('n', '<F7>', '<cmd>CompilerToggleResults<cr>', { desc = 'Compiler: Toggle Results' })

-- CMake group (converted to vim.keymap.set with descriptions)
map('n', '<leader>cg', ':CMakeGenerate<cr>', { desc = '[C]Make: [G]enerate' })
map('n', '<leader>cb', ':CMakeBuild<cr>', { desc = '[C]Make: [B]uild' })
map('n', '<leader>cq', ':CMakeClose<cr>', { desc = '[C]Make: [C]lose' })
map('n', '<leader>cc', ':CMakeClean<cr>', { desc = '[C]Make: [C]lean' })

-- LSP-ish global helpers (AstroNvim prefers buffer-local on LspAttach, but these are safe)
map('n', 'gd', vim.lsp.buf.definition, { desc = 'LSP: goto definition' })
map('n', 'gD', vim.lsp.buf.declaration, { desc = 'LSP: goto declaration' })
map('n', 'gr', function() local ok, tb = pcall(require,'telescope.builtin') if ok then tb.lsp_references() else vim.lsp.buf.references() end end, { desc = 'LSP: references' })
map('n', 'gi', vim.lsp.buf.implementation, { desc = 'LSP: goto implementation' })
map('n', 'K', vim.lsp.buf.hover, { desc = 'LSP: hover' })
map('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'LSP: rename' })
map('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'LSP: code action' })

-- Terminal toggles:
-- Keep a safe fallback: open a terminal split with leader + tt; if you have a floating terminal func,
-- you can replace this mapping to call it (e.g., FloatingTerminal).
map('n', '<leader>tt', ':terminal<CR>', { desc = '[T]erminal: open terminal split' })
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Terminal: exit to Normal mode' })

-- Harpoon-like quickmarks (if harpoon present)
local has_harpoon, harpoon = pcall(require, 'harpoon.ui')
if has_harpoon and harpoon then
  map('n', '<leader>ha', function() require('harpoon.mark').add_file() end, { desc = 'Harpoon: add file' })
  map('n', '<leader>hh', harpoon.toggle_quick_menu, { desc = 'Harpoon: toggle menu' })
  map('n', '<leader>hn', function() require('harpoon.ui').nav_next() end, { desc = 'Harpoon: next' })
  map('n', '<leader>hp', function() require('harpoon.ui').nav_prev() end, { desc = 'Harpoon: prev' })
end

-- Keep small ergonomics: join without moving cursor
map('n', 'J', 'mzJ`z', { desc = 'Join lines and keep cursor position' })

-- Ensure the mappings are visible to which-key (re-register individual keys with desc if needed)
-- End of keybindings-only init.lua