local vide = require(game:GetService('ReplicatedStorage'):FindFirstChild('pkg'):FindFirstChild('vide'))

local game = require(script.Parent:FindFirstChild('game'))

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
