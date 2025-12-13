-- lua/plugins/rose-pine.lua
function ColorMyPencils(color)
	color = color or "kanagawa"

	vim.cmd.colorscheme(color)

	--vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			--vim.cmd("colorscheme rose-pine")
			require("rose-pine").setup({
				extend_background_behind_borders = false,
				enable = {
					terminal = true,
					legacy_highlights = true,
					migrations = true,
				},
				styles = {
					italic = false,
					transparency = false,
				},
			})

			ColorMyPencils()
		end,
	},

	{
		"rebelot/kanagawa.nvim",
		name = "kanagawa",
		config = function()
			require("kanagawa").setup({
				compile = false, -- enable compiling the colorscheme
				undercurl = true, -- enable undercurls
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = { italic = true },
				statementStyle = { bold = true },
				typeStyle = {},
				transparent = false, -- do not set background color
				dimInactive = false, -- dim inactive window `:h hl-NormalNC`
				terminalColors = true, -- define vim.g.terminal_color_{0,17}
				colors = { -- add/modify theme and palette colors
					palette = {},
					theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
				},
				overrides = function(colors) -- add/modify highlights
					return {}
				end,
				theme = "wave", -- Load "wave" theme
				background = { -- map the value of 'background' option to a theme
					dark = "wave", -- try "dragon" !
					light = "lotus",
				},
			})

			ColorMyPencils()
		end,
	},

	{
		"nuvic/flexoki-nvim",
		name = "flexoki",
		config = function()
			require("flexoki").setup({
				variant = "moon", -- auto, moon, or dawn
				dim_inactive_windows = false,
				extend_background_behind_borders = true,

				enable = {
					terminal = true,
				},

				styles = {
					bold = true,
					italic = false,
				},

				groups = {
					border = "muted",
					link = "purple_two",
					panel = "surface",

					error = "red_one",
					hint = "purple_one",
					info = "cyan_one",
					ok = "green_one",
					warn = "orange_one",
					note = "blue_one",
					todo = "magenta_one",

					git_add = "green_one",
					git_change = "yellow_one",
					git_delete = "red_one",
					git_dirty = "yellow_one",
					git_ignore = "muted",
					git_merge = "purple_one",
					git_rename = "blue_one",
					git_stage = "purple_one",
					git_text = "magenta_one",
					git_untracked = "subtle",

					h1 = "purple_two",
					h2 = "cyan_two",
					h3 = "magenta_two",
					h4 = "orange_two",
					h5 = "blue_two",
					h6 = "cyan_two",
				},

				palette = {
					-- Override the builtin palette per variant
					-- moon = {
					--     base = '#100f0f',
					--     overlay = '#1c1b1a',
					-- },
				},

				highlight_groups = {
					-- Comment = { fg = "subtle" },
					-- VertSplit = { fg = "muted", bg = "muted" },
				},

				before_highlight = function(group, highlight, palette)
					-- Disable all undercurls
					-- if highlight.undercurl then
					--     highlight.undercurl = false
					-- end
					--
					-- Change palette colour
					-- if highlight.fg == palette.blue_two then
					--     highlight.fg = palette.cyan_two
					-- end
				end,
			})
			ColorMyPencils()
		end,
	},
}
