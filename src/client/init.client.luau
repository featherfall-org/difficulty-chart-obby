local knit = require("@pkg/knit")
local promise = require("@pkg/typed-promise")

local controllers: Folder = script.controllers
local components: Folder = script.components

local start = promise.new(function()
    knit.AddControllersDeep(controllers)
    knit.AddControllersDeep(components)
    knit.Start()
end)

start
    :andThen(function()
        print("[Client] Successfully bootstrapped.")
    end)
    :catch(warn)
