return {
  'rcarriga/nvim-dap-python',
  ft = 'python',
  build = ':TSInstall python',
  dependencies = {
    'mfussenegger/nvim-dap',
  },
  config = function()
    local path = '~/.local/share/nvim/mason/packages/debugpy/venv/bin/python3'
    local global_path = '/usr/bin/python3'
    require('dap-python').setup(global_path)
  end,
}
