-- Helper: wrap visual selection with prefix/suffix strings
local function wrap_selection(prefix, suffix)
  return function()
    -- exit visual mode so '< and '> marks are set
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "x", false)
    local start_row, start_col = unpack(vim.api.nvim_buf_get_mark(0, "<"))
    local end_row, end_col = unpack(vim.api.nvim_buf_get_mark(0, ">"))
    -- get selected text
    local lines = vim.api.nvim_buf_get_text(0, start_row - 1, start_col, end_row - 1, end_col + 1, {})
    -- wrap: prepend prefix to first line, append suffix to last line
    lines[1] = prefix .. lines[1]
    lines[#lines] = lines[#lines] .. suffix
    -- replace the selection
    vim.api.nvim_buf_set_text(0, start_row - 1, start_col, end_row - 1, end_col + 1, lines)
  end
end

return {
  { "kaarmu/typst.vim", ft = "typst", lazy = false },
  {
    "chomosuke/typst-preview.nvim",
    lazy = false, -- or ft = 'typst'
    version = "0.1.*",
    build = function() require("typst-preview").update() end,
  },
  {
    "AstroNvim/astrocore",
    opts = {
      autocmds = {
        typst_visual_keys = {
          {
            event = "FileType",
            pattern = "typst",
            desc = "Typst visual-mode formatting keybindings",
            callback = function(args)
              local buf = args.buf
              local map = function(lhs, fn, desc)
                vim.keymap.set("v", lhs, fn, { buffer = buf, desc = desc })
              end
              map("<leader>i", wrap_selection("_", "_"), "Typst: italic")
              map("<leader>b", wrap_selection("*", "*"), "Typst: bold")
              map("<leader>u", wrap_selection("#underline[", "]"), "Typst: underline")
            end,
          },
        },
      },
    },
  },
}
