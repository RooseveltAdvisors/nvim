vim.keymap.set('v', '>', '>gv', {desc = 'Indent Selection', remap = false})
vim.keymap.set('v', '<', '<gv', {desc = 'Unindent Selection', remap = false})
vim.keymap.set('i', '<C-t>', '<C-o>:t.<enter>', {desc = 'Duplicate Line'})
vim.keymap.set('n', '<C-t>', ':t.<enter>', {desc = 'Duplicate Line'})
vim.keymap.set('n', '<M-Up>', ':m .-2<enter>', {desc = 'Move line up'})
vim.keymap.set('n', '<M-Down>', ':m .+1<enter>', {desc = 'Move line down'})
vim.keymap.set('i', '<M-Up>', '<C-o>:m .-2<enter>', {desc = 'Move line up'})
vim.keymap.set('i', '<M-Down>', '<C-o>:m .+1<enter>', {desc = 'Move line down'})
vim.keymap.set('i', '<C-d>', '<C-o>:d_<enter>', {desc = 'Delete Line'})
vim.keymap.set('n', '<C-d>', ':d_<enter>', {desc = 'Delete Line'})
vim.keymap.set('i', '<C-s>', '<C-o>:w<enter>', {desc = 'Save'})
vim.keymap.set('i', '<C-r>', function() vim.lsp.buf.rename() end, {desc = 'Rename'})
vim.keymap.set('n', '<C-r>', function() vim.lsp.buf.rename() end, {desc = 'Rename'})
vim.keymap.set('n', '<C-`>', ':belowright split | resize 10 | term <enter><Home>i', {desc = 'Open Terminal'})
vim.keymap.set('i', '<C-`>', '<C-o>:belowright split | resize 10 | term <enter>', {desc = 'Open Terminal'})
vim.keymap.set('i', '<C-e>', '<C-o>:NvimTreeToggle <enter>', {desc = 'Toggle Tree'})
vim.keymap.set('n', '<C-e>', ':NvimTreeToggle <enter>', {desc = 'Toggle Tree'})




