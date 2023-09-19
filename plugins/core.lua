return {
    -- customize alpha options
    {
        "goolord/alpha-nvim",
        opts = function(_, opts)
            -- customize the dashboard header
            opts.section.header.val = {
                "888b     d888        d8888 8888888b.  8888888b. 8888888 888b    888 ",
                "8888b   d8888       d88888 888   Y88b 888   Y88b  888   8888b   888 ",
                "88888b.d88888      d88P888 888    888 888    888  888   88888b  888 ",
                "888Y88888P888     d88P 888 888   d88P 888    888  888   888Y88b 888 ",
                "888 Y888P 888    d88P  888 8888888P   888    888  888   888 Y88b888 ",
                "888  Y8P  888   d88P   888 888 T88b   888    888  888   888  Y88888 ",
                "888   v   888  d8888888888 888  T88b  888  .d88P  888   888   Y8888 ",
                "888       888 d88P     888 888   T88b 8888888P  8888888 888    Y888 "
            }
            return opts
        end
    }
    -- {
    --   "windwp/nvim-autopairs",
    --   config = function(plugin, opts)
    --     require "plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
    --     -- add more custom autopairs configuration such as custom rules
    --     local npairs = require "nvim-autopairs"
    --     local Rule = require "nvim-autopairs.rule"
    --     local cond = require "nvim-autopairs.conds"
    --     npairs.add_rules(
    --       {
    --         Rule("$", "$", { "tex", "latex" })
    --           -- don't add a pair if the next character is %
    --           :with_pair(cond.not_after_regex "%%")
    --           -- don't add a pair if  the previous character is xxx
    --           :with_pair(
    --             cond.not_before_regex("xxx", 3)
    --           )
    --           -- don't move right when repeat character
    --           :with_move(cond.none())
    --           -- don't delete if the next character is xx
    --           :with_del(cond.not_after_regex "xx")
    --           -- disable adding a newline when you press <cr>
    --           :with_cr(cond.none()),
    --       },
    --       -- disable for .vim files, but it work for another filetypes
    --       Rule("a", "a", "-vim")
    --     )
    --   end,
    -- },
}
