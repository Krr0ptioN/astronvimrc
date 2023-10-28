return {
    "AstroNvim/astrocommunity",
    -- Add the community repository of plugin specifications
    -- Diagnostics ------------------------------
    {import = "astrocommunity.diagnostics.trouble-nvim"},
    {import = "astrocommunity.code-runner.sniprun"},
    -- Git --------------------------------------
    {import = "astrocommunity.git.git-blame-nvim"},
    {import = "astrocommunity.git.octo-nvim"},
    -- Motions ----------------------------------
    {import = "astrocommunity.motion.nvim-surround"},
    -- Editing Support --------------------------
    {import = "astrocommunity.editing-support.hypersonic-nvim"},
    {import = "astrocommunity.editing-support.neogen"},
    {import = "astrocommunity.editing-support.nvim-devdocs"},
    -- Pack -------------------------------------
    {import = "astrocommunity.pack.typescript"},
    {import = "astrocommunity.pack.prisma"},
    {import = "astrocommunity.pack.docker"},
    {import = "astrocommunity.pack.markdown"},
    {import = "astrocommunity.pack.tailwindcss"},
    {import = "astrocommunity.pack.clojure"},
    {import = "astrocommunity.pack.html-css"},
    {import = "astrocommunity.pack.yaml"},
    {import = "astrocommunity.pack.cmake"},
    {import = "astrocommunity.pack.json"}, {import = "astrocommunity.pack.php"},
    {import = "astrocommunity.pack.python"},
    {import = "astrocommunity.pack.rust"},
    -- Completion ---------------------------------
    {import = "astrocommunity.completion.tabnine-nvim"},
    -- {import = "astrocommunity.completion.cmd-cmdline"},
    -- Markdown ---------------------------------
    {import = "astrocommunity.markdown-and-latex.glow-nvim"},
    {import = "astrocommunity.markdown-and-latex.markdown-preview-nvim"},
    --- Latex -----------------------------------
    {import = "astrocommunity/markdown-and-latex/vimtex"},
    -- Project ----------------------------------
    {import = "astrocommunity.project.project-nvim"}
}
