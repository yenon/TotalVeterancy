local oldUAA0310 = UAA0310
UAA0310 = Class(oldUAA0310) {
    OnImpact = function(self, with, other)
        local bp = self:GetBlueprint()
        local i = 1
        local numWeapons = table.getn(bp.Weapon)
        for i, numWeapons in bp.Weapon do
            if (bp.Weapon[i].Label == 'DeathImpact') then
                DamageArea(self, self:GetPosition(), bp.Weapon[i].DamageRadius, bp.Weapon[i].Damage, bp.Weapon[i].DamageType, bp.Weapon[i].DamageFriendly)
                break
            end
        end
        if not self.DeathBounce then
            self:ForkThread(self.DeathThread, self.OverKillRatio)
            self.DeathBounce = 1
        end
    end,
    CreateWreckage = function(self, overkillRatio)
        if overkillRatio then
            if overkillRatio > 1.0 then
                return
            end
        end
        self:CreateWreckageProp(overkillRatio)
    end,
}
TypeClass = UAA0310