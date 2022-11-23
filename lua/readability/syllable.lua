local M = {}

local special_syllables = {
  ['tottered'] = 2,
  ['chummed'] = 1,
  ['peeped'] = 1,
  ['moustaches'] = 2,
  ['shamefully'] = 3,
  ['messieurs'] = 2,
  ['satiated'] = 4,
  ['sailmaker'] = 4,
  ['sheered'] = 1,
  ['disinterred'] = 3,
  ['propitiatory'] = 6,
  ['bepatched'] = 2,
  ['particularized'] = 5,
  ['caressed'] = 2,
  ['trespassed'] = 2,
  ['sepulchre'] = 3,
  ['flapped'] = 1,
  ['hemispheres'] = 3,
  ['pencilled'] = 2,
  ['motioned'] = 2,
  ['poleman'] = 2,
  ['slandered'] = 2,
  ['sombre'] = 2,
  ['etc'] = 4,
  ['sidespring'] = 2,
  ['mimes'] = 1,
  ['effaces'] = 2,
  ['mr'] = 2,
  ['mrs'] = 2,
  ['ms'] = 1,
  ['dr'] = 2,
  ['st'] = 1,
  ['sr'] = 2,
  ['jr'] = 2,
  ['truckle'] = 2,
  ['foamed'] = 1,
  ['fringed'] = 2,
  ['clattered'] = 2,
  ['capered'] = 2,
  ['mangroves'] = 2,
  ['suavely'] = 2,
  ['reclined'] = 2,
  ['brutes'] = 1,
  ['effaced'] = 2,
  ['quivered'] = 2,
  ["h'm"] = 1,
  ['veriest'] = 3,
  ['sententiously'] = 4,
  ['deafened'] = 2,
  ['manoeuvred'] = 3,
  ['unstained'] = 2,
  ['gaped'] = 1,
  ['stammered'] = 2,
  ['shivered'] = 2,
  ['discoloured'] = 3,
  ['gravesend'] = 2,
  ['60'] = 2,
  ['lb'] = 1,
  ['unexpressed'] = 3,
  ['greyish'] = 2,
  ['unostentatious'] = 5,
}

local fallback_subsyl = {
  'cial',
  'tia',
  'cius',
  'cious',
  'gui',
  'ion',
  'iou',
  'sia$',
  '%.ely$',
}

local fallback_addsyl = {
  'ia',
  'riet',
  'dien',
  'iu',
  'io',
  'ii',
  '[aeiou]bl$',
  'mbl$', -- -Vble, plus -mble
  '[aeiou]{3}',
  '^mc',
  'ism$',
  '(.)(?!\\1)([aeiouy])\\2l$',
  '[^l]lien',
  '^coa[dglx].',
  '(.)(?!\\1)[gq]ua(.)(?!\\2)[aeiou]',
  'dnt$',
}

local fallback_cache = {}

local function normalize_word(word)
  local normalized = word:lower()
  normalized = normalized:gsub('[^%w]', '')
  return normalized
end

for i, v in ipairs(special_syllables) do
  fallback_cache[normalize_word(i)] = v
end

function M.count(word)
  word = normalize_word(word)

  -- local syl_count = fallback_cache[word]
  -- print(syl_count)
  -- if syl_count then
  --   return syl_count
  -- end

  if word[-1] == 'e' then
    word = word:sub(1, -2)
  end

  local syl_count = 0
  local prev_was_vowel = ''
  for i = 1, #word do
    local c = word:sub(i, i)
    local is_vowel = c:match('[aeiouy]')

    if is_vowel and not prev_was_vowel then
      syl_count = syl_count + 1
    end

    prev_was_vowel = is_vowel
  end

  -- This is commented out until I can get it working.
  -- for i, v in ipairs(fallback_subsyl) do
  --   syl_count = syl_count + syl_count:gmatch(v)
  -- end
  --
  -- for i, v in ipairs(fallback_addsyl) do
  --   syl_count = syl_count + syl_count:gmatch(v)
  -- end

  -- fallback_cache[word] = syl_count

  return syl_count
end

return M
