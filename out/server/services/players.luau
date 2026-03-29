local Players = game:GetService("Players")

local players = {}

function players.handle_player_added(self: self, player: Player)
    player:AddTag(self.cs_tag)
end

function players.init(self: self)
    self.cs_tag = "Player"
end

function players.start(self: self)
    Players.PlayerAdded:Connect(function(player)
        self:handle_player_added(player)
    end)
end

export type self = typeof(players)
return players
