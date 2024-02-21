local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({buffer = bufnr})
end)

local lspconfig = require('lspconfig')

lspconfig.gopls.setup {}
lspconfig.cssls.setup{}
lspconfig.html.setup{}
lspconfig.htmx.setup{}
