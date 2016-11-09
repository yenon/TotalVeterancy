local UIUtil = import('/lua/ui/uiutil.lua')
local LayoutHelpers = import('/lua/maui/layouthelpers.lua')
local Group = import('/lua/maui/group.lua').Group
local Bitmap = import('/lua/maui/bitmap.lua').Bitmap
local GameCommon = import('/lua/ui/game/gamecommon.lua')
local ItemList = import('/lua/maui/itemlist.lua').ItemList
local Prefs = import('/lua/user/prefs.lua')
local UnitDescriptions = import('/lua/ui/help/unitdescription.lua').Description
View = false
ViewState = "full"
MapView = false
local enhancementSlotNames = {
    back = "<LOC uvd_0007>Back",
    lch = "<LOC uvd_0008>LCH",
    rch = "<LOC uvd_0009>RCH",
} function ShowEnhancement(bp, bpID, iconID, iconPrefix, userUnit)
    if CheckFormat() then
        View.UnitImg:SetTexture(UIUtil.UIFile(iconPrefix .. '_btn_up.dds')) LayoutHelpers.AtTopIn(View.UnitShortDesc, View, 10) View.UnitShortDesc:SetFont(UIUtil.bodyFont, 14)
        local slotName = enhancementSlotNames[string.lower(bp.Slot)]
        slotName = slotName or bp.Slot
        local lmult = 0
        local energyvalue = 0
        local massvalue = 0
        local buffmass = 0
        local buffenergy = 0
        if bp.Name ~= nil then
            View.UnitShortDesc:SetText(LOCF("%s: %s", bp.Name, slotName))
        else
            View.UnitShortDesc:SetText(LOC(slotName))
        end
        if View.UnitShortDesc:GetStringAdvance(View.UnitShortDesc:GetText()) > View.UnitShortDesc.Width() then
            LayoutHelpers.AtTopIn(View.UnitShortDesc, View, 14)
            View.UnitShortDesc:SetFont(UIUtil.bodyFont, 10)
        end
        local showecon = true
        local showAbilities = false
        local showUpKeep = false local time, energy, mass
        if bp.Icon ~= nil and not string.find(bp.Name, 'Remove') then
            time, energy, mass = import('/lua/game.lua').GetConstructEconomyModel(userUnit, bp)
            time = math.max(time, 1)
            showUpKeep = DisplayResources(bp, time, energy, mass)
            View.TimeStat.Value:SetFont(UIUtil.bodyFont, 14)
            View.TimeStat.Value:SetText(string.format("%s", FormatTime(time)))
            if string.len(View.TimeStat.Value:GetText()) > 5 then
                View.TimeStat.Value:SetFont(UIUtil.bodyFont, 10)
            end
        else
            showecon = false
            if View.Description then
                View.Description:Hide()
                for i, v in View.Description.Value do
                    v:SetText("")
                end
            end
        end
        if View.Description then
            local tempDescID = bpID .. "-" .. iconID
            if UnitDescriptions[tempDescID] and not string.find(bp.Name, 'Remove') then
                local tempDesc = LOC(UnitDescriptions[tempDescID])
                WrapAndPlaceText(nil, tempDesc, View.Description)
            else
                WARN('No description found for unit: ', bpID, ' enhancement: ', iconID)
                View.Description:Hide()
                for i, v in View.Description.Value do
                    v:SetText("")
                end
            end
        end
        local lp = math.floor(UnitData[userUnit:GetEntityId()].LevelProgress)
        if lp and lp > 0 then
            lmult = math.floor(lp - 1)
        end
        local showShield = false
        if bp.ShieldMaxHealth then
            showShield = true
            local bshp = bp.ShieldMaxHealth
            local shp = 0
            shp = math.floor((Buffs.VeterancyShield.Affects.ShieldHP.Mult - 1) * lmult * bshp) + bshp
            View.ShieldStat.Value:SetText(shp)
        end
        if showUpKeep then
            energyvalue = tonumber(View.UpkeepGroup.EnergyValue:GetText())
            massvalue = tonumber(View.UpkeepGroup.MassValue:GetText())
            buffmass = Buffs.VeterancyResourceProduction.Affects.MassProductionBuf.Mult
            buffenergy = Buffs.VeterancyResourceProduction.Affects.EnergyProductionBuf.Mult
            if energyvalue > 0 then
                local ben = energyvalue
                energyvalue = math.floor((buffenergy - 1) * lmult * ben) + ben
                View.UpkeepGroup.EnergyValue:SetText(string.format("%d", energyvalue))
            end
            if massvalue > 0 then
                local bma = massvalue
                massvalue = math.floor((buffmass - 1) * lmult * bma) + bma
                View.UpkeepGroup.MassValue:SetText(string.format("%d", massvalue))
            end
        end
        ShowView(showUpKeep, true, showecon, showShield)
        if time == 0 and energy == 0 and mass == 0 then
            View.BuildCostGroup:Hide()
            View.TimeStat:Hide()
        end
    else
        Hide()
    end
