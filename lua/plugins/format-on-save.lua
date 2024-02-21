return { 
	"elentok/format-on-save.nvim",
	config = function()
		local format_on_save = require("format-on-save")
		local formatters = require("format-on-save.formatters")

		format_on_save.setup({
			exlude_path_patterns = {
				"/.git/",
				"/node_modules/"
			},
			formatter_by_ft = {
				css = formatters.lsp,
				html = formatters.lsp,
			
				go = {
					formatters.shell({
						cmd = { "goimports" },
					}),
					formatters.shell({
						cmd = { "gofmt"},
					}),
				},
			},
		})
	end
}
