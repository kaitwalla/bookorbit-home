-- Minimal KOReader dependency mocks; not a substitute for device tests.
package.preload['gettext'] = function() return function(s) return s end end
local registered, shown
package.preload['ui/widget/container/widgetcontainer'] = function()
  return { extend = function(_, fields) return fields end }
end
package.preload['ui/uimanager'] = function()
  return { show = function(widget) shown = widget end }
end
package.preload['ui/widget/menu'] = function()
  return { new = function(_, fields) return fields end }
end
package.preload['ui/widget/infomessage'] = function()
  return { new = function(_, fields) return fields end }
end
local meta = dofile('bookorbit-home.koplugin/_meta.lua')
assert(meta.name == 'bookorbit-home')
local home = dofile('bookorbit-home.koplugin/main.lua')
home.ui = { menu = { registerToMainMenu = function(_, obj) registered = obj end } }
home:init()
assert(registered == home)
local items = {}
home:addToMainMenu(items)
assert(type(items.bookorbit_home.callback) == 'function')
items.bookorbit_home.callback()
assert(shown.title == 'BookOrbit Home')
assert(#shown.item_table == 4)
shown.item_table[1].callback()
assert(shown.text:find('adapter not connected', 1, true))
print('Plugin smoke tests passed')