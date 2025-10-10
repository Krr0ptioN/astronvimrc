---@type LazySpec
return {
  "AstroNvim/astrocommunity",
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
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.cmake" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.php" },
  { import = "astrocommunity.pack.typst" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.kotlin" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.java" },
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
  },-- Completion ---------------------------------
  { import = "astrocommunity.completion.tabnine-nvim" },
  -- Markdown ---------------------------------
  { import = "astrocommunity.markdown-and-latex.glow-nvim" },
  --- Latex -----------------------------------
  { import = "astrocommunity.markdown-and-latex.vimtex" },
  -- Project ----------------------------------
  { import = "astrocommunity.project.project-nvim" },
}
