-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true,
        number = true,
        spell = false,
        signcolumn = "auto",
        wrap = false,
        shiftwidth = 4,
        tabstop = 4,
        expandtab = true,
      },
      g = { -- vim.g.<key>
        mapleader = " ", -- sets vim.g.mapleader
        autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
        cmp_enabled = true, -- enable completion at start
        autopairs_enabled = true, -- enable autopairs at start
        diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
        icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
        ui_notifications_enabled = true, -- disable notifications when toggling UI elements
      },
    },

    mappings = {
      n = {
        ["L"] = { "<cmd>b]<cr>", desc = "Next buffer" },
        ["H"] = { "<cmd>b[<cr>", desc = "Previous buffer" },
        ["f"] = { "/", desc = "Search" },
        ["]p"] = { "o<esc>p", desc = "Paste below" },
        ["[p"] = { "O<esc>p", desc = "Paste Above" },
        -- mappings seen under group name "Buffer"
        ["]r"] = { "<cmd>RustRun<cr>", desc = "Rust run" },
        ["<Leader>ga"] = { "<cmd>GhActions<cr>", desc = "Github Action" },
        -- mappings seen under group name "Buffer"
        ["<Leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        ["<Leader>b"] = { desc = "Buffers" },

        -- toggle absolute line numbers
        ["<leader>un"] = {
          function()
            vim.opt.number = not vim.opt.number:get()
          end,
          desc = "Toggle line numbers",
        },

        -- toggle relative line numbers
        ["<leader>ur"] = {
          function()
            vim.opt.relativenumber = not vim.opt.relativenumber:get()
          end,
          desc = "Toggle relative numbers",
        },
      },
      t = {},
    },
  },
}
