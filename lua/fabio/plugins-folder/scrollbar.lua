-- dieses plugin fuegt einfach nur eine scrollbar ein
return {
  'dstein64/nvim-scrollview',
  event = 'BufRead',
  config = function()
    require('scrollview').setup {}
  end,
}
