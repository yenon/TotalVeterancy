oldXEL0209 = XEL0209
XEL0209 = Class(oldXEL0209) {
    OnStopBeingBuilt = function(self, builder, layer)
        self:SetMaintenanceConsumptionActive()
        TConstructionUnit.OnStopBeingBuilt(self, builder, layer)
        self.Rotator = CreateRotator(self, 'Antenna', 'y')
        self.Trash:Add(self.Rotator)
        self.Rotator:SetSpinDown(false)
        self.Rotator:SetTargetSpeed(30)
        self.Rotator:SetAccel(20)
    end,
    OnStopBuild = function(self, unitBeingBuilt)
        self:SetWeaponEnabledByLabel('Riotgun01', true)
        TConstructionUnit.OnStopBuild(self, unitBeingBuilt)
    end,
}
TypeClass = XEL0209