local oldbrehns = AIBrain
AIBrain = Class(oldbrehns) {
    OnDefeat = function(self)
        local ftable = {}
        for k, v in ArmyBrains do
            if IsAlly(self:GetArmyIndex(), v:GetArmyIndex()) and not (self:GetArmyIndex() == v:GetArmyIndex()) and not v:IsDefeated() then
                table.insert(ftable, v:GetArmyIndex())
            end
        end
        local c = math.ceil(GetArmyUnitCap(self:GetArmyIndex()) / table.getn(ftable))
        for k, v in ftable do
            SetArmyUnitCap(v, c + GetArmyUnitCap(v))
        end
        oldbrehns.OnDefeat(self)
    end,
}