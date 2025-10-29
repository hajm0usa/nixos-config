require("nvchad.mappings")

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>pp", function()
	require("telescope").extensions.project.project({})
end, { desc = "Open Project Manager" })
