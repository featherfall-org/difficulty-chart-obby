local vide = require(game:GetService('ReplicatedStorage'):FindFirstChild('pkg'):FindFirstChild('vide'))

export type MaybeSource<T> = T | vide.Source<T>

local function unwrap<T>(value: MaybeSource<T>): T
    if type(value) == "function" then
        return value()
    else
        return value
    end
end

return unwrap
