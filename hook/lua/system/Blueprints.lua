local function hwpe(id, bp)
    if bp.Categories and table.find(bp.Categories, 'ANTITELEPORT') and table.find(bp.Categories, 'COMMAND') and bp.Economy and bp.Economy.BuildCostMass and bp.Economy.BuildCostEnergy and bp.Economy.BuildTime then
        bp.Economy.xpValue = 200
    end
end

local oldModBP = ModBlueprints
function ModBlueprints(all_bps) oldModBP(all_bps)
    local scaling = 0.5
    local evenkills = 1
    local econScaling = 2
    local ACUbaseValue = 1600
    local SCUbaseValue = 6400
    local once = true
    for id, bp in all_bps.Unit do
        if bp.Weapon then
            for k, v in bp.Weapon do
                if type(v) ~= 'table' then
                    LOG('***ERROR.' .. id .. '.has.a.error.in.its.Weapon.table.' .. repr(k) .. repr(v))
                    --TODO: FIX continue
                    continue
                end
                if v.Label ~= 'DeathWeapon' then
                    v.DamageFriendly = false
                    v.CollideFriendly = false
                end
            end
        end
        if bp.Economy.BuildRate > 4 then
            if not bp.Economy.MaxBuildDistance then
                bp.Economy.MaxBuildDistance = 10
            end
        end
        if bp.Defense.RegenRate == nil then
            bp.Defense.RegenRate = 0
        end
        local RegenMod = 0.9 * (50 - 1 / (0.00000060257 * bp.Defense.MaxHealth + 0.020016))
        bp.Defense.RegenRate = bp.Defense.RegenRate + RegenMod hwpe(id, bp)
        if bp.Economy and not bp.Economy.xpBaseValue and bp.Economy.BuildCostMass and bp.Economy.BuildCostEnergy and bp.Economy.BuildTime and table.find(bp.Categories, 'COMMAND') then
            bp.Economy.xpBaseValue = ACUbaseValue
        end
        if bp.Economy and not bp.Economy.xpBaseValue and bp.Economy.BuildCostMass and bp.Economy.BuildCostEnergy and bp.Economy.BuildTime and table.find(bp.Categories, 'SUBCOMMANDER') then
            bp.Economy.xpBaseValue = SCUbaseValue
        end
        if table.find(bp.Categories, 'SUBCOMMANDER') then
            bp.Economy.MaintenanceConsumptionPerSecondMass = nil
            bp.Economy.MaintenanceConsumptionPerSecondEnergy = nil
        end
        if bp.Economy and not bp.Economy.xpValue and bp.Economy.BuildCostMass and bp.Economy.BuildCostEnergy and bp.Economy.BuildTime and (not table.find(bp.Categories, 'UNTARGETABLE') or bp.Economy.xpBaseValue or table.find(bp.Categories, 'PROJECTILE')) then
            bp.Economy.xpValue = math.pow((bp.Economy.xpBaseValue or (bp.Economy.BuildCostMass + bp.Economy.BuildCostEnergy * 0.1 + bp.Economy.BuildTime * 0.04)), scaling)
        end
        if bp.Economy and not bp.Economy.XPperLevel and bp.Economy.xpValue then
            bp.Economy.XPperLevel = bp.Economy.xpValue * evenkills
        end
        if id == 'uea0001' or id == 'uea0003' then
            table.insert(bp.Economy.BuildableCategory, 'BUILTBYTIER2COMMANDER UEF') table.insert(bp.Economy.BuildableCategory, 'BUILTBYTIER3COMMANDER UEF') table.insert(bp.Categories, 'SHOWQUEUE')
        end
        if table.find(bp.Categories, 'CONSTRUCTION') and table.find(bp.Categories, 'ENGINEER') and table.find(bp.Categories, 'REPAIR') and table.find(bp.Categories, 'RECLAIM') and table.find(bp.Categories, 'ASSIST') and not table.find(bp.Categories, 'SHOWQUEUE') then
            table.insert(bp.Categories, 'SHOWQUEUE')
        end
        if bp.Economy.ProductionPerSecondMass and not bp.Economy.StorageMass then
            bp.Economy.StorageMass = bp.Economy.ProductionPerSecondMass * 65
        end
        if bp.Economy.ProductionPerSecondEnergy and not bp.Economy.StorageEnergy then
            bp.Economy.StorageEnergy = bp.Economy.ProductionPerSecondEnergy * 10
        end
        if bp.Categories and table.find(bp.Categories, 'STRUCTURE') and (table.find(bp.Categories, 'MASSEXTRACTION') or table.find(bp.Categories, 'MASSFABRICATION') or table.find(bp.Categories, 'MASSPRODUCTION')) and not bp.Economy.xpTimeStep and not table.find(bp.Categories, 'UNTARGETABLE') then
            bp.Economy.xpTimeStep = math.random(99, 119)
            bp.Economy.xpValue = bp.Economy.xpValue * econScaling
        end
        if bp.Categories and table.find(bp.Categories, 'STRUCTURE') and table.find(bp.Categories, 'ENERGYPRODUCTION') and not bp.Economy.xpTimeStep and not table.find(bp.Categories, 'UNTARGETABLE') then
            bp.Economy.xpTimeStep = math.random(98, 118)
            bp.Economy.xpValue = bp.Economy.xpValue * econScaling
        end
        if bp.Categories and (table.find(bp.Categories, 'STRUCTURE') and table.find(bp.Categories, 'ENERGYSTORAGE') or table.find(bp.Categories, 'MASSSTORAGE')) and not bp.Economy.xpTimeStep and not table.find(bp.Categories, 'UNTARGETABLE') then
            bp.Economy.xpTimeStep = math.random(94, 114)
            bp.Economy.xpValue = bp.Economy.xpValue * econScaling
        end
        if bp.Categories and table.find(bp.Categories, 'INTELLIGENCE') and (table.find(bp.Categories, 'STRUCTURE') or table.find(bp.Categories, 'MOBILESONAR')) and not bp.Economy.xpTimeStep and not table.find(bp.Categories, 'UNTARGETABLE') then
            bp.Economy.xpTimeStep = math.random(101, 121)
            bp.Economy.xpValue = bp.Economy.xpValue * econScaling
        end
        if bp.Categories and table.find(bp.Categories, 'STRUCTURE') and table.find(bp.Categories, 'SHIELD') and not bp.Economy.xpTimeStep and not table.find(bp.Categories, 'UNTARGETABLE') then
            bp.Economy.xpTimeStep = math.random(100, 120)
            bp.Economy.xpValue = bp.Economy.xpValue * econScaling
        end
        if bp.Categories and bp.Economy and (table.find(bp.Categories, 'CONSTRUCTION') or table.find(bp.Categories, 'ENGINEER') or table.find(bp.Categories, 'FACTORY') or table.find(bp.Categories, 'SILO') or bp.General.UpgradesTo) and not table.find(bp.Categories, 'UNTARGETABLE') then
            bp.Economy.BuildXPLevelpSecond = 1
        end
    end
end