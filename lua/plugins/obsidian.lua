return {
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    event = {
      "BufReadPre " .. vim.fn.expand "~" .. "/hex/workspaces/knowledge-vault/**.md",
      "BufNewFile " .. vim.fn.expand "~" .. "/hex/workspaces/knowledge-vault/**.md",
    },
    cmd = {
      "ObsidianOpen",
      "ObsidianNew",
      "ObsidianQuickSwitch",
      "ObsidianFollowLink",
      "ObsidianBacklinks",
      "ObsidianTags",
      "ObsidianToday",
      "ObsidianYesterday",
      "ObsidianTomorrow",
      "ObsidianDailies",
      "ObsidianTemplate",
      "ObsidianNewFromTemplate",
      "ObsidianSearch",
      "ObsidianLink",
      "ObsidianLinkNew",
      "ObsidianLinks",
      "ObsidianExtractNote",
      "ObsidianPasteImg",
      "ObsidianRename",
      "ObsidianToggleCheckbox",
      "ObsidianTOC",
      "ObsidianWorkspace",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      completion = {
        nvim_cmp = false,  -- disable!
      },
      workspaces = {
        {
          name = "knowledge-vault",
          path = "/home/master/hex/workspaces/knowledge-vault",
        },
      },
      daily_notes = {
        folder = "06 - Daily",
        date_format = "%Y%m%d",
        template = "ObsidianNvimDaily.md",
      },
      templates = {
        folder = "99 - Meta/00 - Templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
        substitutions = {
          day_of_week = function() return os.date "%A" end,
          day_of_week_lower = function() return string.lower(os.date "%A") end,
          long_date = function() return os.date "%B %d, %Y" end,
        },
      },
      attachments = {
        img_folder = "99 - Meta/attachments",
      },
      ui = {
        checkboxes = {
          [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
          ["x"] = { char = "", hl_group = "ObsidianDone" },
        },
      },
      disable_frontmatter = true,
      mappings = {
        -- Overrides the 'gf' mapping to work with markdown links
        ["gf"] = {
          action = function() return require("obsidian").util.gf_passthrough() end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        -- Toggle check-boxes
        ["<leader>ch"] = {
          action = function() return require("obsidian").util.toggle_checkbox() end,
          opts = { buffer = true },
        },
        -- Smart action depending on context, either follow link or toggle checkbox.
        ["<cr>"] = {
          action = function() return require("obsidian").util.smart_action() end,
          opts = { buffer = true, expr = true },
        },
      },
      config = function(_, opts)
        require("obsidian").setup(opts)

        -- HACK: fix error, disable completion.nvim_cmp option, manually register sources
        local cmp = require("cmp")
        cmp.register_source("obsidian", require("cmp_obsidian").new())
        cmp.register_source("obsidian_new", require("cmp_obsidian_new").new())
        cmp.register_source("obsidian_tags", require("cmp_obsidian_tags").new())
      end,
    },
  },
  {
    "saghen/blink.cmp",
    dependencies = { "saghen/blink.compat" },
    opts = {
      sources = {
        default = { "obsidian", "obsidian_new", "obsidian_tags" },
        providers = {
          obsidian = {
            name = "obsidian",
            module = "blink.compat.source",
          },
          obsidian_new = {
            name = "obsidian_new",
            module = "blink.compat.source",
          },
          obsidian_tags = {
            name = "obsidian_tags",
            module = "blink.compat.source",
          },
        },
      },
    },
  },
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          -- Obsidian prefix
          ["<Leader>o"] = { desc = "󰠮 Obsidian" },

          -- Note creation & opening
          ["<Leader>on"] = { "<cmd>ObsidianNew<cr>", desc = "New Note" },
          ["<Leader>oN"] = { "<cmd>ObsidianNewFromTemplate<cr>", desc = "New from Template" },
          ["<Leader>oo"] = { "<cmd>ObsidianOpen<cr>", desc = "Open in Obsidian App" },
          ["<Leader>oq"] = { "<cmd>ObsidianQuickSwitch<cr>", desc = "Quick Switch" },

          -- Daily notes
          ["<Leader>od"] = { desc = " Daily Notes" },
          ["<Leader>odt"] = { "<cmd>ObsidianToday<cr>", desc = "Today" },
          ["<Leader>ody"] = { "<cmd>ObsidianYesterday<cr>", desc = "Yesterday" },
          ["<Leader>odm"] = { "<cmd>ObsidianTomorrow<cr>", desc = "Tomorrow" },
          ["<Leader>odl"] = { "<cmd>ObsidianDailies<cr>", desc = "List Dailies" },

          -- Search & navigation
          ["<Leader>os"] = { "<cmd>ObsidianSearch<cr>", desc = "Search Notes" },
          ["<Leader>ob"] = { "<cmd>ObsidianBacklinks<cr>", desc = "Backlinks" },
          ["<Leader>ol"] = { "<cmd>ObsidianLinks<cr>", desc = "Links in Buffer" },
          ["<Leader>ot"] = { "<cmd>ObsidianTags<cr>", desc = "Search Tags" },
          ["<Leader>oc"] = { "<cmd>ObsidianTOC<cr>", desc = "Table of Contents" },

          -- Templates & attachments
          ["<Leader>oi"] = { "<cmd>ObsidianTemplate<cr>", desc = "Insert Template" },
          ["<Leader>op"] = { "<cmd>ObsidianPasteImg<cr>", desc = "Paste Image" },

          -- Editing
          ["<Leader>or"] = { "<cmd>ObsidianRename<cr>", desc = "Rename Note" },
          ["<Leader>ox"] = { "<cmd>ObsidianToggleCheckbox<cr>", desc = "Toggle Checkbox" },
        },
        v = {
          -- Visual mode mappings for linking
          ["<Leader>o"] = { desc = "󰠮 Obsidian" },
          ["<Leader>ol"] = { "<cmd>ObsidianLink<cr>", desc = "Link Selection" },
          ["<Leader>on"] = { "<cmd>ObsidianLinkNew<cr>", desc = "Link to New Note" },
          ["<Leader>oe"] = { "<cmd>ObsidianExtractNote<cr>", desc = "Extract to Note" },
        },
      },
    },
  },
}
