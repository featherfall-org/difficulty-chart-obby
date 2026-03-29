local fluid = require("@pkg/fluid")
local create = fluid.create

local button = require("../components/button")

local function app()
    return create "ScreenGui" {
        IgnoreGuiInset = true,

        button {
            Position = UDim2.fromOffset(50, 50),
            Text = "Click me!",
            Activated = function()
                print("Hello!")
            end,
        },
    }
end

return app
