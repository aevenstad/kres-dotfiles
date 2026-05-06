vim.keymap.set('n', '<leader>w', '<cmd>write<CR>', { desc = '[W]rite buffer' })
vim.keymap.set('n', '<leader>x', '<cmd>bdelete<CR>', { desc = 'Close buffer' })
vim.keymap.set('n', '<leader>tt', '<cmd>set invlist<CR>', { desc = '[T]oggle invisible [T]ext' })
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { desc = '[Y]ank to system clipboard' })
vim.keymap.set('n', '<leader>Y', '"+Y', { desc = '[Y]ank line to system clipboard' })
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p', { desc = '[P]aste after from system clipboard' })
vim.keymap.set({ 'n', 'v' }, '<leader>P', '"+P', { desc = '[P]aste before from system clipboard' })

vim.keymap.set({ 'n', 'v' }, 'H', '^', { desc = 'Jump to first non-blank character' })
vim.keymap.set({ 'n', 'v' }, 'L', '$', { desc = 'Jump to end of line' })

vim.keymap.set('n', '<leader>sc', function()
  local clipboard = vim.o.clipboard == '' and 'unnamedplus' or ''
  vim.o.clipboard = clipboard
  vim.notify('Clipboard sync: ' .. (clipboard == '' and 'off' or 'on'))
end, { desc = '[S]ync [C]lipboard toggle' })
