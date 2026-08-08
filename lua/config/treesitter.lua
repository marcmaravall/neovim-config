require("nvim-treesitter").setup()
require("nvim-treesitter").install({ "cpp", "c", "lua", "cmake", "vim", "vimdoc", "query" })

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "cpp", "c", "lua", "cmake" },
  callback = function()
    vim.treesitter.start()
    vim.bo.indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
  end,
})

vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    if ev.data.spec.name == "nvim-treesitter" and ev.data.kind == "update" then
      vim.cmd("TSUpdate")
    end
  end,
})
