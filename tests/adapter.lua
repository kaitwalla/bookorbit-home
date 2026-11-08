local Adapter = dofile("bookorbit-home.koplugin/bookorbit_adapter.lua")
local called
local live = { name = "bookorbit", browseCatalog = function(self, cached)
    assert(self == live)
    called = cached
end }
assert(Adapter.isCompatible(live))
assert(not Adapter.isCompatible({ name = "bookorbit" }))
local ok = Adapter.open(live, true)
assert(ok and called == true)
ok = Adapter.open(live, false)
assert(ok and called == false)
local failure, message = Adapter.open(nil, true)
assert(failure == false and message:find("unavailable"))
local crashing = {name="bookorbit", browseCatalog=function() error("test error") end}
local success, err = Adapter.open(crashing)
assert(success == false and err:find("test error"))
print("Adapter contract tests passed")
