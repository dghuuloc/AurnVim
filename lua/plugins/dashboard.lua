local g = vim.g

g.dashboard_disable_at_vimenter = 0
g.dashboard_disable_statusline = 1
g.dashboard_default_executive = "telescope"
g.dashboard_custom_header = {
'  █████╗ ██╗   ██╗██████╗ ███╗   ██╗██╗   ██╗██╗███╗   ███╗',
' ██╔══██╗██║   ██║██╔══██╗████╗  ██║██║   ██║██║████╗ ████║',
' ███████║██║   ██║██████╔╝██╔██╗ ██║██║   ██║██║██╔████╔██║',
' ██╔══██║██║   ██║██╔══██╗██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║',
' ██║  ██║╚██████╔╝██║  ██║██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║',
' ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝',
}
g.dashboard_custom_footer = {
   "暑@dghuuloc 暑",
}


g.dashboard_custom_section = {
   a = { description = { "  Find File              " }, command = "Telescope find_files" },
   b = { description = { "  Recently Used Files    " }, command = "Telescope oldfiles" },
   c = { description = { "  Find Word              " }, command = "Telescope live_grep" },
   d = { description = { "  Change Colorscheme     " }, command = "Telescope colorscheme" },
}


