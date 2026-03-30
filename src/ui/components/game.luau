local vide = require("@pkg/vide")

local button = require("./button")
local palette = require("@ui/utils/palette")
local rem = require("@ui/composables/rem")

local create = vide.create

local function game(): { any }
    return create("Frame") {
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),

        AnchorPoint = Vector2.new(0.5, 0.5),

        button {
            onClick = function()
                print("Button clicked!")
            end,
            text = "Example button",
            backgroundColor = palette.white,
            size = rem.udim2(0, 6, 0, 3),
        },
    }
end

return game
