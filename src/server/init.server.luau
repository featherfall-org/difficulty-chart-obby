local knit = require("@pkg/knit")
local promise = require("@pkg/typed-promise")

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
