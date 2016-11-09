Callbacks.ToggleMEStorage = function(data)
    if OkayToMessWithArmy(data.owner) and data.owner ~= -1 then
        local brain = ArmyBrains[data.owner]
        if brain.ME ~= "Energy" then
            brain.ME = "Energy"
            if brain.StorageEnergyTotal ~= nil then
                brain:GiveStorage("ENERGY", brain.StorageEnergyTotal)
            end
        else
            brain.ME = "Mass"
            if brain.StorageMassTotal ~= nil then
                brain:GiveStorage("MASS", brain.StorageMassTotal)
            end
        end
        PrintText(brain.ME .. ' Storage Buff set!', 18, 'ffbfbfbf', 4, 'center', data.owner)
    end
end

local buffed = 0
Callbacks.BuffAIs = function(data)
    if data.owner ~= -1 then
        local hum = 0
        for k, v in ArmyBrains do
            if v.BrainType == 'Human' then
                hum = hum + 1
            end
        end
        if hum == 1 then
            for k, v in ArmyBrains do
                if v.BrainType == 'AI' then
                    local units = v:GetListOfUnits(categories.MOBILE - categories.AIR - categories.UNSELECTABLE - categories.UNTARGETABLE - categories.INSIGNIFICANTUNIT, false)
                    if table.getn(units) > 0 then
                        for i, unit in units do
                            unit:AddLevels(1)
                        end
                    end
                end
            end
            buffed = buffed + 1 PrintText('Increased Land AI Levels by ' .. buffed .. '!', 18, 'ffbfbfbf', 4, 'center')
        end
    end
end

local buffedDef = 0
Callbacks.BuffButtonDef = function(data)
    if data.owner ~= -1 then
        local hum = 0
        for k, v in ArmyBrains do
            if v.BrainType == 'Human' then
                hum = hum + 1
            end
        end
        if hum == 1 then
            for k, v in ArmyBrains do
                if v.BrainType == 'AI' then
                    local units = v:GetListOfUnits(categories.STRUCTURE * categories.DEFENSE + categories.FACTORY - categories.UNSELECTABLE - categories.UNTARGETABLE - categories.INSIGNIFICANTUNIT, false)
                    if table.getn(units) > 0 then
                        for i, unit in units do
                            unit:AddLevels(1)
                        end
                    end
                end
            end
            buffedDef = buffedDef + 1 PrintText('Increased AI defense Levels by ' .. buffedDef .. '!', 18, 'ffbfbfbf', 4, 'center')
        end
    end
end

local bBBase = 0
Callbacks.bBBase = function(data)
    if data.owner ~= -1 then
        local hum = 0
        for k, v in ArmyBrains do
            if v.BrainType == 'Human' then
                hum = hum + 1
            end
        end
        if hum == 1 then
            for k, v in ArmyBrains do
                if v.BrainType == 'AI' then
                    local units = v:GetListOfUnits(categories.STRUCTURE - categories.UNSELECTABLE - categories.UNTARGETABLE - categories.INSIGNIFICANTUNIT, false)
                    if table.getn(units) > 0 then
                        for i, unit in units do
                            unit:AddLevels(1)
                        end
                    end
                end
            end
            bBBase = bBBase + 1 PrintText('Increased AI Base Levels by ' .. bBBase .. '!', 18, 'ffbfbfbf', 4, 'center')
        end
    end
end

Callbacks.ToggleVeteranBuilding2 = function(data)
    if OkayToMessWithArmy(data.owner) and data.owner ~= -1 then
        local selectedBuilders = {}
        local i = 1
        for k, v in data.units do
            selectedBuilders[i] = GetUnitById(v)
            i = i + 1
        end
        if table.getsize(selectedBuilders) > 0 then
            if selectedBuilders[1].vetToggle ~= 4 then
                for k, v in selectedBuilders do
                    v.vetToggle = 4
                    v.Sync.vetToggle = 4
                end
            else
                for k, v in selectedBuilders do
                    v.vetToggle = 0
                    v.Sync.vetToggle = 0
                end
            end
        end
    end
end

