return {
    'folke/todo-comments.nvim',
    dependencies = {"nvim-lua/plenary.nvim"},
    event = "User AstronFile",
    cmd = {"TodoTrouble", "TodoTelescope", "TodoLocList", "TodoQuickFix"},
    config = function()
        require('todo-comments').setup({
            signs = true, -- show icons in the signs column
            sign_priority = 8, -- sign priority
            -- keywords recognized as todo comments
            colors = {
                error = {"DiagnosticError", "ErrorMsg", "#DC2626"},
                warning = {"DiagnosticWarn", "WarningMsg", "#FF9000"},
                task = {"DiagnosticWarn", "WarningMsg", "#FBBF24"},
                info = {"DiagnosticInfo", "#2563EB"},
                hint = {"DiagnosticHint", "#10B981"},
                default = {"Identifier", "#7C3AED"},
                test = {"Identifier", "#FF00FF"}
            },
            keywords = {
                FIX = {
                    icon = " ", -- icon used for the sign, and in search results
                    color = "error", -- can be a hex color, or a named color (see below)
                    -- a set of other keywords that all map to this FIX keywords
                    alt = {"FIXME", "BUG", "FIXIT", "ISSUE"}
                    -- signs = false, -- configure signs for some keywords individually
                },
                TODO = {icon = " ", color = "warning"},
                DOING = {icon = " ", color = "warning"},
                DONE = {icon = " ", color = "hint", alt = {"DOING"}},
                HACK = {icon = " ", color = "error"},
                WARN = {
                    icon = " ",
                    color = "warning",
                    alt = {"WARNING", "XXX"}
                },
                PERF = {icon = " ", color = "hint", alt = {"OPTIM"}},
                NOTE = {icon = " ", color = "hint", alt = {"INFO"}},
                TEST = {
                    icon = " ",
                    color = "test",
                    alt = {"TESTING", "PASSED", "FAILED"}
                }
            },
            gui_style = {
                fg = "NONE", -- The gui style to use for the fg highlight group.
                bg = "BOLD" -- The gui style to use for the bg highlight group.
            },
            merge_keywords = true,
            highlight = {
                multiline = true, -- enable multine todo comments
                -- lua pattern to match the next multiline from the start of the matched keyword
                multiline_pattern = "^.",
                multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
                -- "fg" or "bg" or empty
                -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty.
                -- wide and wide_bg is the same as bg
                -- but will also highlight surrounding characters
                -- wide_fg acts accordingly but with fg
                before = "",
                keyword = "wide",
                after = "fg", -- "fg" or "bg" or empty
                pattern = [[.*<(KEYWORDS)\s*:]], -- DONE pattern or table of patterns, used for highlightng (vim regex)
                -- comments_only = false, -- uses treesitter to match keywords in comments only
                max_line_len = 400, -- ignore lines longer than this
                exclude = {} -- list of file types to exclude highlighting
            },
            -- list of named colors where we try to extract the guifg from the
            -- list of highlight groups or use the hex color if hl not found as a fallback
            search = {
                command = "rg",
                args = {
                    "--no-heading", "--with-filename", "--line-number",
                    "--column"
                },
                -- regex that will be used to match keywords.
                -- don't replace the (KEYWORDS) placeholder
                -- pattern = [[\b(KEYWORDS):]], -- ripgrep regex
                pattern = [[\b(KEYWORDS)\b]] -- match without the extra colon. You'll likely get false positives
            }
        })
    end,
    keys = {
        {"<leader>T", "<cmd>TodoTelescope<cr>", "Todo Telescope"}, {
            "]T",
            function() require("todo-comments").jump_next() end,
            desc = "Next TODO comment"
        }, {
            "[T",
            function() require("todo-comments").prev_next() end,
            desc = "Prev TODO comment"
        }
    }
}
