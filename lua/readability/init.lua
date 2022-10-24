-- TODO: Add more functions to get different readability scores
local function readability()
  local path = vim.fn.expand("%:p")
  local posix = path:gsub(" ", "\\ ")

  local output = vim.fn.system("style " .. posix)

  -- Captures the SMOG index score from the output (only the number)
  local smog = string.match(output, "Grading: (%d%d%.%d)")

  print("SMOG: " .. smog)
end

return { readability = readability }
