local knit = require("@pkg/knit")

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
