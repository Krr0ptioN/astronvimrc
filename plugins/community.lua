return {
    "AstroNvim/astrocommunity",
    -- Add the community repository of plugin specifications
    -- Diagnostics ------------------------------
    {import = "astrocommunity.diagnostics.trouble-nvim"},
    -- Git --------------------------------------
    {import = "astrocommunity.git.git-blame-nvim"},
    -- Motions ----------------------------------
    {import = "astrocommunity.motion.nvim-surround"},
    -- Pack -------------------------------------
    {import = "astrocommunity.pack.typescript"},
    {import = "astrocommunity.pack.prisma"},
    {import = "astrocommunity.pack.docker"},
    {import = "astrocommunity.pack.markdown"},
    {import = "astrocommunity.pack.tailwindcss"},
    {import = "astrocommunity.pack.yaml"},
    {import = "astrocommunity.pack.cmake"},
    {import = "astrocommunity.pack.json"},
    {import = "astrocommunity.pack.python"},
    {import = "astrocommunity.pack.rust"},
    -- Markdown ---------------------------------
    {import = "astrocommunity.markdown-and-latex.glow-nvim"},
    -- Project ----------------------------------
    {import = "astrocommunity.project.project-nvim"}
}
