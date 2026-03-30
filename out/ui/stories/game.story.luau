local vide = require(game:GetService('ReplicatedStorage'):FindFirstChild('pkg'):FindFirstChild('vide'))

local game = require(script.Parent.Parent:FindFirstChild('components'):FindFirstChild('game'))
local unmount = require(script.Parent.Parent:FindFirstChild('control'):FindFirstChild('unmount'))

return function(target: Instance)
    local children = {
        game(),
    }

    vide.apply(target)({ children })

    return function()
        unmount(children)
    end
end
