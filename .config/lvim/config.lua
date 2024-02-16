
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
lvim.builtin.project.manual_mode = true



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
  {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
        close_if_last_window = true,
        window = {
          width = 30,
        },
        buffers = {
          follow_current_file = true,
        },
        filesystem = {
          follow_current_file = true,
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_by_name = {
              "node_modules"
            },
            never_show = {
              ".DS_Store",
              "thumbs.db"
            },
          },
        },
      })
    end
  },
}

lvim.keys.normal_mode["<C-Space>"] = ":NeoTreeFloat<CR>"
lvim.keys.normal_mode["<C-n>"] = ":NeoTreeFocus<CR>"














