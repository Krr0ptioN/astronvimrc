local M = {}

M.config = function()
  if vim.g.neovide then
    vim.o.guifont = "JetbrainsMono Nerd Font:h9"
    vim.g.neovide_floating_shadow = true
    vim.g.neovide_floating_z_height = 10
    vim.g.neovide_light_angle_degrees = 45
    vim.g.neovide_light_radius = 5
  end
end

return M
