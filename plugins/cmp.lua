return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "saadparwaiz1/cmp_luasnip", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp"
    },
    event = "InsertEnter",
    opts = function()
        local cmp = require "cmp"
        local snip_status_ok, luasnip = pcall(require, "luasnip")
        local lspkind_status_ok, lspkind = pcall(require, "lspkind")
        local utils = require "astronvim.utils"
        if not snip_status_ok then return end
        local border_opts = {
            border = "rounded",
            winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None"
        }

        local function has_words_before()
            local line, col = (unpack or table.unpack)(vim.api
                                                           .nvim_win_get_cursor(
                                                           0))
            return col ~= 0 and
                       vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(
                           col, col):match "%s" == nil
        end

        return {
            enabled = function()
                local dap_prompt =
                    utils.is_available "cmp-dap" -- add interoperability with cmp-dap
                    and
                        vim.tbl_contains(
                            {"dap-repl", "dapui_watches", "dapui_hover"},
                            vim.api.nvim_get_option_value("filetype", {buf = 0}))
                if vim.api.nvim_get_option_value("buftype", {buf = 0}) ==
                    "prompt" and not dap_prompt then return false end
                return vim.g.cmp_enabled
            end,
            preselect = cmp.PreselectMode.None,
            formatting = {
                fields = {"kind", "abbr", "menu"},
                format = function(entry, vim_item)
                    local kind = require("lspkind").cmp_format({
                        mode = "symbol_text",
                        maxwidth = 50
                    })(entry, vim_item)
                    local strings = vim.split(kind.kind, "%s",
                                              {trimempty = true})
                    kind.kind = " " .. (strings[1] or "") .. " "
                    kind.menu = "    (" .. (strings[2] or "") .. ")"

                    return kind
                end
                -- fields = { "kind", "abbr", "menu" },
                -- format = lspkind_status_ok and lspkind.cmp_format(utils.plugin_opts "lspkind.nvim") or nil,
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end
            },
            duplicates = {
                nvim_lsp = 1,
                luasnip = 1,
                cmp_tabnine = 1,
                buffer = 1,
                path = 1
            },
            confirm_opts = {
                behavior = cmp.ConfirmBehavior.Replace,
                select = false
            },
            window = {
                completion = {
                    winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
                    col_offset = -3,
                    side_padding = 0
                },
                -- completion = cmp.config.window.bordered(border_opts),
                documentation = cmp.config.window.bordered(border_opts)
            },
            mapping = {
                ["<Up>"] = cmp.mapping.select_prev_item {
                    behavior = cmp.SelectBehavior.Select
                },
                ["<Down>"] = cmp.mapping.select_next_item {
                    behavior = cmp.SelectBehavior.Select
                },
                ["<C-p>"] = cmp.mapping.select_prev_item {
                    behavior = cmp.SelectBehavior.Insert
                },
                ["<C-n>"] = cmp.mapping.select_next_item {
                    behavior = cmp.SelectBehavior.Insert
                },
                ["<C-k>"] = cmp.mapping.select_prev_item {
                    behavior = cmp.SelectBehavior.Insert
                },
                ["<C-j>"] = cmp.mapping.select_next_item {
                    behavior = cmp.SelectBehavior.Insert
                },
                ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
                ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
                ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
                ["<C-y>"] = cmp.config.disable,
                ["<C-e>"] = cmp.mapping {
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close()
                },
                ["<CR>"] = cmp.mapping.confirm {select = false},
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_locally_jumpable() then
                        luasnip.expand_or_jump()
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, {"i", "s"}),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, {"i", "s"})
            },
            sources = cmp.config.sources {
                {name = "emmet_vim", priority = 1050},
                {name = "nvim_lsp", priority = 1000},
                {name = "luasnip", priority = 750},
                {name = "buffer", priority = 500},
                {name = "path", priority = 250}
            }
        }
    end
}
