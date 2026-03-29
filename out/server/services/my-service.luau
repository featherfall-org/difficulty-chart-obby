local knit = require(game:GetService('ReplicatedStorage'):FindFirstChild('pkg'):FindFirstChild('knit'))

local MyService = knit.CreateService({
    Name = "MyService",
    Client = {},
})

function MyService:Init()
    print("Server init")
end

function MyService:Start()
    print("Server start")
end

return MyService
