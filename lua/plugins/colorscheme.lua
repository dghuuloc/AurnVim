-- SELECTS COLORSCHEME 
vim.cmd [[colorscheme tokyonight]]

-- CONFIGURATION OF TOKYONIGHT
vim.opt.background = 'dark'

vim.g.material_style = "night"
vim.g.material_italic_comments = 1
vim.g.material_italic_keywords = 1
vim.g.material_italic_functions = 1
vim.g.material_lsp_underline = 1

vim.g.sonokai_style = "atlantis"
vim.g.sonokai_enable_italic = 1
vim.g.sonokai_disable_italic_comment = 1
vim.g.sonokai_diagnostic_virtual_text = "colored"

vim.g.edge_style = "neon"
vim.g.edge_enable_italic = 1
vim.g.edge_disable_italic_comment = 0
vim.g.edge_transparent_background = 0

vim.g.embark_terminal_italics = 1

vim.g.nightflyTransparent = 0

vim.g.nvcode_termcolors = 256

vim.g.tokyonight_dev = true
vim.g.tokyonight_style = "storm"
vim.g.tokyonight_sidebars = {
  "qf",
  "vista_kind",
  "terminal",
  "packer",
  "spectre_panel",
  "NeogitStatus",
  "help",
}
vim.g.tokyonight_cterm_colors = false
vim.g.tokyonight_terminal_colors = true
vim.g.tokyonight_italic_comments = true
vim.g.tokyonight_italic_keywords = true
vim.g.tokyonight_italic_functions = false
vim.g.tokyonight_italic_variables = false
vim.g.tokyonight_transparent = false
vim.g.tokyonight_hide_inactive_statusline = true
vim.g.tokyonight_dark_sidebar = true
vim.g.tokyonight_dark_float = true
vim.g.tokyonight_colors = {}

-- CONFIGURATION OF ONEDARKPRO 
require("onedarkpro").setup({
  -- extra from https://github.com/navarasu/onedark.nvim/blob/master/lua/onedark/colors.lua
  colors = {bg_blue = "#73b8f1", dark_purple = "#8a3fa0"},
  hlgroups = {
    -- TSProperty = { fg = "${gray}" },
    -- TSVariable = { fg = "${fg}" },
  },
  styles = {
    -- functions = "bold,italic",
    -- variables = "italic",
  },
  options = {transparency = true}
})
-- CONFIGURATION OF DRACULA 
vim.g.dracula_transparent_bg = true

-- CONFIGURATION OF NIGHTFOX
local nightfox = require("nightfox")
nightfox.setup({fox = "duskfox", transparent = true, alt_nc = true})

-- CONFIGURATION OF MATERIAL
vim.g.material_style = "palenight"
require("material").setup({
  borders = true,
  disable = {background = true},
  custom_highlights = {
    IndentBlanklineContextChar = {fg = "#C678DD"},
    StatusLine = {bg = "#00000000"}
    -- TODO: cmp item kind highlights
    -- https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#how-to-add-visual-studio-code-dark-theme-colors-to-the-menu
    -- HLGROUP = { link = "OTHER_GROUP" },
  }
})
