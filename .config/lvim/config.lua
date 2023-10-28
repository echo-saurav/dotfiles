
vim.o.autoread = true
vim.o.relativenumber = true
vim.o.wrap = true
vim.o.linebreak = true
vim.o.showbreak = "›››"

vim.api.nvim_exec([[autocmd CursorHold * checktime]], false)


lvim.colorscheme = "gruvbox-material"
vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_enable_italic = 1
vim.g.airline_theme= 'gruvbox_material'

lvim.builtin.bufferline.active = false


lvim.plugins = {
  {"sainnhe/gruvbox-material"},
  {"ggandor/lightspeed.nvim",  event = "BufRead",},
  {"farmergreg/vim-lastplace"},
  {
    "nacro90/numb.nvim",
    event = "BufRead",
    config = function()
      require("numb").setup {
        show_numbers = true, -- Enable 'number' for the window while peeking
        show_cursorline = true, -- Enable 'cursorline' for the window while peeking
      }
    end,
  },
}














