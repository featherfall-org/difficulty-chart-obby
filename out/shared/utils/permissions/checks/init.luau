local types = require(script.Parent:FindFirstChild('types'))

type StringChecks = types.StringChecks

local stringChecks: StringChecks = {
    ["UserId"] = require(script:FindFirstChild('user-id')),
}

return stringChecks
