vim.keymap.set({ 'n', 'i', 'v' }, '<MiddleMouse>', '<Nop>') -- turn off mouse middle button pasting randomly
vim.opt.clipboard = "unnamedplus"

vim.keymap.set({ "n", "v" }, "<ScrollWheelDown>", "<C-e>", {
  silent = true,
})

vim.keymap.set({ "n", "v" }, "<ScrollWheelUp>", "<C-y>", {
  silent = true,
})


vim.cmd("colorscheme my_theme_1")
vim.opt.cmdheight = 0

return {
  { 'nvim-tree/nvim-web-devicons' },

  -- {
  --   'nvim-lualine/lualine.nvim',
  --   dependencies = { 'nvim-tree/nvim-web-devicons' },
  --   config = function()
  --     require("lualine").setup({
  --       options = {
  --         theme = 'auto',
  --         icons_enabled = true,
  --         component_separators = { left = '|', right = '|' },
  --         section_separators = { left = '', right = '' },
  --       },
  --       sections = {
  --         lualine_a = { 'mode' },
  --         lualine_b = { 'branch', 'diff', 'diagnostics' },
  --         lualine_c = { 'filename' },
  --         lualine_x = { 'enconding', 'fileformat', 'filetype' },
  --         lualine_y = { 'progress' },
  --         lualine_z = { 'location'}
  --       }
  --     })
  --   end
  -- },
  { 'echasnovski/mini.statusline', version = '*', config = true },
  {
    'numToStr/Comment.nvim',
    opts = {},
  },




  {
    "backdround/tabscope.nvim",
    config = function()
      require("tabscope").setup({})
    end,
  },
  { "tiagovla/scope.nvim", config = true },

  -- TABLINE
  --{'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
  {
    'nvim-mini/mini.tabline',
    version = '', 
    config = function()
      require('mini.tabline').setup({      })
    end,
  },
  --[[
  {
    'romgrk/barbar.nvim',
    config = function()
      require("barbar").setup({
        clickable = true,
        tabpages = false,
        insert_at_end = true,
        icons = {
          preset = "default",
          button = "",
          buffer_index = true,
          filetype = { enabled = true },
          separator = { left = "",right = ""}, -- │
          inactive = { separator = { left = "", right = "     │" }, -- │
          separator_at_end = false}}
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
      map("n", "<A-C>", "<Cmd>BufferClose!<CR>", opts)
      map("n", "<A-b>", "<Cmd>BufferCloseAllButCurrent<CR>", opts)
    end
  },
]]--

  { 'numToStr/Comment.nvim',  config = true },
  { 'kylechui/nvim-surround', version = "*", config = true },

  {
    "uga-rosa/ccc.nvim",
    config = function()
      local ccc = require("ccc")
      local live_reload = false
      local theme_name
      local source_buf

      local core = ccc.setup({
        highlighter = {
          auto_enable = true,
          lsp = true,
        },
        inputs = {
          ccc.input.hsl,
        },
        outputs = {
          ccc.output.hex,
        },
        alpha_show = "hide"
      })

      -- subscribe to change color
      vim.api.nvim_create_autocmd("User", {
        pattern = "CccColorChanged",
        callback = function()
          if not live_reload then
            return
          end
          local color = vim.g.ccc_color
          local range = core.range
          if not color or color == "" or not range then
            return
          end
          vim.api.nvim_buf_set_text(
            source_buf,
            range[1],
            range[2],
            range[3],
            range[4],
            { color }
          )
          core.range[4] = range[2] + #color
          vim.api.nvim_buf_call(source_buf, function()
            vim.cmd("silent update")
          end)

          if theme_name then
            vim.schedule(function()
              vim.g.ccc_live_reload = true
              pcall(vim.cmd.colorscheme, theme_name)
              vim.g.ccc_live_reload = nil
            end)
          end
        end,
      })

      vim.keymap.set("n", "<leader>cp", "<cmd>CccPick<CR>", { desc = "Color Picker" })
      vim.keymap.set("n", "<leader>cP", function()
        source_buf = vim.api.nvim_get_current_buf()
        local filename = vim.api.nvim_buf_get_name(source_buf)
        theme_name = vim.fn.fnamemodify(filename, ":t:r")
        live_reload = false
        vim.cmd("CccPick")
        live_reload = true
      end, { desc = "Color Picker Live Reload" })
    end
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
}
