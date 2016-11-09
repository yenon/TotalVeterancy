local Buff = import('/lua/sim/Buff.lua')
local oldURS0201 = URS0201
URS0201 = Class(oldURS0201) {
    TransformThread = function(self, land)
        if (not self.AnimManip) then
            self.AnimManip = CreateAnimator(self)
        end
        local bp = self:GetBlueprint()
        local scale = bp.Display.UniformScale or 1
        if (land) then
            if not Buffs['CybranDestroyerLandSpeed'] then
                BuffBlueprint {
                    Name = 'CybranDestroyerLandSpeed',
                    DisplayName = 'CybranDestroyerLandSpeed',
                    BuffType = 'CybranDestroyerLandSpeed',
                    Stacks = 'ALWAYS',
                    Duration = -1,
                    Affects = {
                        MoveMult = {
                            Add = 0,
                            Mult = bp.Physics.LandSpeedMultiplier,
                        },
                    },
                }
            end
            Buff.ApplyBuff(self, 'CybranDestroyerLandSpeed')
            self:SetImmobile(true)
            self.AnimManip:PlayAnim(self:GetBlueprint().Display.AnimationTransform)
            self.AnimManip:SetRate(2)
            self.IsWaiting = true WaitFor(self.AnimManip)
            self:SetCollisionShape('Box', bp.CollisionOffsetX or 0, (bp.CollisionOffsetY + (bp.SizeY * 1.0)) or 0, bp.CollisionOffsetZ or 0, bp.SizeX * scale, bp.SizeY * scale, bp.SizeZ * scale)
            self.IsWaiting = false self:SetImmobile(false)
            self.SwitchAnims = true
            self.Walking = true self.Trash:Add(self.AnimManip)
        else
            self:SetImmobile(true)
            if Buffs['CybranDestroyerLandSpeed'] then
                Buff.RemoveBuff(self, 'CybranDestroyerLandSpeed', false)
            end
            self.AnimManip:PlayAnim(self:GetBlueprint().Display.AnimationTransform)
            self.AnimManip:SetAnimationFraction(1) self.AnimManip:SetRate(-2)
            self.IsWaiting = true WaitFor(self.AnimManip)
            self:SetCollisionShape('Box', bp.CollisionOffsetX or 0, (bp.CollisionOffsetY + (bp.SizeY * 0.5)) or 0, bp.CollisionOffsetZ or 0, bp.SizeX * scale, bp.SizeY * scale, bp.SizeZ * scale)
            self.IsWaiting = false self.AnimManip:Destroy()
            self.AnimManip = nil self:SetImmobile(false)
            self.Walking = false
        end
    end,
}
TypeClass = URS0201