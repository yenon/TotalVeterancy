VeteranDefault = {
    Level1 = 25,
    Level2 = 100,
    Level3 = 250,
    Level4 = 500,
    Level5 = 1000,
} function GetConstructEconomyModel(builder, targetData)
    local builder_bp = builder:GetBlueprint()
    local rate = builder:GetBuildRate()
    local time = targetData.BuildTime
    local mass = targetData.BuildCostMass
    local energy = targetData.BuildCostEnergy
    local time_mod = builder.BuildTimeModifier or 0
    time = time * (100 + time_mod) * .01
    if time < .1 then
        time = .1
    end
    local energy_mod = builder.EnergyModifier or 0
    if not targetData.Slot then
        if GameState() == 'game' and (builder.vetToggle or UnitData[builder:GetEntityId()].vetToggle) then
            if UnitData[builder:GetEntityId()].LevelProgress and UnitData[builder:GetEntityId()].LevelProgress > 5 then
                energy_mod = UnitData[builder:GetEntityId()].vetToggle * (UnitData[builder:GetEntityId()].LevelProgress - 1)
            end
        else
            if targetData.vetBuild then
                energy_mod = targetData.vetBuild
            end
        end
    end
    energy = energy * (100 + energy_mod) * .01
    if energy < 0 then
        energy = 0
    end
    local mass_mod = builder.MassModifier or 0
    if not targetData.Slot then
        if GameState() == 'game' and (builder.vetToggle or UnitData[builder:GetEntityId()].vetToggle) then
            if UnitData[builder:GetEntityId()].LevelProgress and UnitData[builder:GetEntityId()].LevelProgress > 5 then
                mass_mod = UnitData[builder:GetEntityId()].vetToggle * (UnitData[builder:GetEntityId()].LevelProgress - 1)
            end
        else
            if targetData.vetBuild then
                mass_mod = targetData.vetBuild
            end
        end
    end
    mass = mass * (100 + mass_mod) * .01
    if mass < 0 then
        mass = 0
    end
    return time / rate, energy, mass
end

function GameState() local result
    local uiStateFunc = rawget(_G, 'GetCurrentUIState')
    if uiStateFunc then
        result = uiStateFunc()
    else
        result = 'sim'
    end
    return result
end
