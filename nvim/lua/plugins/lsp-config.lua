--Everything Related to LSP
--https://github.com/williamboman/mason.nvim
--https://github.com/williamboman/mason-lspconfig.nvim
--https://github.com/neovim/nvim-lspconfig
-- clangd covers c/c++, marksman is markdown
-- autocomplete:
-- https://github.com/hrsh7th/nvim-cmp
-- luasnip snippet engine:
-- https://github.com/L3MON4D3/LuaSnip
-- auto braces:
-- https://github.com/windwp/nvim-autopairs
return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "clangd", "pyright", "bashls", "cmake", "marksman" }
      })
    end
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      --these two are for luasnip
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      --auto bracket complete
      --      "windwp/nvim-autopairs",
    },
    config = function()
      local cmp = require("cmp")
      local autopairs = require('nvim-autopairs');
      vim.opt.completeopt = { "menu", "menuone", "noselect" }
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<Tab>'] = cmp.mapping.confirm({ select = true }),
          ['<Up>'] = cmp.mapping.select_prev_item(),
          ['<Down>'] = cmp.mapping.select_next_item(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
        }),
        sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "nvim_lua" },
            { name = "luasnip" }, -- For luasnip users.
          },
          {
            { name = "buffer" },
            { name = "path" },
          }),
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = "path" },
          },
          {
            { name = "cmdline" },
          }),
      })
      -- auto pair brackets/braces etc...
      --      autopairs.setup()
      --      require("nvim-autopairs.completion.cmp").setup({
      --        map_cr = true,       -- maps <CR> on insert mode
      --        map_complete = true, -- it will auto insert `(` after select function or method item
      --        auto_select = true,  -- automatically select the first item
      --      })
    end
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local on_attach = function(client, bufnr)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
      end

      lspconfig.lua_ls.setup({ on_attach = on_attach })
      lspconfig.clangd.setup({ on_attach = on_attach })
      lspconfig.pyright.setup({ on_attach = on_attach })
      lspconfig.bashls.setup({ on_attach = on_attach })
      lspconfig.cmake.setup({ on_attach = on_attach })
      lspconfig.marksman.setup({ on_attach = on_attach })
    end
  },
}
