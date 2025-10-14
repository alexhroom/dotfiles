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
  { 'ibhagwan/fzf-lua', dependencies = {"nvim-tree/nvim-web-devicons"}},
  { 'neovim/nvim-lspconfig' },
  { 'github/copilot.vim' },
})
require('lspconfig').ruff.setup({})
require('lspconfig').rust_analyzer.setup({})

require('monokai').setup {palette = require('monokai').pro}

require('fzf-lua').setup({ 'borderless-full' })

vim.api.nvim_create_user_command('T', 'NvimTreeToggle', {})
vim.keymap.set('n', 'ca<CR>', require('fzf-lua').lsp_code_actions)
vim.keymap.set('n', 'cs<CR>', require('fzf-lua').lsp_finder)

require'nvim-treesitter.configs'.setup {
    -- Modules and its options go here
    highlight = { enable = true, additional_vim_regex_highlighting = { "python" } },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
  }

local wilder = require('wilder')
wilder.setup({modes = {':', '/', '?'}})

