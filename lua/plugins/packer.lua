local fn = vim.fn

-- Install Packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_INSTALLER = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
)

-- Install your plugins here
return packer.startup(function(use)

  --- Plugin are installed here ---
  use {'wbthomason/packer.nvim'}
  use {'nvim-lua/plenary.nvim'}
  -- use {'moll/vim-bbye'}
  -- use {'ahmedkhalf/project.nvim'}
  -- use {'lewis6991/impatient.nvim'}
  -- use {'antoinemadec/FixCursorHold.nvim'}
  -- use {'unblevable/quick-scope'}
  -- use {'nacro90/numb.nvim'}
  -- use {'monaqa/dial.nvim'}
  -- use {'folke/zen-mode.nvim'}
  -- use {'karb94/neoscroll.nvim'}
  -- use {'kevinhwang91/nvim-bqf'}
  -- use {'ThePrimeagen/harpoon'}
  -- use {'MattesGroeger/vim-bookmarks'}
  -- use {'lunarvim/vim-solidity'}
  -- use {'Shatur/neovim-session-manager'}
  use {'simrat39/rust-tools.nvim'}

  -- Explorer
  use {'kyazdani42/nvim-tree.lua'}

  -- Better motions
  use {'phaazon/hop.nvim'}

  -- Lsp
  use {'williamboman/nvim-lsp-installer'}
  use {'jose-elias-alvarez/nvim-lsp-ts-utils'}
  use {'neovim/nvim-lspconfig'}
  use {'tamago324/nlsp-settings.nvim'}
  use {'jose-elias-alvarez/null-ls.nvim'}
  use {'filipdutescu/renamer.nvim'}
  use {'simrat39/symbols-outline.nvim'}
  use {
    'folke/trouble.nvim',
    cmd = 'TroubleToggle',
  }
  use {'onsails/lspkind-nvim'}
  use {'glepnir/lspsaga.nvim'}
  use {'ray-x/lsp_signature.nvim'}

  -- Java
  use {'mfussenegger/nvim-jdtls'}

  -- ReactJS
  use {'dsznajder/vscode-es7-javascript-react-snippets',
    run = 'yarn install --frozen-lockfile && yarn compile'}

  -- Completion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      'hrsh7th/vim-vsnip-integ',
      'hrsh7th/cmp-emoji',
      'hrsh7th/cmp-calc',
      'f3fora/cmp-spell',
    }
  }


  -- Snippets
  use {'rafamadriz/friendly-snippets'}
  use {'L3MON4D3/LuaSnip'}
  use {'saadparwaiz1/cmp_luasnip'}

  -- Code formater
  use {'mhartington/formatter.nvim'}

  -- Theme
  use {'folke/tokyonight.nvim'}
  use {'olimorris/onedarkpro.nvim'}
  use {'Mofiqul/dracula.nvim'}
  use {'EdenEast/nightfox.nvim'}
  use {'marko-cerovac/material.nvim'}
  use {'lunarvim/colorschemes'}
  use {'lunarvim/darkplus.nvim'}
  use {'catppuccin/nvim'}
  use {'rose-pine/neovim'}

  -- Color
  use {'norcalli/nvim-colorizer.lua'}

  -- Terminal intergration
  use {"akinsho/toggleterm.nvim"}

  -- Fuzzy Finder
  use {'nvim-lua/popup.nvim'}
  use {'nvim-telescope/telescope.nvim'}

  -- Icon
  use {'ryanoasis/vim-devicons'}
  use {'kyazdani42/nvim-web-devicons'}

  -- Tabline & Statusline
  use {'romgrk/barbar.nvim'}
  use {'glepnir/galaxyline.nvim'}
  -- use {'akinsho/bufferline.nvim'}
  -- use {'nvim-lualine/lualine.nvim'}

  -- Git-Version Control
  use {'lewis6991/gitsigns.nvim'}
  use "f-person/git-blame.nvim"
  use "ruifm/gitlinker.nvim"
  use "mattn/vim-gist"
  use "mattn/webapi-vim"

  -- HTML preview
  use {'turbio/bracey.vim',
    run = 'npm install --prefix server'}

  -- Start Screen
  use {'glepnir/dashboard-nvim'}
  use {'goolord/alpha-nvim'}

  -- Comments
  use {'folke/todo-comments.nvim'}
  use {'numToStr/Comment.nvim'}
  use {
    'terrortylor/nvim-comment',
    config = function()
      require'nvim_comment'.setup {}
    end
  }
  use {'JoosepAlviste/nvim-ts-context-commentstring'}

  -- Treesitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use {'lukas-reineke/indent-blankline.nvim'}
  use {'windwp/nvim-ts-autotag'}
  use {'windwp/nvim-autopairs'}
  use {'p00f/nvim-ts-rainbow'}
  use {'andymass/vim-matchup'}

  -- Keybinds
  use {'folke/which-key.nvim'}

  -- Markdown preview
  use {'iamcco/markdown-preview.nvim',
      run = ':call mkdp#util#install()',
      ft = 'markdown',
      }

  -- Search & Replace
  use {'windwp/nvim-spectre'}

  --- Stop aadding Plugin right here! ---
  -- Put this at the end after all plugins
  if PACKER_INSTALLER then
    require('packer').sync()
  end
end)

