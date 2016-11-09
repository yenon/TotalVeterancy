local oldWeapon = Weapon
Weapon = Class(oldWeapon) {
    OnCreate = function(self) oldWeapon.OnCreate(self)
        local bp = self:GetBlueprint()
        self.DamageRadius = bp.DamageRadius
        self.Damage = bp.Damage
        self.range = bp.MaxRadius
        self.rangeMod = 1
        self.adjRoF = 1
        self.bufRoF = bp.RateOfFire
        if bp.NukeOuterRingDamage and bp.NukeOuterRingRadius and bp.NukeInnerRingDamage and bp.NukeInnerRingRadius then
            self.NukeOuterRingDamage = bp.NukeOuterRingDamage or 10
            self.NukeOuterRingRadius = bp.NukeOuterRingRadius or 40
            self.NukeInnerRingDamage = bp.NukeInnerRingDamage or 2000
            self.NukeInnerRingRadius = bp.NukeInnerRingRadius or 30
        end
    end,
    CreateProjectileForWeapon = function(self, bone)
        local proj = oldWeapon.CreateProjectileForWeapon(self, bone)
        if proj and not proj:BeenDestroyed() then
            local bp = self:GetBlueprint()
            local Lifetime = bp.ProjectileLifetime
            if Lifetime == 0 then
                Lifetime = proj:GetBlueprint().Physics.Lifetime * self.rangeMod
            end
            proj:SetLifetime(Lifetime)
            if self.unit.TrackTarget then
                proj:TrackTarget(true)
            end
            if bp.NukeOuterRingDamage and bp.NukeOuterRingRadius and bp.NukeOuterRingTicks and bp.NukeOuterRingTotalTime and bp.NukeInnerRingDamage and bp.NukeInnerRingRadius and bp.NukeInnerRingTicks and bp.NukeInnerRingTotalTime then
                local data = {
                    NukeOuterRingDamage =
                    self.NukeOuterRingDamage,
                    NukeOuterRingRadius =
                    self.NukeOuterRingRadius,
                    NukeOuterRingTicks = bp.NukeOuterRingTicks or 20,
                    NukeOuterRingTotalTime = bp.NukeOuterRingTotalTime or 10,
                    DamageType = bp.DamageType or 'Normal',
                    NukeInnerRingDamage =
                    self.NukeInnerRingDamage,
                    NukeInnerRingRadius =
                    self.NukeInnerRingRadius,
                    NukeInnerRingTicks = bp.NukeInnerRingTicks or 24,
                    NukeInnerRingTotalTime = bp.NukeInnerRingTotalTime or 24,
                } proj:PassData(data)
            end
        end
        return proj
    end,
    GetDamageTable = function(self)
        local damageTable = oldWeapon.GetDamageTable(self)
        damageTable.DamageRadius = (self.DamageRadius or 0)
        damageTable.DamageAmount = (self.Damage or 0)
        return damageTable
    end,
}