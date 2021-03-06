require("which-key").setup {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ...
      motions = false, -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true -- bindings for prefixed with g
    }
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+" -- symbol prepended to a group
  },
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = {1, 0, 1, 0}, -- extra window margin [top, right, bottom, left]
    padding = {2, 2, 2, 2} -- extra window padding [top, right, bottom, left]
  },
  layout = {
    height = {min = 4, max = 25}, -- min and max height of the columns
    width = {min = 20, max = 50}, -- min and max width of the columns
    spacing = 3 -- spacing between columns
  },
  hidden = {"<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true -- show help message on the command line when the popup is visible
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false -- use `nowait` when creating keymaps
}

-- TODO create entire treesitter section
local Terminal = require('toggleterm.terminal').Terminal
local toggle_float = function()
  local float = Terminal:new({direction = 'float'})
  return float:toggle()
end

local mappings = {
  ["/"] = "Comment",
  ["c"] = "Close Buffer",
  ["e"] = "Explorer",
  ["h"] = "No Highlight",
  ["q"] = {":q!<cr>", "Quit"},
  ["w"] = {":w!<cr>", "Save"},
  ["Q"] = {":wq<cr>", "Save & Quit"},
  ["F"] = {":Telescope live_grep<cr>", "Find Text"},
  ["f"] = {
    "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    "Find files",
  },

  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },

  l = {
    name = "+LSP",
    a = {"<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action"},
    d = {"<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics"},
    w = {"<cmd>Telescope lsp_workspace_diagnostics<cr>","Workspace Diagnostics"},
    f = {"<cmd>lua vim.lsp.buf.formatting()<cr>", "Format"},
    i = {"<cmd>LspInfo<cr>", "Info"},
    I = {"<cmd>LspInstallInfo<cr>", "Installer Info"},
    j = {"<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Next Diagnostic"},
    k = {"<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Prev Diagnostic"},
    l = {"<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action"},
    q = {"<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix"},
    r = {"<cmd>lua vim.lsp.buf.rename()<cr>", "Rename"},
    s = {"<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols"},
    S = {"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols"},
  },

  g = {
    name = "Git",
    j = {"<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk"},
    k = {"<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk"},
    l = {"<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame"},
    p = {"<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk"},
    r = {"<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk"},
    R = {"<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer"},
    s = {"<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk"},
    u = {"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk"},
    o = {"<cmd>Telescope git_status<cr>", "Open changed file"},
    b = {"<cmd>Telescope git_branches<cr>", "Checkout branch"},
    c = {"<cmd>Telescope git_commits<cr>", "Checkout commit"},
    d = {"<cmd>Gitsigns diffthis HEAD<cr>", "Diff"},
  },

  s = {
    name = "Search",
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
  },

  t = {
    name = "Terminal",
    n = {'<cmd>lua_NODE_TOGGLE()<cr>', 'Node'},
    t = {'<cmd>lua_HTOP_TOGGLE()<cr>', 'Htop'},
    p = {'<cmd>lua_PYTHON_TOGGLE()<cr>', 'Python'},
    f = {"<cmd>ToggleTerm direction=float<cr>", "Float" },
    h = {"<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
    v = {"<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
  },

  M = {
    name = '+Markdown',
    v = {'<cmd>MarkdownPreview<CR>', 'Markdown Preview'},
    s = {'<cmd>MarkdownPreviewStop<CR>', 'Markdown Preview Stop'},
    t = {'<cmd>MarkdownPreviewToggle<CR>', 'Markdown Preview Toggle'}
  },
}

local wk = require("which-key")
wk.register(mappings, opts)
