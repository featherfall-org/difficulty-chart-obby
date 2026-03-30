local vide = require("@pkg/vide")

local game = require("@ui/components/game")
local unmount = require("@ui/control/unmount")

return function(target: Instance)
    local children = {
        game(),
    }

    vide.apply(target)({ children })

    return function()
        unmount(children)
    end
end
