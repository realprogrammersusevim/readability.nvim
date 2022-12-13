local syllable = require('readability.syllable')
local sentence = require('readability.sentence')

local readability = {}

local function read_buffer()
  local content = vim.api.nvim_buf_get_lines(0, 0, vim.api.nvim_buf_line_count(0), false)
  content = table.concat(content, '\n')

  return content
end

function readability.smog()
  local content = read_buffer()
  local cleaned = sentence.remove_problems(content)
  local sentences = sentence.split_sentences(cleaned)

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

function readability.flesch()
  local content = read_buffer()
  local cleaned = sentence.remove_problems(content)
  local sentences = sentence.split_sentences(cleaned)
  local num_sentences = #sentences
  local words = sentence.mysplit(content)
  local num_words = #words
  local syllables = 0
  for i = 1, #words do
    syllables = syllables + syllable.count(words[i])
  end

  -- Compute the Flesch index
  local flesch_index = ((0.39 * (num_words / num_sentences)) + (11.8 * (syllables / num_words)))
    - 15.59
  print('Flesch index: ' .. flesch_index)
end

return readability
