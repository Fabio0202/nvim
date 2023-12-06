 return {   vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", {desc = 'write (save file)'}),
 vim.keymap.set("n", "<leader>q", "<cmd>wq<cr>", {desc = 'quit window'}),
 
vim.keymap.set('n', '<leader>sw', ':set wrap!<CR>', {desc = 'set wrap'})
}
