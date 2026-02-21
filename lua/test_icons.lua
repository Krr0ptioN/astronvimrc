local astroui = require("astroui")
local icons = astroui.config.icons or {}
print("Available icons:")
for k, v in pairs(icons) do
  print(k .. ": " .. v)
end
