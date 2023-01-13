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

local SubSyl = {
  'cial',
  'tia',
  'cius',
  'cious',
  'giu', -- belgium!
  'ion',
  'iou',
  'sia$',
  '.ely$', -- absolutely! (but not ely!)
  '[^td]ed$', -- accused is 2, but executed is 4
}

local AddSyl = {
  'ia',
  'riet',
  'dien',
  'iu',
  'io',
  'ii',
  'microor',
  '[aeiouym]bl$', -- -Vble, plus -mble
  '[aeiou]{3}', -- agreeable
  '^mc',
  'ism$', -- -ism
  'isms$', -- -isms
  '([^aeiouy])\1l$', -- middle twiddle battle bottle, etc.
  '[^l]lien', -- alien, salient [1]
  '^coa[dglx].', -- [2]
  '[^gq]ua[^auieo]', -- i think this fixes more than it breaks
  'dnt$', -- couldn't
}

function M.count(word)
  if special_syllables[word] then
    return special_syllables[word]
  end

  local scrugg, syl = {}, 0
  word = string.lower(word)
  if word == 'w' then
    return 2
  end
  if string.len(word) == 1 then
    return 1
  end
  word = vim.fn.substitute(word, '[^\\w]', '', '')
  word = string.gsub(word, "'", '') -- fold contractions.  not very effective.
  word = string.gsub(word, 'e$', '')
  for i in vim.gsplit(word, '[^aeiouy]+', false) do
    table.insert(scrugg, i)
  end
  if #scrugg > 0 and scrugg[1] == '' then
    table.remove(scrugg, 1)
  end
  -- special cases
  for _, v in ipairs(SubSyl) do
    if string.match(word, v) then
      syl = syl - 1
    end
  end
  for _, v in ipairs(AddSyl) do
    if string.match(word, v) then
      syl = syl + 1
    end
  end
  -- count vowel groupings
  syl = syl + #scrugg
  if syl == 0 then
    return 1
  end -- got no vowels? ("the", "crwth")
  return syl
end

return M
