return {
  "iamcco/markdown-preview.nvim",
  build = "cd app && yarn install",
  ft = { "markdown", "md" },
  config = function()
    vim.g.mkdp_page_title = "${name}"
    vim.g.mkdp_preview_options = {
      mkit = {},
      katex = {},
      uml = { server = "http://127.0.0.1:8080" },
      maid = {},
      disable_sync_scroll = 0,
      sync_scroll_type = "middle"
    }
    vim.g.mkdp_auto_start = 0
    vim.g.mkdp_refresh_slow = 1
    vim.g.mkdp_browser = "min"
  end,
  cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
}   
