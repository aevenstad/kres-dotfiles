local portable = vim.api.nvim_create_augroup('custom-portable', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
  group = portable,
  pattern = { 'gitcommit', 'markdown', 'text' },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.wrap = true
  end,
})

vim.api.nvim_create_autocmd('TermOpen', {
  group = portable,
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})
