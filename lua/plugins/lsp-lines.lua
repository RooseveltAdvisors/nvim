return {
	"ErichDonGubler/lsp_lines.nvim",
	config = function()
		require("lsp_lines").setup()
		vim.diagnostic.config({
			virtual_text = false,
		})
		vim.keymap.set("n", "<C-e>", "<cmd>lua require('lsp_lines').toggle()<CR>")
		vim.keymap.set("n", "<F1>", "<cmd>lua vim.lsp.buf.hover()<CR>")
		vim.keymap.set("i", "<F1>", "<cmd>lua vim.lsp.buf.hover()<CR>")
	end,
}
