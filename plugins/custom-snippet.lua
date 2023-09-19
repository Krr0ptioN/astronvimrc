return {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
        -- include the default astronvim config that calls the setup call
        local types = require "luasnip.util.types"
        require'luasnip'.config.setup({
            ext_opts = {
                [types.choiceNode] = {
                    active = {virt_text = {{"●", "GruvboxOrange"}}}
                },
                [types.insertNode] = {
                    active = {virt_text = {{"●", "GruvboxBlue"}}}
                }
            }
        })
        require "plugins.configs.luasnip"(plugin, opts)
        require("luasnip.loaders.from_vscode").lazy_load {
            -- Adjust the path relative to your configuration directory
            paths = {"./lua/user/snippets"}
        }
    end
}
