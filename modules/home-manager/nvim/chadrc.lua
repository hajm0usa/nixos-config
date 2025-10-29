local M = {}

M.base46 = {
	theme = "rxyhn",

	hl_override = {
		Comment = { italic = true },
		["@comment"] = { italic = true },
	},
}

M.nvdash = { load_on_startup = true }
M.ui = {
	tabufline = {
		lazyload = false,
	},
}
