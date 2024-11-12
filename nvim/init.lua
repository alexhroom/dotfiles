vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.wrap = false

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    },
  config = function()
    require("nvim-tree").setup {}
  end,
  },
  {'nvim-treesitter/nvim-treesitter'},
  {'gelguy/wilder.nvim'},
  {'tanvirtin/monokai.nvim'},
  { 'junegunn/fzf.vim', dependencies = { 'junegunn/fzf' } },
  { 'neovim/nvim-lspconfig' }
})
require('lspconfig').ruff.setup({
  init_options = {
    settings = {
      -- Ruff language server settings go here
    }
  }
})

require('monokai').setup {palette = require('monokai').pro}

vim.api.nvim_create_user_command('T', 'NvimTreeToggle', {})

require'nvim-treesitter.configs'.setup {
    -- Modules and its options go here
    highlight = { enable = true },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
  }

local wilder = require('wilder')
wilder.setup({modes = {':', '/', '?'}})