end

function Show(bp, buildingUnit, bpID)
    if CheckFormat() then
        if false then
            local foo, iconName = GameCommon.GetCachedUnitIconFileNames(bp)
            if iconName then
                View.UnitIcon:SetTexture(iconName)
            else
                View.UnitIcon:SetTexture(UIUtil.UIFile('/icons/units/default_icon.dds'))
            end
        end
        LayoutHelpers.AtTopIn(View.UnitShortDesc, View, 10)
        View.UnitShortDesc:SetFont(UIUtil.bodyFont, 14)
        local description = LOC(bp.Description)
        if GetTechLevelString(bp) then
            description = LOCF('Tech %d %s', GetTechLevelString(bp), description)
        end
        if bp.General.UnitName ~= nil then
            View.UnitShortDesc:SetText(LOCF("%s: %s", bp.General.UnitName, description))
        else
            View.UnitShortDesc:SetText(LOCF("%s", description))
        end
        if View.UnitShortDesc:GetStringAdvance(View.UnitShortDesc:GetText()) > View.UnitShortDesc.Width() then
            LayoutHelpers.AtTopIn(View.UnitShortDesc, View, 14)
            View.UnitShortDesc:SetFont(UIUtil.bodyFont, 10)
        end
        local showecon = true
        local showUpKeep = false
        local showAbilities = false
        local lmult = 0
        local energyvalue = 0
        local massvalue = 0
        local buffmass = 0
        local buffenergy = 0
        if buildingUnit ~= nil then
            local time, energy, mass = import('/lua/game.lua').GetConstructEconomyModel(buildingUnit, bp.Economy)
            time = math.max(time, 1)
            showUpKeep = DisplayResources(bp, time, energy, mass)
            View.TimeStat.Value:SetFont(UIUtil.bodyFont, 14)
            View.TimeStat.Value:SetText(string.format("%s", FormatTime(time)))
            if string.len(View.TimeStat.Value:GetText()) > 5 then
                View.TimeStat.Value:SetFont(UIUtil.bodyFont, 10)
            end
            local vT = UnitData[buildingUnit:GetEntityId()].vetToggle
            local lp = math.floor(UnitData[buildingUnit:GetEntityId()].LevelProgress)
            if lp and lp > 0 and vT and vT > 0 then
                lmult = math.floor(vT * lp * .05)
            end
        else
            showecon = false
        end
        local bhp = bp.Defense.MaxHealth
        local hp = 0
        hp = math.floor((Buffs.VeterancyHealthRegen.Affects.MaxHealth.Mult - 1) * lmult * bhp) + bhp
        View.HealthStat.Value:SetText(string.format("%d", hp))
        if View.Description then
            WrapAndPlaceText(bp.Display.Abilities, LOC(UnitDescriptions[bpID]), View.Description)
        end
        local showShield = false
        if bp.Defense.Shield and bp.Defense.Shield.ShieldMaxHealth then
            showShield = true
            local bshp = bp.Defense.Shield.ShieldMaxHealth
            local shp = 0
            shp = math.floor((Buffs.VeterancyShield.Affects.ShieldHP.Mult - 1) * lmult * bshp) + bshp
            View.ShieldStat.Value:SetText(math.floor(shp))
        end
        if showUpKeep then
            energyvalue = tonumber(View.UpkeepGroup.EnergyValue:GetText())
            massvalue = tonumber(View.UpkeepGroup.MassValue:GetText())
            buffmass = Buffs.VeterancyResourceProduction.Affects.MassProductionBuf.Mult
            buffenergy = Buffs.VeterancyResourceProduction.Affects.EnergyProductionBuf.Mult
            if not (bp.Economy.ProductionPerSecondEnergy or bp.Economy.ProductionPerSecondMass) then
                buffmass = Buffs.VeterancyStorageBuff.Affects.MassStorageBuf.Mult
                buffenergy = Buffs.VeterancyStorageBuff.Affects.EnergyStorageBuf.Mult
            end
            if energyvalue > 0 then
                local ben = energyvalue
                energyvalue = math.floor((buffenergy - 1) * lmult * ben) + ben
                View.UpkeepGroup.EnergyValue:SetText(string.format("%d", energyvalue))
            end
            if massvalue > 0 then
                local bma = massvalue
                massvalue = math.floor((buffmass - 1) * lmult * bma) + bma
                View.UpkeepGroup.MassValue:SetText(string.format("%d", massvalue))
            end
        end
        local iconName = GameCommon.GetCachedUnitIconFileNames(bp)
        View.UnitImg:SetTexture(iconName)
        View.UnitImg.Height:Set(46)
        View.UnitImg.Width:Set(48)
        ShowView(showUpKeep, false, showecon, showShield)
    else
        Hide()
    end
end