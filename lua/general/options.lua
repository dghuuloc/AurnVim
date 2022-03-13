local vim_options = require('utils').vim_options

vim_options(vim.opt, {
  backup = false,                               -- creates a backup file
  clipboard = 'unnamedplus',                    -- allow neovim to access the system clipboard
  swapfile = false,                             -- create a swapfile
  wrap = false,                                -- display lines as one long line
  smartcase = true,                             -- smart case
  hlsearch = true,                             -- highlight all matches on previous search pattern
  mouse = 'a',                                  -- allow the mouse to be used in neovim
  syntax = 'on',
  ignorecase = true,                            -- ignore case in search patterns
  fileencoding = 'UTF-8',                       -- the endcoding written to a file
  splitright = true,                            -- force all vertical splits to go to the right of current window
  splitbelow = true,                            -- force all horizontal splits to go below current window
  number = true,                                -- set numbered lines
  signcolumn = 'yes',                           -- always show the sign column, otherwise it would shift the text each time
  cursorline = true,                            -- highlight the current line
  expandtab = true,                             -- convert tabs to spaces
  tabstop = 2,                                  -- insert 2 spaces for a tab
  shiftwidth = 2,                               -- the number of spaces inserted for each indentation
  updatetime = 300,                             -- faster completion (4000ms default)
  showmode = false,                             -- Don't display mode
  showtabline = 2,                              -- always show tabs
  termguicolors = true,                         -- You will have bad experience for diagnostic messages when it's default 4000.
  hidden = true,                                -- Get a preview of replacements
  inccommand = 'nosplit',
  whichwrap = 'b,s,<,>,[,],h,l',
})

