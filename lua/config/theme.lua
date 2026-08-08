require("themery").setup({
	themes = {
		{ name = "Tokyo Night Storm", colorscheme = "tokyonight-storm" },
		{ name = "Tokyo Night Moon", colorscheme = "tokyonight-moon" },
		{ name = "Tokyo Night Night", colorscheme = "tokyonight-night" },
		{ name = "Tokyo Night Day", colorscheme = "tokyonight-day" },

		{ name = "Catppuccin Mocha", colorscheme = "catppuccin-mocha" },
		{ name = "Catppuccin Macchiato", colorscheme = "catppuccin-macchiato" },
		{ name = "Catppuccin Frappe", colorscheme = "catppuccin-frappe" },
		{ name = "Catppuccin Latte", colorscheme = "catppuccin-latte" },

		{ name = "Kanagawa Wave", colorscheme = "kanagawa-wave" },
		{ name = "Kanagawa Dragon", colorscheme = "kanagawa-dragon" },
		{ name = "Kanagawa Lotus", colorscheme = "kanagawa-lotus" },

		{ name = "Gruvbox Dark", colorscheme = "gruvbox" },

		{ name = "Nightfox", colorscheme = "nightfox" },
		{ name = "Dayfox", colorscheme = "dayfox" },
		{ name = "Duskfox", colorscheme = "duskfox" },
		{ name = "Dawnfox", colorscheme = "dawnfox" },
		{ name = "Terafox", colorscheme = "terafox" },
		{ name = "Carbonfox", colorscheme = "carbonfox" },

		{ name = "Everforest Dark", colorscheme = "everforest" },

		{ name = "Dracula", colorscheme = "dracula" },
		{ name = "Dracula Soft", colorscheme = "dracula-soft" },

		{ name = "Vague", colorscheme = "vague" },

		{ name = "Nord", colorscheme = "nord" },

		{ name = "OneDark", colorscheme = "onedark" },

		{ name = "Moonfly", colorscheme = "moonfly" },
		{ name = "Nightfly", colorscheme = "nightfly" },

		{ name = "Cyberdream", colorscheme = "cyberdream" },

		{ name = "Oxocarbon", colorscheme = "oxocarbon" },

		{ name = "Ayu Dark", colorscheme = "ayu-dark" },
		{ name = "Ayu Mirage", colorscheme = "ayu-mirage" },
		{ name = "Ayu Light", colorscheme = "ayu-light" },

		{ name = "GitHub Dark Default", colorscheme = "github_dark_default" },
		{ name = "GitHub Dark Dimmed", colorscheme = "github_dark_dimmed" },
		{ name = "GitHub Dark High Contrast", colorscheme = "github_dark_high_contrast" },
		{ name = "GitHub Dark Colorblind", colorscheme = "github_dark_colorblind" },
		{ name = "GitHub Dark Tritanopia", colorscheme = "github_dark_tritanopia" },

		{ name = "GitHub Light Default", colorscheme = "github_light_default" },
		{ name = "GitHub Light High Contrast", colorscheme = "github_light_high_contrast" },
		{ name = "GitHub Light Colorblind", colorscheme = "github_light_colorblind" },
		{ name = "GitHub Light Tritanopia", colorscheme = "github_light_tritanopia" },
	},

	livePreview = true,
})

vim.keymap.set("n", "th", "<cmd>Themery<CR>", {
	desc = "Change theme",
})
