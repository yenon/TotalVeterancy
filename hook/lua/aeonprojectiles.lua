AQuarkBombProjectile = Class(EmitterProjectile) {
    FxTrails =
    EffectTemplate.AQuarkBomb01,
    FxTrailScale = 1,
    FxImpactUnit = EffectTemplate.AQuarkBombHitUnit01,
    FxImpactProp = EffectTemplate.AQuarkBombHitUnit01,
    FxImpactAirUnit = EffectTemplate.AQuarkBombHitAirUnit01,
    FxImpactLand = EffectTemplate.AQuarkBombHitLand01,
    FxImpactUnderWater = {},
    OnImpact = function(self, targetType, targetEntity) CreateLightParticle(self, -1, self:GetArmy(), 26, 6, 'sparkle_white_add_08', 'ramp_white_02')
        if targetType == 'Terrain' or targetType == 'Prop' then
            local pos = self:GetPosition() DefaultExplosion.CreateScorchMarkSplat(self, 3)
            self.DamageData.DamageAmount = self.DamageData.DamageAmount - 10
            if self.DamageData.DamageRadius < 0.1 then
                self.DamageData.DamageRadius = 0.11
            end
            DamageRing(self, pos, 0.1, self.DamageData.DamageRadius, 10, 'Fire', false, false)
            if (self.DamageData.DamageRadius - 1) < 0.01 then
                self.DamageData.DamageRadius = 0.02
            end
            DamageArea(self, pos, self.DamageData.DamageRadius, 1, 'Force', true) DamageArea(self, pos, self.DamageData.DamageRadius, 1, 'Force', true)
        end
        EmitterProjectile.OnImpact(self, targetType, targetEntity)
    end,
}