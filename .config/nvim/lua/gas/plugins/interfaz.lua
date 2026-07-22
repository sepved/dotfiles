vim.keymap.set({ 'n', 'i', 'v' }, '<MiddleMouse>', '<Nop>') -- turn off mouse middle button pasting randomly


vim.cmd("colorscheme my_theme_1")

return {
  { 'nvim-tree/nvim-web-devicons' },

  { 
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
     -- require("lualine").setup({ options = { theme = "catppuccin" } })
    require("lualine").setup()
    end
  },

  --[[
  { 
    'catppuccin/nvim', 
    name = "catppuccin", 
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        term_colors = true,
        styles = { functions = {"italic"}, types = {"bold"} },
        color_overrides = {
          mocha = {
            base = "#171717",
            surface2 = "#9A9A9A",
            text = "#F6F6F6"
          }
        },
        integrations = {
          barbar = true, telescope = true, treesitter = true, nvim_lsp = true, cmp = true
        }
      })
      vim.cmd.colorscheme "catppuccin"
    end
  },

  {
	  "oskarnurm/koda.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    -- require("koda").setup({ transparent = true })
    -- start	of copypaste default configuration
    require("koda").setup({
    transparent = false, -- enable for transparent backgrounds

    -- Set the variants to use when auto-switching based on vim.o.background
    -- Valid values: 'dark', 'light', 'moss', 'glade'
    theme = {
      dark = "moss",
      light = "light",
    },

    -- Automatically enable highlights only for plugins installed by your plugin manager
    -- Currently only supports `lazy.nvim`, `mini.deps` and `vim.pack`
    auto = true,  -- disable to load ALL available plugin highlights

    cache = true, -- caches the theme for better performance

    -- Style to be applied to different syntax groups
    -- Common use case would be to set either `italic = true` or `bold = true` for a desired group
    -- See `:help nvim_set_hl` for more valid values
    styles = {
       functions = { bold = true },
       keywords  = {},
       comments  = {},
       strings   = {},
       constants = {}, -- includes numbers, booleans
    },

    -- Override colors for the active variant
    -- Available keys (e.g., 'func') can be found in lua/koda/palette/
    colors = {
      -- func = "#4078F2",
      -- keyword = "#A627A4",
    },

    -- You can modify or extend highlight groups using the `on_highlights` configuration option
    -- Any changes made take effect when highlights are applied
    on_highlights = function(hl, c)
      -- hl.LineNr = { fg = c.info } -- change a specific highlight to use a different palette color
      -- hl.Comment = { fg = c.emphasis, italic = true } -- modify a syntax group (add bold, italic, etc)
      -- hl.RainbowDelimiterRed = { fg = "#fb2b2b" } -- add a custom highlight group for another plugin
    end,
})
    -- end	of copypaste default configuration
    vim.cmd("colorscheme koda") 
  end,
  }, 

  ]]


  {
    'romgrk/barbar.nvim',
    config = function()
      require("barbar").setup({
	options = { theme = "auto" },
        clickable = true,
        tabpages = false,
        insert_at_end = true,
        icons = {
          button = "",
          buffer_index = true,
          filetype = { enabled = true },
        }
      })

      local map = vim.keymap.set
      local opts = { silent = true }

      map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
      map("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)
      map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
      map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
      
      map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
      map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
      map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
      map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
      map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
      map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
      map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
      map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
      map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
      map("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)
      
      map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
      map("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
      map("n", "<A-b>", "<Cmd>BufferCloseAllButCurrent<CR>", opts)
    end
  },

  { 'numToStr/Comment.nvim', config = true },
  { 'kylechui/nvim-surround', version = "*", config = true },

  {
    "uga-rosa/ccc.nvim",
    config = function()
      local ccc = require("ccc")
      ccc.setup({
        highlighter = {
          auto_enable = true,
          lsp = true,
        },
        inputs = {
          ccc.input.hsl,
        },
        outputs = {
          ccc.output.hex,
        },        alpha_show = "hide",
      })
      vim.keymap.set("n", "<leader>cp", "<cmd>CccPick<CR>", { desc = "Color Picker" })
    end
  }
}

