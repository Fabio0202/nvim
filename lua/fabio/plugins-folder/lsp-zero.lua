return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
    init = function()
      -- Disable automatic setup, we are doing it manually
    end,
  },
  {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
    },
    config = function()
      local lsp = require("lsp-zero")
      lsp.extend_lspconfig()
      lsp.set_sign_icons({ error = ' ', warn = ' ', hint = '', info = '' })

      lsp.on_attach(function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set("n", "<leader>?", function() vim.lsp.buf.hover() end, opts)
        -- vim.keymap.set("n", "<leader>e", function() vim.diagnostic.goto_next() end, { desc = 'next error message' })
        -- vim.keymap.set("n", "<leader>E", function() vim.diagnostic.goto_prev() end, { desc = 'previous error message' })

        -- vim.keymap.set("n", "<leader>r", function() require('telescope.builtin').lsp_references() end, {desc = 'zeigt alle referenzen'})
        -- vim.keymap.set("n", "<leader>", function() vim.lsp.buf.definition() end, opts)

        lsp.format_on_save({
          servers = {
            ['lua_ls'] = { 'lua' },
            ['texlab'] = { 'tex', 'latex' },
          }
        })
        require('mason').setup({
          ensure_installed = { 'debugpy' },
        })
        require("mason-lspconfig").setup({
          ensure_installed = { 'lua_ls', 'texlab', 'pylsp', },
          handlers = {
            lsp.default_setup
          }
        })

        
      end)
    end,
  },

}
