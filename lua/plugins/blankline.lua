require("indent_blankline").setup {
  char = '▏',
  context_char = '▏',
  filetype_exclude = {
    "help",
    "alpha",
    "dashboard",
    "NvimTree",
    "packer",
    "Trouble",
  },
  buftype_exclude = {"terminal", "nofile"},
  show_trailing_blankline_indent = false,
  show_current_context = true,
  show_first_indent_level = true,
  use_treesitter = true,
  context_patterns = {
    "class",
    "return",
    "function",
    "method",
    "^if",
    "^while",
    "jsx_element",
    "^for",
    "^object",
    "^table",
    "block",
    "arguments",
    "if_statement",
    "else_clause",
    "jsx_element",
    "jsx_self_closing_element",
    "try_statement",
    "catch_clause",
    "import_statement",
    "operation_type"
  },
}

