local oldXRB3301 = XRB3301
XRB3301 = Class(oldXRB3301) {
    OnCreate = function(self) oldXRB3301.OnCreate(self)
        self.MaxVisionRadius = self:GetBlueprint().Intel.MaxVisionRadius
        self.MinVisionRadius = self:GetBlueprint().Intel.MinVisionRadius
    end,
    OnIntelEnabled = function(self) oldXRB3301.OnIntelEnabled(self)
    end,
    OnIntelDisabled = function(self) oldXRB3301.OnIntelDisabled(self)
    end,
    ExpandingVision = State {
        Main = function(self) WaitSeconds(0.1)
            while true do
                if self:GetResourceConsumed() ~= 1 then
                    self.ExpandingVisionEnergyCheck = true self:OnIntelDisabled()
                end
                local curRadius = self:GetIntelRadius('vision')
                local targetRadius = self.MaxVisionRadius
                if curRadius < targetRadius then
                    curRadius = curRadius + 1
                    if curRadius >= targetRadius then
                        self:SetIntelRadius('vision', targetRadius)
                    else
                        self:SetIntelRadius('vision', curRadius)
                    end
                end
                WaitSeconds(0.2)
            end
        end,
    },
    ContractingVision = State {
        Main = function(self)
            while true do
                if self:GetResourceConsumed() == 1 then
                    if self.ExpandingVisionEnergyCheck then
                        self:OnIntelEnabled()
                    else
                        self:OnIntelDisabled()
                        self.ExpandingVisionEnergyCheck = true
                    end
                end
                local curRadius = self:GetIntelRadius('vision')
                local targetRadius = self.MinVisionRadius
                if curRadius > targetRadius then
                    curRadius = curRadius - 1
                    if curRadius <= targetRadius then
                        self:SetIntelRadius('vision', targetRadius)
                    else
                        self:SetIntelRadius('vision', curRadius)
                    end
                end
                WaitSeconds(0.2)
            end
        end,
    },
}
TypeClass = XRB3301