return {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
    },
    config = function()
        require("chatgpt").setup({
            api_key_cmd = 'echo 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'
        })
    end
}
