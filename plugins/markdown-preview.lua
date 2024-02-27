return {
    'iamcco/markdown-preview.nvim',
    lazy = true,
    build = 'cd app && yarn install',
    cmd = {'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop'},
    ft = {'markdown'},
    keys = {
        {
            '<f5>',
            '<Cmd>MarkdownPreviewToggle<CR>',
            desc = 'Toggle MarkdownPreview'
        }
    },
    config = function()
        vim.g.mkdp_filetypes = {'markdown'}
        vim.g.mkdp_theme = 'light'
    end
}
