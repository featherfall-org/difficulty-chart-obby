local color = require("@ui/utils/color")
local palette = require("@ui/utils/palette")
local rem = require("@ui/composables/rem")
local unwrap = require("@ui/utils/unwrap")
local useButton = require("@ui/composables/use-button")
local vide = require("@pkg/vide")

local create = vide.create

type ButtonProps = useButton.Events & {
    text: string | vide.Source<string>?,
    textSize: number | vide.Source<number>?,
    textColor: Color3 | vide.Source<Color3>?,
    backgroundColor: Color3 | vide.Source<Color3>?,

    anchorPoint: Vector2 | vide.Source<Vector2>?,
    size: UDim2 | vide.Source<UDim2>,
    position: UDim2 | vide.Source<UDim2>?,
}

local function Button(props: ButtonProps)
    local hovered, pressed, buttonEvents = useButton(props)

    local backgroundColor = vide.spring(function()
        local hover = hovered()
        local press = pressed()

        return color.brightness(
            unwrap(props.backgroundColor) or palette.blue,
            if press then -0.15 elseif hover then -0.1 else 0
        )
    end, 0.2)

    local bodyPosition = vide.spring(function()
        return if pressed()
            then UDim2.new(0, 0, 0, rem.use(0.4))
            else UDim2.new()
    end, 0.2)

    return create("TextButton") {
        Text = "",
        BackgroundTransparency = 1,

        AnchorPoint = props.anchorPoint,
        Size = props.size,
        Position = props.position,

        buttonEvents,

        create("Frame") {
            Name = "Body",

            BackgroundColor3 = backgroundColor,
            BorderSizePixel = 0,

            Size = UDim2.new(1, 0, 1, 0),
            Position = bodyPosition,

            create("UICorner") {
                CornerRadius = rem.udim(0, 0.5),
            },

            create("TextLabel") {
                Name = "Text",
                Text = props.Text,
                TextSize = props.TextSize or rem.units(1),
                TextColor3 = props.textColor or palette.white,
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 1, 0),
            },
        },
    }
end

return Button
