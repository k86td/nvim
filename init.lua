-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require 'user.plugins'
require 'user.base'
require 'user.syntax'
require 'user.completion'
require 'user.lsp'
require 'user.utils'
