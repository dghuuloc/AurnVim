local M = {}

M.fuctions = {}

function M.log(msg, hl, name)
  name = name or "Neovim"
  hl = hl or "Todo"
  vim.api.nvim_echo({ { name .. ": ", hl }, { msg } }, true, {})
end

function M.warn(msg, name)
  M.log(msg, "DiagnosticWarn", name)
end

function M.error(msg, name)
  M.log(msg, "DiagnosticError", name)
end

function M.info(msg, name)
  M.log(msg, "DiagnosticInfo", name)
end

function M.vim_options(vim_opt, options)
  for k, v in pairs(options) do
    vim_opt[k] = v
  end
end

return M
