return {	
	{
		'nvim-lua/plenary.nvim',
	},
	{
		'andythigpen/nvim-coverage',
		config = function()
			require('coverage').setup({
				auto_reload = true,				
			})
		end,
	}
}
