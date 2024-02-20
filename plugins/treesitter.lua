return {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
        opts.ensure_installed = require("astronvim.utils").list_insert_unique(
                                    opts.ensure_installed, {
                "lua", -- lua
                "awk", "bash", "sxhkdrc", -- Linux
                "c", "cpp", "cmake", -- C/C++
                "dockerfile", -- Infra
                "git_config", "git_rebase", "gitcommit", "gitignore", "diff", -- Git
                "css", "scss", "graphql", "http", "html", "javascript",
                "typescript", -- Web
                "json", "regex", -- Data Structures
                "latex", "markdown", -- Text
                "prisma", "sql", -- Database
                "python", -- Python
                "rust" -- Rust
            })
    end
}
