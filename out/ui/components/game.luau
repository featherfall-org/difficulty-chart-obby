local vide = require(game:GetService('ReplicatedStorage'):FindFirstChild('pkg'):FindFirstChild('vide'))

local button = require(script.Parent:FindFirstChild('button'))
local palette = require(script.Parent.Parent:FindFirstChild('utils'):FindFirstChild('palette'))
local rem = require(script.Parent.Parent:FindFirstChild('composables'):FindFirstChild('rem'))

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
