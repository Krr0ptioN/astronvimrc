---@type LazySpec
return {
  { "AstroNvim/astrocommunity", dir = "/home/master/hex/repos/astrocommunity" },
  { import = "astrocommunity.recipes.telescope-nvchad-theme" },
  -- Diagnostics ------------------------------
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  { import = "astrocommunity.code-runner.sniprun" },
  -- Git --------------------------------------
  { import = "astrocommunity.git.git-blame-nvim" },
  { import = "astrocommunity.git.octo-nvim" },
  -- Motions ----------------------------------
  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.motion.harpoon" },
  -- Editing Support --------------------------
  { import = "astrocommunity.editing-support.hypersonic-nvim" },
  { import = "astrocommunity.editing-support.neogen" },
  { import = "astrocommunity.editing-support.nvim-devdocs" },
  -- Pack -------------------------------------
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.angular" },
  { import = "astrocommunity.pack.prisma" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.clojure" },
  { import = "astrocommunity.code-runner.conjure" },
  { import = "astrocommunity.code-runner.executor-nvim" },
  { import = "astrocommunity.lsp.ts-error-translator-nvim" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.cmake" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.php" },
  { import = "astrocommunity.pack.laravel" },
  { import = "astrocommunity.pack.blade" },
  { import = "astrocommunity.pack.typst" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.kotlin" },
  { import = "astrocommunity.pack.go" },
  {
    "mfussenegger/nvim-jdtls",
    opts = {
      settings = {
        java = {
          configuration = {
            runtimes = {
              {
                name = "JavaSE-11",
                path = "/usr/lib/jvm/java-11-openjdk/",
              },
            },
          },
        },
        format = {
          enabled = true,
          settings = { -- you can use your preferred format style
            url = "https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml",
            profile = "GoogleStyle",
          },
        },
      },
    },
  },
  --- Latex -----------------------------------
  { import = "astrocommunity.markdown-and-latex.vimtex" },
  -- Markdown ---------------------------------
  { import = "astrocommunity.markdown-and-latex.glow-nvim" },
  { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },
  { import = "astrocommunity.markdown-and-latex.render-markdown-nvim" },
  { import = "astrocommunity.markdown-and-latex.markmap-nvim" },

  --- AI ----
  { import = "astrocommunity.recipes.ai" },

  -- Project ----------------------------------
  { import = "astrocommunity.project.project-nvim" },
  -- Note Taking ------------------------------
  -- { import = "astrocommunity.note-taking.obsidian-nvim" },
  -- Utility ----------------------------------
  -- { import = "astrocommunity.utility.community-picker" },
  { import = "astrocommunity.colorscheme.aurora" },
  { import = "astrocommunity.ai.sidekick-nvim" },
  { import = "astrocommunity.terminal-integration.flatten-nvim" },
  {
    "pmizio/typescript-tools.nvim",
    opts = {
      handlers = {
        diagnostic = false,  -- Disable error source
      }
    }
  },
  {
    "nvimdev/ts-error-translator.nvim",
    enabled = false,  -- Primary culprit
  },{ import = "astrocommunity.ai.opencode-nvim" },
}
