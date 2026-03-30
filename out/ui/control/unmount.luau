local vide = require(game:GetService('ReplicatedStorage'):FindFirstChild('pkg'):FindFirstChild('vide'))

local function unmount(children: any)
    local parent = vide.create("Folder")({ children })
    parent:Destroy()
end

return unmount
