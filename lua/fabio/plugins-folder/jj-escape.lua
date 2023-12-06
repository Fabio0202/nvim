
-- hiermit kannst du auch jj statt esc druecken,
-- ist bequemer
  return {
    'max397574/better-escape.nvim',
    config = function()
      require('better_escape').setup {
        mapping = { 'jk', 'jj' },
        timeout = 200,          
      }
    end,
  }
