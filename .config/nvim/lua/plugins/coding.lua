local NVIM_DIR_CONF = vim.env.HOME .. "/.config/nvim"

return {
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },

  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters = {
        ["markdownlint-cli2"] = {
          args = { "--config", NVIM_DIR_CONF .. "/.markdownlint-cli2.yaml", "--" },
        },
      },
    },
  },
}
