local oldStructureUnit = StructureUnit
StructureUnit = Class(oldStructureUnit) {
    OnStartBuild = function(self, unitBeingBuilt, order) oldStructureUnit.OnStartBuild(self, unitBeingBuilt, order)
        if unitBeingBuilt:GetUnitId() == self:GetBlueprint().General.UpgradesTo and order == 'Upgrade' then
            self.upgrading = true
        else
            self.upgrading = nil
        end
    end,
    OnStopBeingBuilt = function(self, builder, layer)
        if builder.upgrading then
            self:AddLevels(builder.LevelProgress)
        end
        oldStructureUnit.OnStopBeingBuilt(self, builder, layer)
    end,
    OnFailedToBeBuilt = function(self)
        self.upgrading = nil oldStructureUnit.OnFailedToBeBuilt(self)
    end,
    OnStopBuild = function(self, unitBuilding)
        self.upgrading = nil oldStructureUnit.OnStopBuild(self, unitBuilding)
    end,
}
local oldShieldStructureUnit = ShieldStructureUnit
ShieldStructureUnit = Class(oldShieldStructureUnit) {
    UpgradingState = State(oldShieldStructureUnit.UpgradingState) {
        Main = function(self) oldShieldStructureUnit.UpgradingState.Main(self)
        end,
        OnStopBuild = function(self, unitBuilding)
            if unitBuilding:GetFractionComplete() == 1 then
                unitBuilding:AddLevels(self.LevelProgress)
            end
            oldShieldStructureUnit.UpgradingState.OnStopBuild(self, unitBuilding)
        end,
        OnFailedToBuild = function(self) oldShieldStructureUnit.UpgradingState.OnFailedToBuild(self)
        end,
    }
}
local oldMassCollectionUnit = MassCollectionUnit
MassCollectionUnit = Class(oldMassCollectionUnit) {
    WatchUpgradeConsumption = function(self, massConsumption, massProduction)
        while true do
            if not self:IsPaused() then
                if self:GetResourceConsumed() ~= 1 then
                    local aiBrain = self:GetAIBrain()
                    if aiBrain and aiBrain:GetEconomyStored('ENERGY') <= 1 then
                        self:SetProductionPerSecondMass(massProduction) self:SetConsumptionPerSecondMass(massConsumption)
                    else
                        if self:GetResourceConsumed() ~= 0 then
                            self:SetConsumptionPerSecondMass(massConsumption) self:SetProductionPerSecondMass(massProduction / self:GetResourceConsumed())
                        else
                            self:SetProductionPerSecondMass(0)
                        end
                    end
                else
                    self:SetConsumptionPerSecondMass(massConsumption) self:SetProductionPerSecondMass(massProduction)
                end
            else
                self:SetProductionPerSecondMass(massProduction)
            end
            WaitSeconds(0.2)
        end
    end,
}
local oldRadarUnit = RadarUnit
RadarUnit = Class(oldRadarUnit) {
    UpgradingState = State(oldRadarUnit.UpgradingState) {
        Main = function(self) oldRadarUnit.UpgradingState.Main(self)
        end,
        OnStopBuild = function(self, unitBuilding)
            if unitBuilding:GetFractionComplete() == 1 then
                unitBuilding:AddLevels(self.LevelProgress)
            end
            oldRadarUnit.UpgradingState.OnStopBuild(self, unitBuilding)
        end,
        OnFailedToBuild = function(self) oldRadarUnit.UpgradingState.OnFailedToBuild(self)
        end,
    }
}
local oldSonarUnit = SonarUnit
SonarUnit = Class(oldSonarUnit) {
    UpgradingState = State(oldSonarUnit.UpgradingState) {
        Main = function(self) oldSonarUnit.UpgradingState.Main(self)
        end,
        OnStopBuild = function(self, unitBuilding)
            if unitBuilding:GetFractionComplete() == 1 then
                unitBuilding:AddLevels(self.LevelProgress)
            end
            oldSonarUnit.UpgradingState.OnStopBuild(self, unitBuilding)
        end,
        OnFailedToBuild = function(self) oldSonarUnit.UpgradingState.OnFailedToBuild(self)
        end,
    }
}