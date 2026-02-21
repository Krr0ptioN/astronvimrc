return {
  {
    "Saghen/blink.cmp",
    opts = {
      completion = {
        menu = {
          border = "rounded",
          winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpSelection,Search:None",
          draw = {
            columns = {
              { "kind_icon", "label", gap = 1 },
              { "kind" },
            },
          },
        },
        documentation = {
          auto_show = true,
          window = {
            border = "rounded",
            winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
          },
        },
      },
    },
  },
  {
    dir = "/home/master/hex/projects/vercel.nvim",
    name = "vercel.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "AstroNvim/astrocore",
    opts = {
      options = {
        opt = {
          background = "dark",
        },
      },
    },
  },
}
