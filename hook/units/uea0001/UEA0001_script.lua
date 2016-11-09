local TConstructionUnit = import('/lua/terranunits.lua').TConstructionUnit
oldUEA0001 = UEA0001
UEA0001 = Class(oldUEA0001) {
    OnStopBuild = function(self, unitBeingBuilt)
        TConstructionUnit.OnStopBuild(self, unitBeingBuilt)
        if self.LevelProgress and self.LevelProgress > 6 then
            self:RemoveBuildRestriction(categories.TECH1)
            if self.LevelProgress > 11 then
                self:RemoveBuildRestriction(categories.TECH2 - categories.ECONOMIC * categories.TECH2)
                if self.LevelProgress > 21 then
                    self:RemoveBuildRestriction(categories.TECH2)
                    if self.LevelProgress > 31 then
                        self:RemoveBuildRestriction(categories.TECH3 - categories.STRATEGIC * categories.TECH3)
                        if self.LevelProgress > 41 then
                            self:RemoveBuildRestriction(categories.TECH3)
                            if self.LevelProgress > 51 then
                                self:RemoveBuildRestriction(categories.EXPERIMENTAL - categories.STRATEGIC * categories.EXPERIMENTAL - categories.ORBITALSYSTEM)
                                if self.LevelProgress > 61 then
                                    self:RemoveBuildRestriction(categories.EXPERIMENTAL)
                                end
                            end
                        end
                    end
                end
            end
        end
    end,
}
TypeClass = UEA0001