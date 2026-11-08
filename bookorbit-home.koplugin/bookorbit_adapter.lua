-- Delegates only to a verified live BookOrbit instance.
-- Discovery of that instance is deliberately deferred until KOReader's
-- plugin registry/lifecycle has been verified.
local Adapter = {}
function Adapter.isCompatible(instance)
    return type(instance) == "table"
       and instance.name == "bookorbit"
       and type(instance.browseCatalog) == "function"
end
function Adapter.open(instance, prefer_cached)
    if not Adapter.isCompatible(instance) then
        return false, "BookOrbit plugin is unavailable or incompatible"
    end
    local ok, err = pcall(instance.browseCatalog, instance, prefer_cached == true)
    if not ok then return false, tostring(err) end
    return true
end
return Adapter
