local oldDefaultProjectileWeapon = DefaultProjectileWeapon
DefaultProjectileWeapon = Class(oldDefaultProjectileWeapon) {
    GetWeaponEnergyRequired = function(self)
        local bp = self:GetBlueprint()
        local wnrgq = self.nrgq or bp.EnergyRequired
        local weapNRG = (wnrgq or 0) * (self.AdjEnergyMod or 1)
        if weapNRG < 0 then
            weapNRG = 0
        end
        return weapNRG
    end,
    GetWeaponEnergyDrain = function(self)
        local bp = self:GetBlueprint()
        local wnrgd = self.nrgd or bp.EnergyDrainPerSecond
        local weapNRG = (wnrgd or 0)
        return weapNRG
    end,
}