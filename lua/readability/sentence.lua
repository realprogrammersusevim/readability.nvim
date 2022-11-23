local M = {}

function M.mysplit(inputstr, sep)
  if sep == nil then
    sep = '%s'
  end

  local t = {}
  for str in string.gmatch(inputstr, '([^' .. sep .. ']+)') do
    table.insert(t, str)
  end
  return t
end

function M.remove_problems(string_to_check)
  local split = M.mysplit(string_to_check)

  local ignore_file = io.open('en.txt')
  ignore_file = ignore_file:read('*all')
  local ignore = M.mysplit(ignore_file)

  for i, v in ipairs(split) do
    for j, k in ipairs(ignore) do
      local test = k .. '.'
      if v == test then
        split[i] = k
      end
    end
  end

  -- Remove punctuation and numbers
  for i, v in ipairs(split) do
    -- local new = string.gsub(v, '[%p]', '')
    local new = string.gsub(v, '[%d]', '')
    split[i] = new
  end

  -- Now remove empty strings
  for i, v in ipairs(split) do
    if v == '' then
      table.remove(split, i)
    end
  end

  -- Recombine the table
  local file_text = table.concat(split, ' ')

  return file_text
end

function M.split_sentences(string_to_split)
  -- Split on periods, exclamation marks, and question marks
  local split = M.mysplit(string_to_split, '%.!%?')
  -- local split = mysplit(string_to_split, '.')
  -- local sentences = {}

  -- Now split sentences by ? and !
  -- for i, v in ipairs(split) do
  --   local new = mysplit(v, '?')
  --   for j, k in ipairs(new) do
  --     local newer = mysplit(k, '!')
  --     for l, m in ipairs(newer) do
  --       table.insert(sentences, m)
  --     end
  --   end
  -- end

  for i, v in ipairs(split) do
    if v:sub(1, 1) ~= ' ' and i ~= 1 then
      -- Combine the previous sentence with the current one
      split[i - 1] = split[i - 1] .. '.' .. v
      split[i] = ''
    elseif v:sub(1, 1) == ' ' then
      split[i] = string.sub(v, 2)
    end
  end

  return split
end

-- local file_text = io.open('test.md')
-- file_text = file_text:read('*all')
--
-- local split_sentences = M.split_sentences(M.remove_problems(file_text))
-- for i, v in ipairs(split_sentences) do
--   print(v)
-- end

return M
