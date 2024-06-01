local util = require("tokyonight.util")

local M = {}

--- @param colors ColorScheme
function M.generate(colors)
  local fuzzelColors = {}
  for k, v in pairs(colors) do
    if type(v) == "string" then
      fuzzelColors[k] = v:gsub("^#", "") .. "ff"
    end
  end
  fuzzelColors.bg = fuzzelColors.bg:gsub("ff$", "dd")
  local fuzzel = util.template(
    [[
[colors]
background=${bg}
text=${fg}
match=${blue1}
selection=${bg_highlight}
selection-match=${blue1}
selection-text=${fg}
border=${border_highlight}
]],
    fuzzelColors
  )
  return fuzzel
end

return M
