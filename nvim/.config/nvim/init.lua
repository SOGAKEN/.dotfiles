require('sogaken.base')
require('sogaken.highlights')
require('sogaken.maps')
require('sogaken.plugins')

local has = function(x)
  return vim.fn.has(x) == 1
end
local is_mac = has "macunix"

if is_mac then
  require('sogaken.macos')
end

