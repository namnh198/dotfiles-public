return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "cpp",
        "css",
        "graphql",
        "vue",
      },
    },
    --   query_linter = {
    --     enable = true,
    --     use_virtual_text = true,
    --     lint_events = { "BufWrite", "CursorHold" },
    --   },
    --   config = function(_, opts)
    --     require("nvim-treesitter.configs").setup(opts)
    --     -- MDX
    --     vim.filetype.add({
    --       extension = {
    --         mdx = "markdown",
    --       },
    --     })
    --     vim.treesitter.language.register("markdown", "mdx")
    --   end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        html = {},
        cssls = {
          settings = {
            css = {
              validate = true,
              lint = {
                unknownAtRules = "ignore",
              },
            },
            scss = {
              validate = true,
              lint = {
                unknownAtRules = "ignore",
              },
            },
            less = {
              validate = true,
              lint = {
                unknownAtRules = "ignore",
              },
            },
          },
        },
      },
    },
  },

  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "html-lsp",
        "css-lsp",
      },
    },
  },
}
