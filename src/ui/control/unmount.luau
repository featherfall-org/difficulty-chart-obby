local vide = require("@pkg/vide")

local function unmount(children: any)
    local parent = vide.create("Folder")({ children })
    parent:Destroy()
end

return unmount
