local knit = require("@pkg/knit")

local MyController = knit.CreateController({
    Name = "MyController",
})

function MyController:Init()
    print("Client init")
end

function MyController:Start()
    print("Client start")
end

return MyController
