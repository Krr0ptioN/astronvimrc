return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astronvim.utils").list_insert_unique(
      opts.ensure_installed, {
        "lua",                                                                -- lua                                                       -- Linux
        "awk", "bash", "sxkhdrc",                                             -- Linux
        "c", "cpp", "cmake",                                                  -- C/C++
        "dockerfile",                                                         -- Infra
        "git_config", "git_rebase", "gitcommit", "gitignore", "diff",         -- Git
        "css", "scss", "graphql", "http", "html", "javascript",
        "typescript",                                                         -- Web
        "json", "regex",                                                      -- Data Structures
        "latex", "markdown",                                                  -- Text
        "prisma", "sql",                                                      -- Database
        "python",                                                             -- Python
        "rust"                                                                -- Rust
      })
  end
}
