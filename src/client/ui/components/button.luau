local fluid = require("@pkg/fluid")
local create = fluid.create

local function button(props: {
    Position: UDim2,
    Text: string,
    Activated: () -> (),
})
    return create "TextButton" {
        BackgroundColor3 = Color3.fromRGB(50, 50, 50),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Size = UDim2.fromOffset(200, 150),

        Position = props.Position,
        Text = props.Text,
        Activated = props.Activated(),

        create "UICorner" {},
    }
end

return button
