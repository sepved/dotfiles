return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter-textobjects" },
      { 
        "nvim-treesitter/nvim-treesitter-context", 
        opts = { enable = true, mode = "topline" } 
      }
    },
    config = function()


      local function set_tab(size)
        vim.opt_local.tabstop = size
        vim.opt_local.shiftwidth = size
        vim.opt_local.softtabstop = size
        vim.opt_local.expandtab = true
      end

      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "markdown" },
        callback = function()
          pcall(function() require("treesitter-context").disable() end)
 	  set_tab(2)
        end
      })

      vim.api.nvim_create_autocmd("FileType", {
	pattern = { "cs", "c", "cpp", "rust", "zig", "cuda", "slang", "python" },
	callback = function()
	  set_tab(4)
	end,
      })

      vim.api.nvim_create_autocmd("FileType", {
	pattern = { "lua" },
	callback = function()
	  set_tab(2)
	end,
      })

    end
  }
}

