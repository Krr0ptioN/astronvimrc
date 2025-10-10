-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
      "lua",
      "vim",
      -- C and C++ Ecosystem
      "c",
      "cpp",
      "cmake",
      -- Linux
      "sxhkdrc",
      "bash",
      "awk",
      -- Data Structure
      "yaml",
      "json",
      "regex",
      -- Web Development
      "typescript",
      "sql",
      "graphql",
      "http",
      "html",
      "javascript",
      "css",
      "scss",
      -- Infra
      "dockerfile",
      -- Rust Development
      "rust",
      -- Python Development
      "python",
      -- Git
      "git_config",
      "git_rebase",
      "gitcommit",
      "gitignore",
      "diff",
    })
  end,
}
