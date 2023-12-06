-- "gc" to comment visual regions/lines
return {
  {
    "terrortylor/nvim-comment",

    config = function()
      require('nvim_comment').setup()
      vim.keymap.set("n", "<leader>x", ":CommentToggle<CR>", {desc= "auskommentieren"})
    end

  },
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
      --
      lazy = false,

    }
  }
}
