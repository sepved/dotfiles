return {
  { 'williamboman/mason.nvim', config = true },
  { 'neovim/nvim-lspconfig' },
  { 
    'ray-x/lsp_signature.nvim', -- default was: config = true },
    config = function()
      require("lsp_signature").setup({
	bind = true,
	handler_opts = { border = "single" }, -- aesthetic only
	floating_window = false, -- starts shut down
      })
      vim.keymap.set('i', '<C-s>', function() requiere('lsp_signature').toggle_float_win() end, { desc = 'Toggle Signature' })
    end 
  },
  { 'onsails/lspkind-nvim' },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end
      },
      "saadparwaiz1/cmp_luasnip"
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")

      luasnip.config.setup({
        ext_opts = {
          [require("luasnip.util.types").choiceNode] = {
            active = { virt_text = { { "⇥", "DiagnosticWarn" } } }
          },
          [require("luasnip.util.types").insertNode] = {
            active = { virt_text = { { "⇥", "DiagnosticInfo" } } }
          }
        }
      })

      cmp.setup({
        snippet = {
          expand = function(args) luasnip.lsp_expand(args.body) end
        },
        window = {
          completion = cmp.config.window.bordered({ border = "single" }),
          documentation = cmp.config.window.bordered({ border = "single" })
	  -- added { border = 'square' } as an argument. default is no arguments.
        },
	completion = {
	  autocomplete = false, -- auto autocomplete
	},
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(), -- open autocomplete
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.locally_jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, { "i", "s" })
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" }
        }),
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 70,
            show_labelDetails = true
          })
        }
      })

        vim.keymap.set('n', '<leader>rz', function()
            local word = vim.fn.expand("<cword>")
            vim.fn.jobstart({ 
          "env", 
          "QT_OPENGL=software", 
          "QTWEBENGINE_CHROMIUM_FLAGS=--disable-gpu", 
          "zeal", 
          "--query", 
          word 
        })
      end, { desc = "Zeal Lookup" })


      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', function() vim.lsp.buf.hover({ border = "single" }) end, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
	  vim.keymap.set('n', 'gK', function() vim.cmd('normal! ' .. vim.v.count1 .. 'K') end, opts) -- requiered: man-db man-pages
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
	  vim.keymap.set({ 'n', 'v' }, '<leader>rc', vim.lsp.buf.code_action, opts)
	  vim.keymap.set('n', '<leader>rd', function() vim.diagnostic.open_float({ border = "single" }) end, opts)
          vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
	  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
	  vim.keymap.set('n', '<leader>rf', function() vim.lsp.buf.format { async = true } end, opts)
	  vim.keymap.set('n', '<leader>rh', function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = ev.buf }), { bufnr = ev.buf })
          end, opts)



	local client = vim.lsp.get_client_by_id(ev.data.client_id)
          if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
            vim.lsp.inlay_hint.enable(false, { bufnr = ev.buf })
          end

	end,

      })



      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      vim.lsp.config('rust_analyzer', { capabilities = capabilities })
      vim.lsp.enable('rust_analyzer')

      vim.lsp.config('clangd', {
        capabilities = capabilities,
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=never", 
          "--completion-style=detailed",
          "--fallback-style=llvm"
        }
      })
      vim.lsp.enable('clangd')

      vim.lsp.config('slangd', { capabilities = capabilities })
      vim.lsp.enable('slangd')

      vim.lsp.config('lua_ls', { capabilities = capabilities })
      vim.lsp.enable('lua_ls')
      vim.lsp.config('zls', { capabilities = capabilities })
      vim.lsp.enable('zls')

      end
  }
}


