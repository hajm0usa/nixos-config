require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "pyright", "ts_ls", "gopls", "clangd", "lua_ls", "nil_ls" }
vim.lsp.enable(servers)
