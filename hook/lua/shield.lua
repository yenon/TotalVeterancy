local oldShield = Shield
Shield = Class(oldShield) {
    InitBuffValues = function(self, spec)
        self.spec = spec
        spec.Owner.Sync.ShieldMaxHp = spec.ShieldMaxHealth
        spec.Owner.Sync.ShieldRegen = spec.ShieldRegenRate
    end,
    OnCreate = function(self, spec) self:InitBuffValues(spec) oldShield.OnCreate(self, spec)
        if EntityCategoryContains(categories.MOBILE * categories.SHIELD * categories.DEFENSE + categories.STRUCTURE - categories.UNSELECTABLE - categories.UNTARGETABLE - categories.INSIGNIFICANTUNIT, self.Owner) and self.Owner.XPnextLevel then
            self.XPonDamaged = ForkThread(self.XPonDamagedThread, self)
        end
    end,
    ChargingUp = function(self, curProgress, time) oldShield.ChargingUp(self, curProgress, time)
        if ScenarioInfo.ALLies then
            self:SetHealth(self, self:GetMaxHealth())
        end
    end,
    OnState = State {
        Main = function(self)
            if ScenarioInfo.Allies == false then
                if self.OffHealth >= 0 then
                    self.Owner:SetMaintenanceConsumptionActive() self:ChargingUp(0, self.ShieldEnergyDrainRechargeTime)
                    if self:GetHealth() < self:GetMaxHealth() and self.RegenRate > 0 then
                        self.RegenThread = ForkThread(self.RegenStartThread, self) self.Owner.Trash:Add(self.RegenThread)
                    end
                end
            end
            self.OffHealth = -1 self:UpdateShieldRatio(-1) self.Owner:OnShieldEnabled() self:CreateShieldMesh()
            local aiBrain = self.Owner:GetAIBrain() WaitSeconds(1.0)
            local fraction = self.Owner:GetResourceConsumed()
            local on = true
            local test = false
            while on do
                WaitTicks(1) self:UpdateShieldRatio(-1)
                fraction = self.Owner:GetResourceConsumed()
                if fraction ~= 1 and aiBrain:GetEconomyStored('ENERGY') <= 0 then
                    if test then
                        on = false
                    else
                        test = true
                    end
                else
                    on = true
                    test = false
                end
            end
            ChangeState(self, self.EnergyDrainRechargeState)
        end,
        IsOn = function(self)
            return true
        end,
    },
    OffState = State {
        Main = function(self)
            if ScenarioInfo.Allies == false then
                if self.RegenThread then
                    KillThread(self.RegenThread)
                    self.RegenThread = nil
                end
            end
            self.OffHealth = -1
            if ScenarioInfo.ALLies == false then
                self.OffHealth = self:GetHealth()
            end
            self:UpdateShieldRatio(0) self:RemoveShield() self.Owner:OnShieldDisabled() WaitSeconds(1)
        end,
    },
    XPonDamagedThread = function(self)
        while self and self.Owner:IsDead() ~= true do
            if self:GetHealth() < self:GetMaxHealth() then
                self.Owner:AddXP(self.Owner.XPnextLevel * 0.1)
            end
            WaitTicks(40)
        end
    end,
}
local oldUnitShield = UnitShield
UnitShield = Class(oldUnitShield) {
    OnCreate = function(self, spec) Shield.InitBuffValues(self, spec) oldUnitShield.OnCreate(self, spec)
    end,
    OnCreate = function(self, spec) Shield.InitBuffValues(self, spec) oldUnitShield.OnCreate(self, spec)
    end,
    ChargingUp = function(self, curProgress, time) oldUnitShield.ChargingUp(self, curProgress, time)
        if ScenarioInfo.ALLies then
            self:SetHealth(self, self:GetMaxHealth())
        end
    end,
}