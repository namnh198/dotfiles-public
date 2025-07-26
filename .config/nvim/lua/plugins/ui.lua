return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.debug = vim.uv.cwd():find("noice%.nvim")
      opts.debug = false
      opts.routes = opts.routes or {}
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      local focused = true
      vim.api.nvim_create_autocmd("FocusGained", {
        callback = function()
          focused = true
        end,
      })
      vim.api.nvim_create_autocmd("FocusLost", {
        callback = function()
          focused = false
        end,
      })

      table.insert(opts.routes, 1, {
        filter = {
          ["not"] = {
            event = "lsp",
            kind = "progress",
          },
          cond = function()
            return not focused and false
          end,
        },
        view = "notify_send",
        opts = { stop = false, replace = true },
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function(event)
          vim.schedule(function()
            require("noice.text.markdown").keys(event.buf)
          end)
        end,
      })
      return opts
    end,
  },

  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
      { "<S-Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    },
    opts = {
      options = {
        -- separator_style = "slope",
        -- always_show_bufferline = false,
      },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options.section_separators = { left = "", right = "" }
      opts.options.component_separators = { left = "", right = "" }
      opts.sections.lualine_a = {
        {
          "mode",
          fmt = function(str)
            return " " .. str
          end,
        },
      }
    end,
  },

  {
    "echasnovski/mini.icons",
    opts = {
      extension = {
        ["astro"] = { glyph = "", hl = "MiniIconsRed" },
      },
    },
  },

  {
    "snacks.nvim",
    ---@diagnostic disable-next-line: unused-local
    opts = function(_, opts)
      local snacks = require("snacks")
      if pcall(require, "copilot") then
        snacks
          .toggle({
            name = "Toggle (Copilot Completion)",
            color = {
              enabled = "azure",
              disabled = "orange",
            },
            get = function()
              return not require("copilot.client").is_disabled()
            end,
            set = function(state)
              if state then
                require("copilot.command").enable()
              else
                require("copilot.command").disable()
              end
            end,
          })
          :map("<leader>ta")
      end
    end,
  },

  {
    "snacks.nvim",
    opts = {
      image = {
        force = false,
        enabled = true,
        debug = { request = false, convert = false, placement = false },
        math = { enabled = true },
        doc = { inline = true, float = true },
      },
      picker = {
        enabled = true,
        exclude = {
          "vendor",
          "node_modules",
          ".git",
          "bun.lock",
          "yarn.lock",
          "package-lock.json",
          ".vscode",
          ".cursor",
          ".idea",
          ".DS_Store",
        },
        sources = {
          explorer = {
            hidden = true,
            ignored = true,
          },
        },
      },
    },
  },
}
