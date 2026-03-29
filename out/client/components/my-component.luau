local component = require(game:GetService('ReplicatedStorage'):FindFirstChild('pkg'):FindFirstChild('component'))

local MyComponent = component.new({
    Tag = "MyComponent",
})

function MyComponent:Construct()
    print("Client component construct")
end

function MyComponent:Start()
    print("Client component started")
end

return MyComponent
