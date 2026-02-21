local scandir = require("plenary.scandir")
local root = vim.fn.stdpath("data") .. "/lazy/astrocommunity/lua/astrocommunity"

local plugins = {}
local scanned = {}

scandir.scan_dir(root, {
  search_pattern = "%.lua$",
  depth = 3, -- limit depth
  on_insert = function(entry)
    local rel = entry:sub(#root + 2)
    -- Normalize path separators
    rel = rel:gsub("\\", "/")
    
    local parts = {}
    for part in rel:gmatch("[^/]+") do
      table.insert(parts, part)
    end
    
    local name = ""
    if parts[#parts] == "init.lua" then
      -- dir/init.lua -> dir
      if #parts > 1 then
        name = table.concat(parts, ".", 1, #parts - 1)
      end
    else
      -- dir/file.lua -> dir.file
      local file = parts[#parts]:gsub("%.lua$", "")
      if #parts > 1 then
        name = table.concat(parts, ".", 1, #parts - 1) .. "." .. file
      else
        name = file
      end
    end
    
    if name ~= "" and name ~= "init" and not name:match("^test") then
      local full_name = "astrocommunity." .. name
      if not scanned[full_name] then
        table.insert(plugins, full_name)
        scanned[full_name] = true
      end
    end
  end
})

table.sort(plugins)
for _, p in ipairs(plugins) do
  print(p)
end
