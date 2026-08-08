require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "clangd" },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("clangd", {
	cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--header-insertion=iwyu",
		"--completion-style=detailed",
		"--function-arg-placeholders=1"
	},
	filetypes = { "h", "hpp", "c", "cpp", "objc", "objcpp", "cuda" },
	capabilities = capabilities,
})

vim.lsp.enable("clangd")

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		local map = function(keys, fn)
			vim.keymap.set("n", keys, fn, { buffer = bufnr })
		end

		map("gd", vim.lsp.buf.definition)
		map("gD", vim.lsp.buf.declaration)
		map("gr", vim.lsp.buf.references)
		map("K", vim.lsp.buf.hover)
		map("<leader>rn", vim.lsp.buf.rename)
		map("<leader>ca", vim.lsp.buf.code_action)
		map("<leader>f", function()
			vim.lsp.buf.format({ async = true })
		end)
	end,
})

