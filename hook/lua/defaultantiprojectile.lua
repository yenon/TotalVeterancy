oldMissileRedirect = MissileRedirect
MissileRedirect = Class(oldMissileRedirect) {
    WaitingState = State {
        OnCollisionCheck = function(self, other)
            if EntityCategoryContains(categories.MISSILE, other) and not EntityCategoryContains(categories.STRATEGIC, other) and other ~= self.EnemyProj and IsEnemy(self:GetArmy(), other:GetArmy()) then
                self.Enemy = other:GetLauncher()
                self.EnemyProj = other
                if self.Enemy then
                    other:TrackTarget(true) other:SetTurnRate(360) other:SetLifetime(3)
                    local x, y, z = unpack(self:GetPosition()) local function rnd()
                    return Random(6, 12 * Random()) * Random(-1, 1)
                end

                    other:SetNewTargetGround({ x + rnd(), y + rnd(), z + rnd() })
                end
                ChangeState(self, self.RedirectingState)
            end
            return false
        end,
    },
}