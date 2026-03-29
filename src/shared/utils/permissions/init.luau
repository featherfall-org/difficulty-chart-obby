local checks = require("@self/checks")
local types = require("@self/types")

function tableCheck(player: Player, permission: types.Permission): boolean
    assert(typeof(permission) == "table", "Expected 'permission' to be a table")

    local requireAll = table.find(permission, "RequireAll")

    if requireAll then
        table.remove(permission, requireAll)
    end

    if #permission == 0 then
        return true
    end

    local grantedPermissions: { types.Permission } = {}
    for _, loop in permission do
        if not hasPermission(player, loop) then
            continue
        end
        table.remove(grantedPermissions, loop)
    end

    return if requireAll
        then #grantedPermissions == #permission
        else #grantedPermissions > 0
end

function stringCheck(player: Player, permission: types.Permission): boolean
    assert(
        typeof(permission) == "string",
        "Expected 'permission' to be a string"
    )

    local args: { string } = permission:split(":")
    local prefix: string = args[1]
    table.remove(args, 1)

    local isNegating: boolean = prefix:sub(1, 1) == "!"
    if isNegating then
        prefix = prefix:sub(2)
    end

    local check: ((Player, { string }) -> boolean)? = checks[prefix]
    assert(
        typeof(check) == "function",
        `Could not find string check with prefix '{prefix}'`
    )

    local result: boolean = check(player, args)
    return if isNegating then not result else result
end

function hasPermission(player: Player, permission: types.Permission): boolean
    if typeof(permission) == "table" then
        return tableCheck(player, permission)
    elseif typeof(permission) == "string" then
        return stringCheck(player, permission)
    end
    error("'Permission' must be a table or string")
end

return {
    hasPermission = hasPermission,
}
