local vide = require("@pkg/vide")

local game = require("@ui/components/game")

local create = vide.create

local function app(): { any }
    return {
        create("ScreenGui") {
            Name = "app",
            ResetOnSpawn = false,
            IgnoreGuiInset = true,

            game(),
        },
    }
end

return app
