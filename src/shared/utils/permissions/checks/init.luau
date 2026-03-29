local types = require("./types")

type StringChecks = types.StringChecks

local stringChecks: StringChecks = {
    ["UserId"] = require("@self/user-id"),
}

return stringChecks
