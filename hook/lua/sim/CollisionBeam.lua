local oldCollisionBeam = CollisionBeam
CollisionBeam = Class(oldCollisionBeam) {
    OnImpact = function(self, impactType, targetEntity) self:SetDamageTable() oldCollisionBeam.OnImpact(self, impactType, targetEntity)
    end,
    SetDamageTable = function(self)
        self.DamageTable = self.Weapon:GetDamageTable()
        self.DamageTable.DamageAmount = self.Weapon.Damage
    end,
    DoDamage = function(self, instigator, damageData, targetEntity)
        local damage = damageData.DamageAmount or 0
        local dmgmod = 1
        if self.Weapon.DamageModifiers then
            for k, v in self.Weapon.DamageModifiers do
                dmgmod = v * dmgmod
            end
        end
        damage = damage * dmgmod
        if not instigator:IsDead() and damage > 0 then
            local radius = damageData.DamageRadius
            if radius and radius > 0 then
                if not damageData.DoTTime or damageData.DoTTime <= 0 then
                    DamageArea(instigator, self:GetPosition(1), radius, damage, damageData.DamageType or 'Normal', damageData.DamageFriendly or false)
                else
                    ForkThread(DefaultDamage.AreaDoTThread, instigator, self:GetPosition(1), damageData.DoTPulses or 1, (damageData.DoTTime / (damageData.DoTPulses or 1)), radius, damage, damageData.DamageType, damageData.DamageFriendly)
                end
            else
                if targetEntity then
                    if not damageData.DoTTime or damageData.DoTTime <= 0 then
                        Damage(instigator, self:GetPosition(), targetEntity, damage, damageData.DamageType)
                    else
                        ForkThread(DefaultDamage.UnitDoTThread, instigator, targetEntity, damageData.DoTPulses or 1, (damageData.DoTTime / (damageData.DoTPulses or 1)), damage, damageData.DamageType, damageData.DamageFriendly)
                    end
                else
                    DamageArea(instigator, self:GetPosition(1), 0.25, damage, damageData.DamageType, damageData.DamageFriendly)
                end
            end
        end
    end,
}

 