local buffedSea = 0
Callbacks.BuffAIsSea = function(data)
    if data.owner ~= -1 then
        local hum = 0
        for k, v in ArmyBrains do
            if v.BrainType == 'Human' then
                hum = hum + 1
            end
        end
        if hum == 1 then
            for k, v in ArmyBrains do
                if v.BrainType == 'AI' then
                    local units = v:GetListOfUnits(categories.NAVAL - categories.AIR - categories.UNSELECTABLE - categories.UNTARGETABLE - categories.INSIGNIFICANTUNIT, false)
                    if table.getn(units) > 0 then
                        for i, unit in units do
                            unit:AddLevels(1)
                        end
                    end
                end
            end
            buffedSea = buffedSea + 1 PrintText('Increased Naval AI Levels by ' .. buffedSea .. '!', 18, 'ffbfbfbf', 4, 'center')
        end
    end
end

local buffedAir = 0
Callbacks.BuffAIsAir = function(data)
    if data.owner ~= -1 then
        local hum = 0
        for k, v in ArmyBrains do
            if v.BrainType == 'Human' then
                hum = hum + 1
            end
        end
        if hum == 1 then
            for k, v in ArmyBrains do
                if v.BrainType == 'AI' then
                    local units = v:GetListOfUnits(categories.AIR - categories.UNSELECTABLE - categories.UNTARGETABLE - categories.INSIGNIFICANTUNIT, false)
                    if table.getn(units) > 0 then
                        for i, unit in units do
                            unit:AddLevels(1)
                        end
                    end
                end
            end
            buffedAir = buffedAir + 1 PrintText('Increased Air AI Levels by ' .. buffedAir .. '!', 18, 'ffbfbfbf', 4, 'center')
        end
    end
end

Callbacks.BuildXPEnabled = function(data)
    if data.owner ~= -1 then
        local hum = 0
        for k, v in ArmyBrains do
            if v.BrainType == 'Human' then
                hum = hum + 1
            end
        end
        if hum == 1 then
            for k, v in ArmyBrains do
                local units = v:GetListOfUnits(categories.CONSTRUCTION + categories.ENGINEER + categories.ENGINEER + categories.FACTORY + categories.SILO - categories.UNSELECTABLE - categories.UNTARGETABLE - categories.INSIGNIFICANTUNIT, false)
                if table.getn(units) > 0 then
                    for i, unit in units do
                        unit:GetBlueprint().Economy.BuildXPLevelpSecond = data.enabled
                    end
                end
            end
            if data.enabled ~= 0 then
                PrintText('BuildXP Enabled!', 18, 'ffbfbfbf', 4, 'center')
            else
                PrintText('BuildXP Disabled!', 18, 'ffbfbfbf', 4, 'center')
            end
        end
    end
end

Callbacks.ShareXPEnabled = function(data)
    if data.owner ~= -1 then
        local hum = 0
        for k, v in ArmyBrains do
            if v.BrainType == 'Human' then
                hum = hum + 1
            end
        end
        if hum == 1 then
            ScenarioInfo.ShareEXP = data.enabled
            if ScenarioInfo.ShareEXP ~= false then
                PrintText('ShareXP Set!', 18, 'ffbfbfbf', 4, 'center')
            else
                PrintText('ShareXP disabled!', 18, 'ffbfbfbf', 4, 'center')
            end
            LOG('***ShareXP state ' .. tostring(ScenarioInfo.ShareEXP))
        end
    end
end
Callbacks.AIVetBuildEnabled = function(data)
    if data.owner ~= -1 then
        local hum = 0
        for k, v in ArmyBrains do
            if v.BrainType == 'Human' then
                hum = hum + 1
            end
        end
        if hum == 1 then
            for k, v in ArmyBrains do
                if v.BrainType ~= 'Human' then
                    local units = v:GetListOfUnits(categories.CONSTRUCTION + categories.ENGINEER + categories.ENGINEER + categories.FACTORY + categories.SILO - categories.UNSELECTABLE - categories.UNTARGETABLE - categories.INSIGNIFICANTUNIT, false)
                    if table.getn(units) > 0 then
                        for i, unit in units do
                            unit.vetToggle = data.enabled
                        end
                    end
                end
            end
            if data.enabled ~= 0 then
                ScenarioInfo.AItoggle = true PrintText('AI Veteranbuilding Enabled!', 18, 'ffbfbfbf', 4, 'center')
            else
                ScenarioInfo.AItoggle = false PrintText('AI Veteranbuilding Disabled!', 18, 'ffbfbfbf', 4, 'center')
            end
        end
    end
