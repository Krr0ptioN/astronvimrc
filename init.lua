return {
    -- Configure AstroNvim updates
    updater = {
        remote = "origin", -- remote to use
        channel = "stable", -- "stable" or "nightly"
        version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
        branch = "nightly", -- branch name (NIGHTLY ONLY)
        commit = nil, -- commit hash (NIGHTLY ONLY)
        pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
        skip_prompts = false, -- skip prompts about breaking changes
        show_changelog = true, -- show the changelog after performing an update
        auto_quit = false, -- automatically quit the current session after a successful update
        remotes = { -- easily add new remotes to track
            --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
            --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
            --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
        }
    },

    -- Set colorscheme to use
    -- colorscheme = "astrodark",
    highlights = {
        -- set highlights for all themes
        -- use a function override to let us use lua to retrieve colors from highlight group
        -- there is no default table so we don't need to put a parameter for this function
        init = function()
            local get_hlgroup = require("astronvim.utils").get_hlgroup
            local normal = get_hlgroup "Normal"
            local fg, bg = normal.fg, normal.bg
            local bg_alt = get_hlgroup("Visual").bg
            local green = get_hlgroup("String").fg
            local red = get_hlgroup("Error").fg

            return {
                TelescopeBorder = {fg = bg_alt, bg = bg},
                TelescopeNormal = {bg = bg},
                TelescopePreviewBorder = {fg = bg, bg = bg},
                TelescopePreviewNormal = {bg = bg},
                TelescopePreviewTitle = {fg = bg, bg = green},
                TelescopePromptBorder = {fg = bg_alt, bg = bg_alt},
                TelescopePromptNormal = {fg = fg, bg = bg_alt},
                TelescopePromptPrefix = {fg = red, bg = bg_alt},
                TelescopePromptTitle = {fg = bg, bg = red},
                TelescopeResultsBorder = {fg = bg, bg = bg},
                TelescopeResultsNormal = {bg = bg},
                TelescopeResultsTitle = {fg = bg, bg = bg},

                -- Nvim Cmp
                PmenuSel = {bg = "#282C34", fg = "NONE"},
                Pmenu = {fg = "#C5CDD9", bg = "#22252A"},
                CmpItemAbbrDeprecated = {
                    fg = "#7E8294",
                    bg = "NONE",
                    strikethrough = true
                },
                CmpItemAbbrMatch = {fg = "#82AAFF", bg = "NONE", bold = true},
                CmpItemAbbrMatchFuzzy = {
                    fg = "#82AAFF",
                    bg = "NONE",
                    bold = true
                },
                CmpItemMenu = {fg = "#C792EA", bg = "NONE", italic = true},

                CmpItemKindField = {fg = "#EED8DA", bg = "#B5585F"},
                CmpItemKindProperty = {fg = "#EED8DA", bg = "#B5585F"},
                CmpItemKindEvent = {fg = "#EED8DA", bg = "#B5585F"},

                CmpItemKindText = {fg = "#C3E88D", bg = "#9FBD73"},
                CmpItemKindEnum = {fg = "#C3E88D", bg = "#9FBD73"},
                CmpItemKindKeyword = {fg = "#C3E88D", bg = "#9FBD73"},

                CmpItemKindConstant = {fg = "#FFE082", bg = "#D4BB6C"},
                CmpItemKindConstructor = {fg = "#FFE082", bg = "#D4BB6C"},
                CmpItemKindReference = {fg = "#FFE082", bg = "#D4BB6C"},

                CmpItemKindFunction = {fg = "#EADFF0", bg = "#A377BF"},
                CmpItemKindStruct = {fg = "#EADFF0", bg = "#A377BF"},
                CmpItemKindClass = {fg = "#EADFF0", bg = "#A377BF"},
                CmpItemKindModule = {fg = "#EADFF0", bg = "#A377BF"},
                CmpItemKindOperator = {fg = "#EADFF0", bg = "#A377BF"},

                CmpItemKindVariable = {fg = "#C5CDD9", bg = "#7E8294"},
                CmpItemKindFile = {fg = "#C5CDD9", bg = "#7E8294"},

                CmpItemKindUnit = {fg = "#F5EBD9", bg = "#D4A959"},
                CmpItemKindSnippet = {fg = "#F5EBD9", bg = "#D4A959"},
                CmpItemKindFolder = {fg = "#F5EBD9", bg = "#D4A959"},

                CmpItemKindMethod = {fg = "#DDE5F5", bg = "#6C8ED4"},
                CmpItemKindValue = {fg = "#DDE5F5", bg = "#6C8ED4"},
                CmpItemKindEnumMember = {fg = "#DDE5F5", bg = "#6C8ED4"},

                CmpItemKindInterface = {fg = "#D8EEEB", bg = "#58B5A8"},
                CmpItemKindColor = {fg = "#D8EEEB", bg = "#58B5A8"},
                CmpItemKindTypeParameter = {fg = "#D8EEEB", bg = "#58B5A8"}
            }
        end
    },

    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {virtual_text = true, underline = true},

    -- Configure require("lazy").setup() options
    lazy = {
        defaults = {lazy = true},
        performance = {
            rtp = {
                -- customize default disabled vim plugins
                disabled_plugins = {
                    "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin",
                    "tarPlugin"
                }
            }
        }
    },
    polish = require('user.polish')
}
