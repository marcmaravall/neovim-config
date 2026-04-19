vim.g.mapleader = " "

-- ======================
-- LAZY BOOTSTRAP
-- ======================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git","clone","--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ======================
-- BASIC SETTINGS
-- ======================
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

-- ======================
-- PLUGINS
-- ======================
require("lazy").setup({

-- THEME
{
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "night",
    })
    vim.cmd("colorscheme tokyonight-night")
  end,
},

-- STATUSLINE
{
  "nvim-lualine/lualine.nvim",
  dependencies = {"nvim-tree/nvim-web-devicons"},
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto",
        section_separators = "",
        component_separators = "",
      },
    })
  end,
},

-- FILE EXPLORER
{
  "nvim-tree/nvim-tree.lua",
  dependencies = {"nvim-tree/nvim-web-devicons"},
  config = function()
    require("nvim-tree").setup({
      view = { width = 30 },
      renderer = {
        highlight_git = true,
        highlight_opened_files = "all",
      },
      update_focused_file = { enable = true },
    })

    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
  end,
},

-- TELESCOPE
{
  "nvim-telescope/telescope.nvim",
  dependencies = {"nvim-lua/plenary.nvim"},
  config = function()
    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>ff", builtin.find_files)
    vim.keymap.set("n", "<leader>fg", builtin.live_grep)
    vim.keymap.set("n", "<leader>fb", builtin.buffers)
  end,
},

-- TREESITTER
{
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local ok, ts = pcall(require, "nvim-treesitter.configs")
    if not ok then return end

    ts.setup({
      ensure_installed = { "lua", "c", "cpp" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
},

-- LSP 
{
  "neovim/nvim-lspconfig",
  config = function()
    vim.lsp.config("clangd", {
      cmd = { "clangd", "--background-index" },
    })

    vim.lsp.enable("clangd")

    vim.keymap.set("n", "gd", vim.lsp.buf.definition)
    vim.keymap.set("n", "K", vim.lsp.buf.hover)
    vim.keymap.set("n", "gr", vim.lsp.buf.references)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
  end,
},

-- AUTOCOMPLETE
{
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
  },
  config = function()
    local cmp = require("cmp")

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),
      sources = {
        { name = "nvim_lsp" },
      },
    })
  end,
},

-- DIAGNOSTICS
{
  "folke/trouble.nvim",
  config = function()
    require("trouble").setup()
    vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>")
  end,
},

-- BUFFERLINE 
{
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
 
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        diagnostics = "nvim_lsp",
        separator_style = "padded_slant",
        show_close_icon = false,
      },
    })

    vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>")
    vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>")
    vim.keymap.set("n", "<leader>c", ":bd<CR>")
  end,
},

})
