local component = require(game:GetService('ReplicatedStorage'):FindFirstChild('pkg'):FindFirstChild('component'))

local MyComponent = component.new({
    Tag = "MyComponent",
})

function MyComponent:Construct()
    print("Server component construct")
end

function MyComponent:Start()
    print("Server component start")
end

return MyComponent
