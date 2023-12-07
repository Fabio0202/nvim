return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
    init = function()
      -- Disable automatic setup, we are doing it manually
      -- vim.g.lsp_zero_extend_cmp = 0
      -- vim.g.lsp_zero_extend_lspconfig = 0
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

        -- vim.keymap.set("n", "k", function() vim.lsp.buf.hover() end, opts) -- this one works pretty good
        -- vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end,
        -- 	{ desc = 'format file' })                                    -- this one works pretty good
        -- vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end,
        -- 	{ desc = 'next error message' })
        -- vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end,
        -- 	{ desc = 'previous error message' })
        --
        -- vim.keymap.set("n", "<leader>fr",
        -- 	function() require('telescope.builtin').lsp_references() end, opts)
        -- vim.keymap.set("n", "<leader>lwl", ":lspzeroworkspacelist<cr>", opts)
        -- vim.keymap.set("n", "<leader>lwr", ":lspzeroworkspaceremove<cr>", opts)
        -- vim.keymap.set("n", "<leader>lwa", ":lspzeroworkspaceadd<cr>", opts)
        -- vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)


        local function goto_definition_split()
          -- split the window horizontally and then jump to the definition
          vim.cmd('vsplit')
          vim.lsp.buf.definition()
        end
        vim.keymap.set('n', 'gs', goto_definition_split, { silent = true })
        vim.keymap.set('n', '<leader>gs', goto_definition_split, { silent = true })
      end)

      local diagnostics_visible = true
      function ToggleDiagnostics()
        diagnostics_visible = not diagnostics_visible
        vim.diagnostic.config({
          virtual_text = diagnostics_visible,
        })
      end

      -- vim.keymap.set("n", "<leader>td", "lua ToggleDiagnostics()<CR>")
      lsp.format_on_save({
        servers = {
          ['lua_ls'] = { 'lua' },
          ['pylsp'] = { 'python' },
          -- ['typescript-tools'] = { 'typescriptreact' }
        }
      })
      require('mason').setup({
        -- ensure_installed = { 'debugpy' },
      })
      --TODO: I wasnt able to add debugpy to the ensure installed list
      require("mason-lspconfig").setup({
        ensure_installed = { 'lua_ls', 'texlab', 'pylsp', }, --  'pylyzer' 'eslint' 'emmet_ls'  'tsserver'
        handlers = {
          lsp.default_setup
        }

      })

      require('lspconfig').pylsp.setup({
        settings = {

          pylsp = {
            -- root_dir = function()
            -- 	root_pattern('pyproject.toml', 'requirements.txt', '.git')
            -- end,
            plugins = {

              -- formatter options
              black = { enabled = true },
              -- autopep8 = { enabled = false },
              -- yapf = { enabled = false },
              -- -- linter options
              -- -- pylint = { enabled = true, executable = "pylint" },
              pyflakes = { enabled = false },
              pycodestyle = {
                enabled = true,
                ignore = { "E501" }, -- Option 1: Ignore E501
                maxLineLength = 120 -- Option 2: Set a longer maximum line length
              },
              -- -- type checker
              pylsp_mypy = { enabled = true },
              -- -- auto-completion options
              jedi_completion = { fuzzy = true },
              -- -- import sorting
              pyls_isort = { enabled = true },
            }
          },
        }
      })


      require('lspconfig').tailwindcss.setup({
        -- root_dir = {}
      })
      require('lspconfig').texlab.setup({

        -- filetypes = {}

      })

      -- require('lspconfig').emmet_ls.setup({
      --
      -- })
    end,
  }
}
