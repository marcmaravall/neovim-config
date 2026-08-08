require("gitsigns").setup({
  signs = {
    add = { text = "│" },
    change = { text = "│" },
    delete = { text = "_" },
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns
    vim.keymap.set("n", "]h", gs.next_hunk, { buffer = bufnr })
    vim.keymap.set("n", "[h", gs.prev_hunk, { buffer = bufnr })
    vim.keymap.set("n", "<leader>hs", gs.stage_hunk, { buffer = bufnr })
    vim.keymap.set("n", "<leader>hp", gs.preview_hunk, { buffer = bufnr })
    vim.keymap.set("n", "<leader>hb", gs.blame_line, { buffer = bufnr })
  end,
})