require "nvchad.options"

-- add yours here!

local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
-- o.guicursor = "n-v-c-i:block"
o.termguicolors = true
-- Whitespace / tab behavior
o.copyindent = true
o.textwidth = 100
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
-- Break indent (soft wrap indent)
o.breakindent = true

-- Persistent undo
o.undofile = true
-- Signs and UI behavior
o.signcolumn = "yes"
o.updatetime = 250 -- affects CursorHold, diagnostics, etc.
o.timeoutlen = 300 -- mapped sequence wait time
o.cursorline = false
o.scrolloff = 5
o.confirm = true
-- Read-only/hidden buffer behavior
o.autoread = true
o.hidden = true
o.backspace = "indent,eol,start"
o.redrawtime = 10000
o.maxmempattern = 20000
o.splitright = true
o.splitbelow = true
o.guicursor = "n-v-c-sm:block,ci-ve:ver25,r-cr-o:hor20,i:block-blinkwait700-blinkoff400-blinkon250-Cursor/lCursor"
