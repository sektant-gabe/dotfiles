-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'RostislavArts/naysayer.nvim',
    priority = 1000,
    lazy = false,
    transparent = true,
    config = function()
      vim.cmd.colorscheme 'naysayer'
    end,
  },
  {
    'tribela/transparent.nvim',
    event = 'VimEnter',
    config = true,
    lazy = false,
  },
  {
    'mvllow/modes.nvim',
    event = 'VeryLazy',
    opts = {
      colors = {
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
    'rmagatti/auto-session',
    config = function()
      require('auto-session').setup {
        auto_session_suppress_dirs = { '~/', '~/projects', '~/Downloads', '/', '~/.config' },
        session_lens = {
          buftypes_to_ignore = {},
          load_on_setup = true,
          theme_conf = { border = true },
          previewer = false,
        },
      }

      vim.keymap.set('n', '<Leader>ls', ':SessionSearch<CR>', {
        noremap = true,
      })
    end,
  },
  { 'honza/vim-snippets' },
  -- { 'alljokecake/naysayer-theme.nvim', as = 'naysayer', priority = 1000, lazy = false },
  { 'ThePrimeagen/vim-be-good' },
}
