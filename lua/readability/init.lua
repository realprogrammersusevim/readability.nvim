local math = require('math')
local sentence = require('readability.sentence')
local syllable = require('readability.syllable')

-- TODO: Add more functions to get different readability scores
local function readability()
  local content = vim.api.nvim_buf_get_lines(0, 0, vim.api.nvim_buf_line_count(0), false)
  content = table.concat(content, '\n')
  local sentences = sentence.split_sentences(content)

  local num_sentences = #sentences
  local num_polysyl = 0
  for i = 1, num_sentences do
    local words = sentence.mysplit(sentences[i])
    for j = 1, #words do
      local syllables = syllable.count(words[j])
      if syllables >= 3 then
        num_polysyl = num_polysyl + 1
      end
    end
  end

  local smog_index = 1.043 * math.sqrt(num_polysyl * (30 / num_sentences)) + 3.1291
  print('SMOG index: ' .. smog_index)
end

return { readability = readability }
