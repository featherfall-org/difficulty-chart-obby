local knit = require(script.Parent:FindFirstChild('pkg'):FindFirstChild('knit'))
local promise = require(script.Parent:FindFirstChild('pkg'):FindFirstChild('typed-promise'))

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
