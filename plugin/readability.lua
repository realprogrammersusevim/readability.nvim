if vim.g.loaded_readability == 1 then
  return
end
vim.g.loaded_readability = 1

local readability = require('readability')

vim.api.nvim_create_user_command('ReadabilitySmog', readability.smog, {})
vim.api.nvim_create_user_command('ReadabilityFlesch', readability.flesch, {})
