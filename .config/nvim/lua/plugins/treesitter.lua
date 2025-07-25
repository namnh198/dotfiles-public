return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "astro",
        "cpp",
        "css",
        "gitignore",
        "go",
        "graphql",
        "php",
        "scss",
        "sql",
        "svelte",
        "vue",
      },
    },
    query_linter = {
      enable = true,
      use_virtual_text = true,
      lint_events = { "BufWrite", "CursorHold" },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
      -- MDX
      vim.filetype.add({
        extension = {
          mdx = "markdown",
        },
      })
      vim.treesitter.language.register("markdown", "mdx")
    end,
  },
}
