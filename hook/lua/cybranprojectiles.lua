CIFProtonBombProjectile = Class(NullShell) {
    FxImpactTrajectoryAligned = false,
    FxImpactUnit = EffectTemplate.CProtonBombHit01,
    FxImpactProp = EffectTemplate.CProtonBombHit01,
    FxImpactLand = EffectTemplate.CProtonBombHit01,
    OnImpact = function(self, targetType, targetEntity)
        local army = self:GetArmy() CreateLightParticle(self, -1, army, 12, 28, 'glow_03', 'ramp_proton_flash_02') CreateLightParticle(self, -1, army, 8, 22, 'glow_03', 'ramp_antimatter_02')
        if targetType == 'Terrain' or targetType == 'Prop' then
            local pos = self:GetPosition() DamageArea(self, pos, self.DamageData.DamageRadius * 0.25, 1, 'Force', true) DamageArea(self, pos, self.DamageData.DamageRadius * 0.25, 1, 'Force', true)
            self.DamageData.DamageAmount = self.DamageData.DamageAmount - 10
            if self.DamageData.DamageRadius < 0.1 then
                self.DamageData.DamageRadius = 0.11
            end
            DamageRing(self, pos, 0.1, self.DamageData.DamageRadius, 10, 'Fire', false, false) CreateDecal(pos, RandomFloat(0.0, 6.28), 'scorch_011_albedo', '', 'Albedo', 12, 12, 150, 200, army)
        end
        local blanketSides = 12
        local blanketAngle = (2 * math.pi) / blanketSides
        local blanketStrength = 1
        local blanketVelocity = 6.25
        for
        i = 0, (blanketSides - 1) do
            local blanketX = math.sin(i * blanketAngle)
            local blanketZ = math.cos(i * blanketAngle) self:CreateProjectile('/effects/entities/EffectProtonAmbient01/EffectProtonAmbient01_proj.bp', blanketX, 0.5, blanketZ, blanketX, 0, blanketZ):SetVelocity(blanketVelocity):SetAcceleration(-0.3)
        end
        EmitterProjectile.OnImpact(self, targetType, targetEntity)
    end,
}