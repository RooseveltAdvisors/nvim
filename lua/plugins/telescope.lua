return {
	'nvim-telescope/telescope.nvim', tag = '0.1.5',
	dependencies = { 'nvim-lua/plenary.nvim' },
	module = 'telescope',
	config = function()
		local tBuiltin = require('telescope.builtin')
		vim.keymap.set('n', '<C-f>', tBuiltin.find_files , {desc = 'Toggle Tree'})
	end
}
