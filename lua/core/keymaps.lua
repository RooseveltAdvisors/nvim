vim.keymap.set('v', '>', '>gv', {desc = 'Indent Selection', remap = false})
vim.keymap.set('v', '<', '<gv', {desc = 'Unindent Selection', remap = false})
vim.keymap.set('n', '<M-Up>', ':m .-2<enter>', {desc = 'Move line up'})
vim.keymap.set('n', '<M-Down>', ':m .+1<enter>', {desc = 'Move line down'})
vim.keymap.set('i', '<M-Up>', '<C-o>:m .-2<enter>', {desc = 'Move line up'})
vim.keymap.set('i', '<M-Down>', '<C-o>:m .+1<enter>', {desc = 'Move line down'})
vim.keymap.set('i', '<C-d>', '<C-o>:d_<enter>', {desc = 'Delete Line'})
vim.keymap.set('n', '<C-d>', ':d_<enter>', {desc = 'Delete Line'})
vim.keymap.set('i', '<C-s>', '<C-o>:w<enter>', {desc = 'Save'})
vim.keymap.set('i', '<C-r>', function() vim.lsp.buf.rename() end, {desc = 'Rename'})
vim.keymap.set('n', '<C-r>', function() vim.lsp.buf.rename() end, {desc = 'Rename'})

-- File explorer (changed from F2 to Space+e)
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', {desc = 'Toggle Tree'})

-- Telescope
vim.keymap.set('n', '<C-f>', '<cmd>Telescope live_grep<cr>' , {desc = 'Find in files'})
vim.keymap.set('n', '<C-f><C-f>', '<cmd>Telescope find_files<cr>' , {desc = 'Find files'})
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>' , {desc = 'Escape Terminal'})

-- Code folding (fixed)
vim.keymap.set('n', '[z', 'zk', {desc = 'Previous Fold'})
vim.keymap.set('n', ']z', 'zj', {desc = 'Next Fold'})

-- Diagnostics
vim.keymap.set('n', 'ee', '<cmd>lua vim.diagnostic.open_float()<cr>', {desc = 'Show Error'})
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous Diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next Diagnostic' })

-- LSP Keybinds
vim.api.nvim_create_autocmd('LspAttach', {
	desc = 'LSP Actions',
	callback = function(event)
		local bufmap = function(mode, lhs, rhs)
			local opts = {buffer = event.buf}
			vim.keymap.set(mode, lhs, rhs, opts)
		end

		-- Code Completion
		bufmap('i', '<C-Space>', '<C-x><C-o>')

		-- Show Hover Docs (changed from F1 to K)
		bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
		
		-- Show References (fixed)
		bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
		
		-- Rename all references
		bufmap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>')

		-- Show Quick Actions (changed from F4 to leader+ca)
		bufmap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>')

		-- Go to definition
		bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
	end
})
