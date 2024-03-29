return {
    -- customize alpha options
    {
        "goolord/alpha-nvim",
        opts = function(_, opts)
            -- customize the dashboard header
            opts.section.header.val = {
                "888b     d888        d8888 8888888b.  8888888b. 8888888 888b    888 ",
                "8888b   d8888       d88888 888   Y88b 888   Y88b  888   8888b   888 ",
                "88888b.d88888      d88P888 888    888 888    888  888   88888b  888 ",
                "888Y88888P888     d88P 888 888   d88P 888    888  888   888Y88b 888 ",
                "888 Y888P 888    d88P  888 8888888P   888    888  888   888 Y88b888 ",
                "888  Y8P  888   d88P   888 888 T88b   888    888  888   888  Y88888 ",
                "888   v   888  d8888888888 888  T88b  888  .d88P  888   888   Y8888 ",
                "888       888 d88P     888 888   T88b 8888888P  8888888 888    Y888 "
            }
            return opts
        end
    }
}