end
Callbacks.ToggleBalance = function(data)
    if data.owner ~= -1 then
        local hum = 0
        for k, v in ArmyBrains do
            if v.BrainType == 'Human' then
                hum = hum + 1
            end
        end
        if hum == 1 then
            ScenarioInfo.ALLies = data.ToggleBalance
            if ScenarioInfo.ALLies ~= false then
                PrintText('Singleplayer Balance Set!', 18, 'ffbfbfbf', 4, 'center')
                Sync.UnitData.ALLies = true
            else
                PrintText('Multiplayer Balance Set!', 18, 'ffbfbfbf', 4, 'center')
                Sync.UnitData.ALLies = false
            end
            LOG('*** SP Balance set ' .. tostring(ScenarioInfo.ALLies))
        end
    end
end
Callbacks.jumpinjack = function(data)
    if OkayToMessWithArmy(data.owner) and data.owner ~= -1 then
        local selectedJumpers = {}
        local i = 1
        for k, v in data.units do
            selectedJumpers[i] = GetUnitById(v)
            i = i + 1
        end
        local ts = table.getsize(selectedJumpers)
        if ts > 0 then
            local x0, z0 = 0, 0
            local x1, z1 = GetMapSize()
            if ScenarioInfo.MapData.PlayableRect then
                x0, z0, x1, z1 = unpack(ScenarioInfo.MapData.PlayableRect)
            end
            x1, z1 = x1 - 2, z1 - 2
            local t, rn, zq = math.pow(ts, .5), 0, 0
            for i, n in selectedJumpers do
                local tx, ty, tz = unpack(data.jumpto)
                if data.formation == true then
                    local dx, dy, dz = unpack(VDiff(selectedJumpers[1]:GetPosition(), selectedJumpers[i]:GetPosition()))
                    if tx - dx > x1 then
                        dx = 0
                    end
                    if tx - dx < x0 then
                        dx = 0
                    end
                    if tz - dz > z1 then
                        dz = 0
                    end
                    if tz - dz < z0 then
                        dz = 0
                    end
                    tx, ty, tz = tx - dx, ty - dy, tz - dz
                else
                    tx, tz = tx + rn, tz + zq
                    local s = 2.5
                    rn = rn + s
                    if rn > s * t - s then
                        rn, zq = 0, zq + s
                    end
                end
                if tx > x1 then
                    tx = x1
                end
                if tx < x0 then
                    tx = x0
                end
                if tz > z1 then
                    tz = z1
                end
                if tz < z0 then
                    tz = z0
                end
                IssueClearCommands({ selectedJumpers[i] })
                if data.range == 'danceofdeath' then
                    selectedJumpers[i]:DanceofDeath({ tx, ty, tz }, data.height, data.range)
                else
                    if data.range == 'howlingfury' then
                        selectedJumpers[i]:HowlingFury({ tx, ty, tz }, data.height, data.range)
                    else
                        selectedJumpers[i]:JumpingJackApeshit({ tx, ty, tz }, data.height, data.range)
                    end
                end
            end
        end
    end

    Callbacks.rangerings = function(data)
        if OkayToMessWithArmy(data.owner) and data.owner ~= -1 then
            if GetFocusArmy() ~= data.owner then
                return
            end
            local selectedJumpers = {}
            local i = 1
            local color = 'FFFFFFFF'
            for k, v in data.units do
                selectedJumpers[i] = GetUnitById(v)
                i = i + 1
            end
            local ts = table.getsize(selectedJumpers)
            if ts > 0 then
                local range = 140
                if ScenarioInfo.ALLies == false then
                    range = 50
                end
                if data.range == 'longrange' then
                    range = 140
                    color = 'FFFF0000'
                end
                local function Rings(self)
                    for
                    n = 1, 100 do
                        if not self or self:IsDead() then
                            return
                        end
                        DrawCircle(self:GetPosition(), range, color) WaitSeconds(.1)
                    end
                    self.rings:Destroy()
                    self.rings = nil
                end

                local ts = table.getsize(selectedJumpers)
                if ts > 0 then
                    for
                    m = 1, ts do
                        if not selectedJumpers[m] or selectedJumpers[m]:IsDead() then
                            --TODO: Fix continue
                            continue
                        end
                        if not selectedJumpers[m].rings then
                            selectedJumpers[m].rings = ForkThread(Rings, selectedJumpers[m])
                        end
                    end
                end
            end
        end
    end
end
