local knit = require(game:GetService('ReplicatedStorage'):FindFirstChild('pkg'):FindFirstChild('knit'))
local promise = require(game:GetService('ReplicatedStorage'):FindFirstChild('pkg'):FindFirstChild('typed-promise'))

local services: Folder = script.services
local components: Folder = script.components

local start = promise.new(function()
    knit.AddServicesDeep(services)
    knit.AddServicesDeep(components)
    knit.Start()
end)

start
    :andThen(function()
        print("[Server] Successfully bootstrapped.")
    end)
    :catch(warn)
