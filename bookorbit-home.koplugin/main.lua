-- BookOrbit Home: non-invasive Phase 0 shell.
local WidgetContainer = require("ui/widget/container/widgetcontainer")
local UIManager = require("ui/uimanager")
local Menu = require("ui/widget/menu")
local InfoMessage = require("ui/widget/infomessage")
local _ = require("gettext")

local Home = WidgetContainer:extend {
    name = "bookorbit-home",
    is_doc_only = false,
}

function Home:init()
    self.ui.menu:registerToMainMenu(self)
end

function Home:showHome()
    local entries = {
        { text = _("Continue reading"), callback = function()
            UIManager:show(InfoMessage:new{ text = _("BookOrbit adapter not connected yet. This is a Phase 0 UI prototype.") })
        end },
        { text = _("Library"), callback = function()
            UIManager:show(InfoMessage:new{ text = _("Library integration is pending upstream interface validation.") })
        end },
        { text = _("Downloads"), callback = function()
            UIManager:show(InfoMessage:new{ text = _("Downloads will be delegated to the official BookOrbit plugin.") })
        end },
        { text = _("About / Recovery"), callback = function()
            UIManager:show(InfoMessage:new{ text = _("Prototype only. Close this menu to return to standard KOReader. Disable BookOrbit Home in Plugin management to roll back.") })
        end },
    }
    UIManager:show(Menu:new {
        title = _("BookOrbit Home"),
        item_table = entries,
        is_popout = false,
        is_borderless = false,
    })
end

function Home:addToMainMenu(menu_items)
    menu_items.bookorbit_home = {
        text = _("BookOrbit Home (prototype)"),
        sorting_hint = "tools",
        callback = function() self:showHome() end,
    }
end

return Home