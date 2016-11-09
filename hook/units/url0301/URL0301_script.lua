oldURL0301 = URL0301
URL0301 = Class(oldURL0301) {
    CreateEnhancement = function(self, enh)
        CWalkingLandUnit.CreateEnhancement(self, enh)
        local bp = self:GetBlueprint().Enhancements[enh]
        if not bp then
            return
        end
        if enh == 'CloakingGenerator' then
            self.StealthEnh = false
            self.CloakEnh = true self:EnableUnitIntel('Cloak')
            if not Buffs['CybranSCUCloakBonus'] then
                BuffBlueprint {
                    Name = 'CybranSCUCloakBonus',
                    DisplayName = 'CybranSCUCloakBonus',
                    BuffType = 'SCUCLOAKBONUS',
                    Stacks = 'ALWAYS',
                    Duration = -1,
                    Affects = {
                        MaxHealth = {
                            Add = bp.NewHealth,
                        },
                    },
                }
            end
            if Buff.HasBuff(self, 'CybranSCUCloakBonus') then
                Buff.RemoveBuff(self, 'CybranSCUCloakBonus')
            end
            Buff.ApplyBuff(self, 'CybranSCUCloakBonus')
        else
            if enh == 'SelfRepairSystem' then
                if not Buffs['CybranSCURegen'] then
                    BuffBlueprint {
                        Name = 'CybranSCURegen',
                        DisplayName = 'CybranSCURegen',
                        BuffType = 'ACUBUILDRATE',
                        Stacks = 'ALWAYS',
                        Duration = -1,
                        Affects = {
                            Regen = {
                                Add = bp.NewRegenRate,
                            },
                        },
                    }
                end
                Buff.ApplyBuff(self, 'CybranSCURegen')
            else
                if enh == 'SelfRepairSystemRemove' then
                    Buff.RemoveBuff(self, 'CybranSCURegen', false)
                else
                    if enh == 'ResourceAllocation' then
                        if not Buffs['CybranSCUResourceAllocation'] then
                            BuffBlueprint {
                                Name = 'CybranSCUResourceAllocation',
                                DisplayName = 'CybranSCUResourceAllocation',
                                BuffType = 'CybranSCUResourceAllocation',
                                Stacks = 'ALWAYS',
                                Duration = -1,
                                Affects = {
                                    MassProductionBuf = {
                                        Add = bp.ProductionPerSecondMass,
                                    },
                                    EnergyProductionBuf = {
                                        Add = bp.ProductionPerSecondEnergy,
                                    },
                                },
                            }
                        end
                        Buff.ApplyBuff(self, 'CybranSCUResourceAllocation')
                    else
                        if enh == 'ResourceAllocationRemove' then
                            Buff.RemoveBuff(self, 'CybranSCUResourceAllocation', false)
                        else
                            if enh == 'Switchback' then
                                if not Buffs['CybranSCUBuildRate'] then
                                    BuffBlueprint {
                                        Name = 'CybranSCUBuildRate',
                                        DisplayName = 'CybranSCUBuildRate',
                                        BuffType = 'SCUBUILDRATE',
                                        Stacks = 'ALWAYS',
                                        Duration = -1,
                                        Affects = {
                                            BuildRate = {
                                                Add = bp.NewBuildRate,
                                            },
                                        },
                                    }
                                end
                                Buff.ApplyBuff(self, 'CybranSCUBuildRate')
                            else
                                if enh == 'SwitchbackRemove' then
                                    if Buff.HasBuff(self, 'CybranSCUBuildRate') then
                                        Buff.RemoveBuff(self, 'CybranSCUBuildRate')
                                    end
                                else
                                    if enh == 'FocusConvertor' then
                                        if not Buffs['CybranSCUFocusConvertor'] then
                                            BuffBlueprint {
                                                Name = 'CybranSCUFocusConvertor',
                                                DisplayName = 'CybranSCUFocusConvertor',
                                                BuffType = 'CybranSCUFocusConvertor',
                                                Stacks = 'ALWAYS',
                                                Duration = -1,
                                                Affects = {
                                                    Damage = {
                                                        Add =
                                                        bp.NewDamageMod,
                                                        ByName = {
                                                            RightDisintegrator = true,
                                                        },
                                                    },
                                                },
                                            }
                                        end
                                        Buff.ApplyBuff(self, 'CybranSCUFocusConvertor')
                                    else
                                        if enh == 'FocusConvertorRemove' then
                                            if Buff.HasBuff(self, 'CybranSCUFocusConvertor') then
                                                Buff.RemoveBuff(self, 'CybranSCUFocusConvertor')
                                            end
                                        else
                                            if enh == 'EMPCharge' then
                                                local wep = self:GetWeaponByLabel('RightDisintegrator')
                                                wep:ReEnableBuff('STUN')
                                                wep = self:GetWeaponByLabel('NMissile')
                                                wep:ReEnableBuff('STUN')
                                            else
                                                if enh == 'EMPChargeRemove' then
                                                    local wep = self:GetWeaponByLabel('RightDisintegrator')
                                                    wep:DisableBuff('STUN')
                                                    wep = self:GetWeaponByLabel('NMissile')
                                                    wep:DisableBuff('STUN')
                                                else
                                                    oldURL0301.CreateEnhancement(self, enh)
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end,
}
TypeClass = URL0301