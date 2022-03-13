local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

require("lsp.diagnostic").setup()

local function on_attach(client, bufnr)
  require("lsp.formatting").setup(client, bufnr)

  -- TypeScript specific stuff
  if client.name == "typescript" or client.name == "tsserver" then
    require("lsp.lsp-ts-utils").setup(client)
  end
end

local servers = {
  tsserver = {},
  clangd = {},
  cssls = {},
  dockerls = {},
  -- html = {},
  jsonls = {},
  pyright = {},
  sumneko_lua = {},
  jdtls = {},
  graphql = {},
  emmet_ls = {},
}

local options = {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
}

require'lspconfig.configs'.ls_emmet = {
  default_config = {
    cmd = {'ls_emmet', '--stdio'},
    filetypes = {'html', 'css', 'scss'}, -- Add the languages you use, see language support
    root_dir = function(_)
      return vim.loop.cwd()
    end,
    settings = {}
  }
}

local sumneko_root_path = vim.fn.stdpath('data') .. "/lsp_servers/sumneko_lua/extension/server"
local sumneko_binary = sumneko_root_path .. "/bin/Linux/lua-language-server"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

for _, server in ipairs(servers) do
  if server == 'sumneko_lua' then
    require'lspconfig'[server].setup {
      cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
            -- Setup your lua path
            path = runtime_path
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'}
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {enable = false}
        }
      }
    }
  else
    require'lspconfig'[server].setup {capabilities = capabilities}
  end
end

require("lsp.lsp-installer").setup(servers, options)
