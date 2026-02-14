-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

-- vim.g.mapleader = " "
vim.opt.rtp:prepend(lazypath)

-- numbers: 
vim.opt.number = true          
--vim.opt.relativenumber = true 
vim.opt.cursorline = true      
vim.opt.termguicolors = true 

-- tabs and spaces
vim.opt.tabstop = 4             
vim.opt.shiftwidth = 4         
vim.opt.expandtab = true        
vim.opt.smartindent = true     

-- lazy.nvim: 
require("lazy").setup({
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          section_separators = '',
          component_separators = ''
        }
      })
    end,
  },

  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()

    require("nvim-tree").setup({
      sort_by = "case_sensitive",
      sync_root_with_cwd = true,
      respect_buf_cwd = true,

      view = {
        width = 30,
        side = "left",
      },

      renderer = {
        group_empty = true,
        highlight_git = true,
        highlight_opened_files = "all",
      },

      update_focused_file = {
        enable = true,
        update_root = true,
      },

      filters = {
        dotfiles = false,
      },

      actions = {
        open_file = {
          quit_on_open = false, 
        },
      },
    })

    local api = require("nvim-tree.api")

    -- open at start: 
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function(data)
        if data.file == "" then
          api.tree.open()
        else
          api.tree.open()
          api.tree.find_file(data.file)
          vim.cmd("wincmd p") 
        end
      end,
    })

    -- close nvim:
    vim.api.nvim_create_autocmd("BufEnter", {
      nested = true,
      callback = function()
        if #vim.api.nvim_list_wins() == 1 then
          local bufname = vim.api.nvim_buf_get_name(0)
          if bufname:match("NvimTree_") then
            vim.cmd("quit")
          end
        end
      end,
    })

    -- set keymap:
    vim.keymap.set("n", "<leader>e", api.tree.toggle, { silent = true })
  end,
},
    { "neovim/nvim-lspconfig", },
})

vim.cmd.colorscheme "catppuccin"

