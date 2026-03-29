local components = require("@pkg/quill_rblx_components")

local Lava = {}
local lava_mt = { __index = Lava }

type LavaProperties = {
    damage: number,
    instance: BasePart,
    connections: { RBXScriptConnection },
}
export type Lava = setmetatable<LavaProperties, typeof(lava_mt)>

function Lava.init(self: Lava)
    table.insert(
        self.connections,
        self.instance.Touched:Connect(function(part: BasePart)
            local humanoid: Humanoid
            local chr: Model & { Humanoid: Humanoid } =
                part.Parent :: Model & { Humanoid: Humanoid }
            if chr:FindFirstChild("Humanoid") then
                humanoid = chr.Humanoid
            end
            self:deal_damage(humanoid)
        end)
    )
end

function Lava.deal_damage(self: Lava, humanoid: Humanoid)
    humanoid:TakeDamage(self.damage)
end

function Lava.destroy(self: Lava)
    for _, connection in self.connections do
        connection:Disconnect()
    end
end

local LavaComponent = {}
LavaComponent.info = components.info {
    attributes = {
        default_state = components.attribute("number", 100),
    },
    is = components.singleton("BasePart"),
    tag = components.singleton("Lava"),
}
type LavaData = components.CreationData<typeof(LavaComponent.info)>

function LavaComponent.new(self: self, data: LavaData): Lava
    local lava = {
        damage = data.attributes.default_state,
        instance = data.instance,
        connections = {},
    }
    return setmetatable(lava, lava_mt)
end

export type self = typeof(LavaComponent)
return LavaComponent
