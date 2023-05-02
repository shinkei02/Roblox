function infiniteRange()
    local base = game.Workspace._BASES.player.base.fake_unit.HumanoidRootPart.CFrame
    local player = game.Players.LocalPlayer.Name
    local Unit = game.Workspace._UNITS
    local distanceTable = {}

    local function getDistance(toCheck)
        table.clear(distanceTable)
        if Unit:getChildren()[1] then
            for i, v in pairs(Unit:getChildren()) do
                if v:WaitForChild("_stats"):FindFirstChild("base") then
                    if tostring(v._stats.base.Value) == "pve" then
                        distance = tostring((base.Position - v.HumanoidRootPart.CFrame.Position).Magnitude)
                        table.insert(distanceTable, tonumber(distance))
                        table.sort(distanceTable)
                        if tonumber(distance) == distanceTable[1] then
                            enemy = v.HumanoidRootPart.CFrame
                        end
                    end
                end
            end
        end
        return enemy
    end

    local function followEnemy()
        if Unit:getChildren()[1] then
            for i, v in pairs(Unit:getChildren()) do
                if v:WaitForChild("_stats"):FindFirstChild("player") then
                    if tostring(v._stats.player.Value) == player then
                        local success, err = pcall(function()
                            if tostring(v._stats.uuid.Value) == "{70b72644-3c11-4fd5-b642-72ca309df72d}" then
                                if tostring(v._stats.upgrade.Value) > "7" then
                                    v.HumanoidRootPart.CFrame = getDistance("enemyName")
                                end
                            end
                        end)
                        if err then
                            return
                        end
                    end
                end
            end
        end
    end
    while task.wait() do
        if Settings.escanorIR then
            followEnemy()
        end
    end
end

infiniteRange()
