local ok, alpha = pcall(require, "alpha")
if not ok then
	return
end

local dashboard = require("alpha.themes.dashboard")

-- Header
dashboard.section.header.val = {
	[[                                                     ]],
	[[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
	[[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
	[[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
	[[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
	[[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
	[[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
	[[                                                     ]],
}

dashboard.section.buttons.val = {
	dashboard.button("e", "  New File", "<cmd>ene<CR>"),
	dashboard.button("f", "󰱼  Find File", "<cmd>Telescope find_files<CR>"),
	dashboard.button("g", "󰈬  Live Grep", "<cmd>Telescope live_grep<CR>"),
	dashboard.button("r", "  Recent Files", "<cmd>Telescope oldfiles<CR>"),
	dashboard.button("c", "  Configuration", "<cmd>edit $MYVIMRC<CR>"),
	dashboard.button("u", "  Update Plugins", "<cmd>lua vim.pack.update()<CR>"),
	dashboard.button("q", "  Quit", "<cmd>qa<CR>"),
}

local version = vim.version()

dashboard.section.footer.val = {
	"",
	string.format(" Neovim %d.%d.%d", version.major, version.minor, version.patch),
}

dashboard.section.header.opts.hl = "Type"
dashboard.section.buttons.opts.hl = "Keyword"
dashboard.section.footer.opts.hl = "Comment"

dashboard.opts.layout = {
	{ type = "padding", val = 2 },
	dashboard.section.header,
	{ type = "padding", val = 2 },
	dashboard.section.buttons,
	{ type = "padding", val = 1 },
	dashboard.section.footer,
}

alpha.setup(dashboard.opts)
