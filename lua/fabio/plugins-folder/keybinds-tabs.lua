-- hiermit kannst du Shift-h und Shift-l druecken um zu dem naechsten/vorherigen tab zu wechseln
vim.api.nvim_set_keymap('n', '<S-h>', '<cmd>bprevious<CR>', { noremap = true, silent = true, desc = 'Previous Buffer' })
vim.api.nvim_set_keymap('n', '<S-l>', '<cmd>bnext<CR>', { noremap = true, silent = true, desc = 'Next Buffer' })

vim.api.nvim_set_keymap('n', '<leader>c', '<cmd>w | bdelete<cr>', { desc = 'Save and delete buffer' })
-- 
---
---
return {'akinsho/bufferline.nvim', 
version = "*", 
dependencies = 'nvim-tree/nvim-web-devicons',
config = function()
  require("bufferline").setup{}
end,
}


