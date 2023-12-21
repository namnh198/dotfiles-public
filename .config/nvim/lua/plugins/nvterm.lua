return {
  "Nvchad/nvterm",
  init = function()
    -- keymaps
    local terminal = require("nvterm.terminal")
    local toggle_modes = { "n", "t" }
    local opts = { noremap = true, silent = true }
    local keymaps = {
      {
        toggle_modes,
        "<A-i>",
        function()
          terminal.toggle("float")
        end,
        { desc = "Toggle Float Terminal" },
      },
      {
        toggle_modes,
        "<A-h>",
        function()
          terminal.toggle("horizontal")
        end,
        { desc = "Toggle Horizontal Terminal" },
      },
      {
        toggle_modes,
        "<A-v>",
        function()
          terminal.toggle("vertical")
        end,
        { desc = "Toggle Vertical Terminal" },
      },
    }

    for _, mapping in ipairs(keymaps) do
      vim.keymap.set(mapping[1], mapping[2], mapping[3], opts)
    end
  end,
  opts = {
    terminals = {
      shell = vim.o.shell,
      list = {},
      type_opts = {
        float = {
          relative = "editor",
          row = 0.3,
          col = 0.25,
          width = 0.5,
          height = 0.4,
          border = "single",
        },
        horizontal = { location = "rightbelow", split_ratio = 0.3 },
        vertical = { location = "rightbelow", split_ratio = 0.5 },
      },
    },
    behavior = {
      autoclose_on_quit = {
        enabled = false,
        confirm = true,
      },
      close_on_exit = true,
      auto_insert = false,
    },
  },
  config = function(_, opts)
    require("nvterm").setup(opts)
  end,
}
