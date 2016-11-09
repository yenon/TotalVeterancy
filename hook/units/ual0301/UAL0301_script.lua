oldUAL0301 = UAL0301
UAL0301 = Class(oldUAL0301) {
    CreateEnhancement = function(self, enh) AWalkingLandUnit.CreateEnhancement(self, enh)
        local bp = self:GetBlueprint().Enhancements[enh]
        if not bp then
            return
        end
        if enh == 'ResourceAllocation' then
            if not Buffs['AeonSCUResourceAllocation'] then
                BuffBlueprint {
                    Name = 'AeonSCUResourceAllocation',
                    DisplayName = 'AeonSCUResourceAllocation',
                    BuffType = 'AeonSCUResourceAllocation',
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
            Buff.ApplyBuff(self, 'AeonSCUResourceAllocation')
        else
            if enh == 'ResourceAllocationRemove' then
                Buff.RemoveBuff(self, 'AeonSCUResourceAllocation', false)
            else
                if enh == 'EngineeringFocusingModule' then
                    if not Buffs['AeonSCUBuildRate'] then
                        BuffBlueprint {
                            Name = 'AeonSCUBuildRate',
                            DisplayName = 'AeonSCUBuildRate',
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
                    Buff.ApplyBuff(self, 'AeonSCUBuildRate')
                else
                    if enh == 'EngineeringFocusingModuleRemove' then
                        if Buff.HasBuff(self, 'AeonSCUBuildRate') then
                            Buff.RemoveBuff(self, 'AeonSCUBuildRate')
                        end
                    else
                        if enh == 'SystemIntegrityCompensator' then
                            if not Buffs['AeonSCURegen'] then
                                BuffBlueprint {
                                    Name = 'AeonSCURegen',
                                    DisplayName = 'AeonSCURegen',
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
                            Buff.ApplyBuff(self, 'AeonSCURegen')
                        else
                            if enh == 'SystemIntegrityCompensatorRemove' then
                                if Buff.HasBuff(self, 'AeonSCURegen') then
                                    Buff.RemoveBuff(self, 'AeonSCURegen')
                                end
                            else
                                if enh == 'StabilitySuppressant' then
                                    if not Buffs['AeonSCUStabilitySuppressant'] then
                                        BuffBlueprint {
                                            Name = 'AeonSCUStabilitySuppressant',
                                            DisplayName = 'AeonSCUStabilitySuppressant',
                                            BuffType = 'AeonSCUStabilitySuppressant',
                                            Stacks = 'ALWAYS',
                                            Duration = -1,
                                            Affects = {
                                                DamageRadius = {
                                                    Add =
                                                    bp.NewDamageRadiusMod,
                                                    ByName = {
                                                        RightReactonCannon = true,
                                                    },
                                                },
                                            },
                                        }
                                    end
                                    Buff.ApplyBuff(self, 'AeonSCUStabilitySuppressant')
                                else
                                    if enh == 'StabilitySuppressantRemove' then
                                        if Buff.HasBuff(self, 'AeonSCUStabilitySuppressant') then
                                            Buff.RemoveBuff(self, 'AeonSCUStabilitySuppressant')
                                        end
                                    else
                                        oldUAL0301.CreateEnhancement(self, enh)
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
TypeClass = UAL0301