local oldXSL0001 = XSL0001
XSL0001 = Class(oldXSL0001) {
    RegenBuffThread = function(self)
        local rmm = Buffs.VeterancyDamageArea.Affects.DamageRadius.Mult - 1
        local rml = Buffs.VeterancyDamageArea.MaxLevel
        local RAR = self:GetBlueprint().Enhancements.RegenAura.Radius
        while not self:IsDead() do
            local units = AIUtils.GetOwnUnitsAroundPoint(self:GetAIBrain(), categories.ALLUNITS, self:GetPosition(), RAR + (rmm * math.min(rml, self.VeteranLevel - 1) * RAR))
            for _, unit in units do
                Buff.ApplyBuff(unit, 'SeraphimACURegenAura')
            end
            WaitSeconds(5)
        end
    end,
    AdvancedRegenBuffThread = function(self)
        local rmm = Buffs.VeterancyDamageArea.Affects.DamageRadius.Mult - 1
        local rml = Buffs.VeterancyDamageArea.MaxLevel
        local ARA = self:GetBlueprint().Enhancements.AdvancedRegenAura.Radius
        while not self:IsDead() do
            local units = AIUtils.GetOwnUnitsAroundPoint(self:GetAIBrain(), categories.ALLUNITS, self:GetPosition(), ARA + (rmm * math.min(rml, self.VeteranLevel - 1) * ARA))
            for _, unit in units do
                Buff.ApplyBuff(unit, 'SeraphimAdvancedACURegenAura')
            end
            WaitSeconds(5)
        end
    end,
    OnStartBuild = function(self, unitBeingBuilt, order) SWalkingLandUnit.OnStartBuild(self, unitBeingBuilt, order) oldXSL0001.OnStartBuild(self, unitBeingBuilt, order)
    end,
    CreateEnhancement = function(self, enh) SWalkingLandUnit.CreateEnhancement(self, enh)
        local bp = self:GetBlueprint().Enhancements[enh]
        if enh == 'RegenAura' then
            local bp = self:GetBlueprint().Enhancements[enh]
            if not Buffs['SeraphimACURegenAura'] then
                BuffBlueprint {
                    Name = 'SeraphimACURegenAura',
                    DisplayName = 'SeraphimACURegenAura',
                    BuffType = 'COMMANDERAURA',
                    Stacks = 'ALWAYS',
                    Duration = 5,
                    Affects = {
                        RegenPercent = {
                            Mult = bp.RegenPerSecond or 0.1,
                            Ceil =
                            bp.RegenCeiling,
                            Floor = bp.RegenFloor,
                        },
                    },
                }
            end
            table.insert(self.ShieldEffectsBag, CreateAttachedEmitter(self, 'XSL0001', self:GetArmy(), '/effects/emitters/seraphim_regenerative_aura_01_emit.bp'))
            self.RegenThreadHandle = self:ForkThread(self.RegenBuffThread)
        else
            if enh == 'RegenAuraRemove' then
                if self.ShieldEffectsBag then
                    for k, v in self.ShieldEffectsBag do
                        v:Destroy()
                    end
                    self.ShieldEffectsBag = {}
                end
                KillThread(self.RegenThreadHandle)
            else
                if enh == 'AdvancedRegenAura' then
                    if self.RegenThreadHandle then
                        if self.ShieldEffectsBag then
                            for k, v in self.ShieldEffectsBag do
                                v:Destroy()
                            end
                            self.ShieldEffectsBag = {}
                        end
                        KillThread(self.RegenThreadHandle)
                    end
                    local bp = self:GetBlueprint().Enhancements[enh]
                    if not Buffs['SeraphimAdvancedACURegenAura'] then
                        BuffBlueprint {
                            Name = 'SeraphimAdvancedACURegenAura',
                            DisplayName = 'SeraphimAdvancedACURegenAura',
                            BuffType = 'COMMANDERAURA',
                            Stacks = 'ALWAYS',
                            Duration = 5,
                            Affects = {
                                RegenPercent = {
                                    Mult = bp.RegenPerSecond or 0.1,
                                    Floor = bp.RegenFloor,
                                },
                                MaxHealth = {
                                    Mult = bp.MaxHealthFactor or 1.1,
                                },
                            },
                        }
                    end
                    table.insert(self.ShieldEffectsBag, CreateAttachedEmitter(self, 'XSL0001', self:GetArmy(), '/effects/emitters/seraphim_regenerative_aura_01_emit.bp'))
                    self.AdvancedRegenThreadHandle = self:ForkThread(self.AdvancedRegenBuffThread)
                else
                    if enh == 'AdvancedRegenAuraRemove' then
                        if self.ShieldEffectsBag then
                            for k, v in self.ShieldEffectsBag do
                                v:Destroy()
                            end
                            self.ShieldEffectsBag = {}
                        end
                        KillThread(self.AdvancedRegenThreadHandle)
                    else
                        if enh == 'ResourceAllocation' then
                            if not Buffs['SeraACUResourceAllocation'] then
                                BuffBlueprint {
                                    Name = 'SeraACUResourceAllocation',
                                    DisplayName = 'SeraACUResourceAllocation',
                                    BuffType = 'SeraACUResourceAllocation',
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
                            Buff.ApplyBuff(self, 'SeraACUResourceAllocation')
                        else
                            if enh == 'ResourceAllocationRemove' then
                                Buff.RemoveBuff(self, 'SeraACUResourceAllocation', false)
                            else
                                if enh == 'ResourceAllocationAdvanced' then
                                    if Buffs['SeraACUResourceAllocation'] then
                                        Buff.RemoveBuff(self, 'SeraACUResourceAllocation', false)
                                    end
                                    if not Buffs['SeraACUResourceAllocationAdvanced'] then
                                        BuffBlueprint {
                                            Name = 'SeraACUResourceAllocationAdvanced',
                                            DisplayName = 'SeraACUResourceAllocationAdvanced',
                                            BuffType = 'SeraACUResourceAllocationAdvanced',
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
                                    Buff.ApplyBuff(self, 'SeraACUResourceAllocationAdvanced')
                                else
                                    if enh == 'ResourceAllocationAdvancedRemove' then
                                        Buff.RemoveBuff(self, 'SeraACUResourceAllocationAdvanced', false)
                                    else
                                        if enh == 'AdvancedEngineering' then
                                            local bp = self:GetBlueprint().Enhancements[enh]
                                            if not bp then
                                                return
                                            end
                                            local cat = ParseEntityCategory(bp.BuildableCategoryAdds) self:RemoveBuildRestriction(cat)
                                            if not Buffs['SeraphimACUT2BuildRate'] then
                                                BuffBlueprint {
                                                    Name = 'SeraphimACUT2BuildRate',
                                                    DisplayName = 'SeraphimACUT2BuildRate',
                                                    BuffType = 'ACUBUILDRATE',
                                                    Stacks = 'ALWAYS',
                                                    Duration = -1,
                                                    Affects = {
                                                        BuildRate = {
                                                            Add = bp.NewBuildRate,
                                                        },
                                                        MaxHealth = {
                                                            Add = bp.NewHealth,
                                                        },
                                                        Regen = {
                                                            Add = bp.NewRegenRate,
                                                        },
                                                    },
                                                }
                                            end
                                            Buff.ApplyBuff(self, 'SeraphimACUT2BuildRate')
                                        else
                                            if enh == 'T3Engineering' then
                                                local bp = self:GetBlueprint().Enhancements[enh]
                                                if not bp then
                                                    return
                                                end
                                                local cat = ParseEntityCategory(bp.BuildableCategoryAdds) self:RemoveBuildRestriction(cat)
                                                if not Buffs['SeraphimACUT3BuildRate'] then
                                                    BuffBlueprint {
                                                        Name = 'SeraphimACUT3BuildRate',
                                                        DisplayName = 'SeraphimCUT3BuildRate',
                                                        BuffType = 'ACUBUILDRATE',
                                                        Stacks = 'ALWAYS',
                                                        Duration = -1,
                                                        Affects = {
                                                            BuildRate = {
                                                                Add = bp.NewBuildRate,
                                                            },
                                                            MaxHealth = {
                                                                Add = bp.NewHealth,
                                                            },
                                                            Regen = {
                                                                Add = bp.NewRegenRate,
                                                            },
                                                        },
                                                    }
                                                end
                                                Buff.ApplyBuff(self, 'SeraphimACUT3BuildRate')
                                                if Buff.HasBuff(self, 'SeraphimACUT2BuildRate') then
                                                    Buff.RemoveBuff(self, 'SeraphimACUT2BuildRate')
                                                end
                                            else
                                                if enh == 'BlastAttack' then
                                                    if not Buffs['SeraACUBlastAttack'] then
                                                        BuffBlueprint {
                                                            Name = 'SeraACUBlastAttack',
                                                            DisplayName = 'SeraACUBlastAttack',
                                                            BuffType = 'SeraACUBlastAttack',
                                                            Stacks = 'ALWAYS',
                                                            Duration = -1,
                                                            Affects = {
                                                                Damage = {
                                                                    Add =
                                                                    bp.AdditionalDamage,
                                                                    ByName = {
                                                                        ChronotronCannon = true,
                                                                    },
                                                                },
                                                                MaxRadius = {
                                                                    Add =
                                                                    bp.NewMaxRadius,
                                                                    ByName = {
                                                                        ChronotronCannon =
                                                                        true,
                                                                        OverCharge = true,
                                                                    },
                                                                },
                                                            },
                                                        }
                                                    end
                                                    Buff.ApplyBuff(self, 'SeraACUBlastAttack')
                                                else
                                                    if enh == 'BlastAttackRemove' then
                                                        if Buff.HasBuff(self, 'SeraACUBlastAttack') then
                                                            Buff.RemoveBuff(self, 'SeraACUBlastAttack')
                                                        end
                                                    else
                                                        if enh == 'RateOfFire' then
                                                            if not Buffs['SeraACURateOfFire'] then
                                                                BuffBlueprint {
                                                                    Name = 'SeraACURateOfFire',
                                                                    DisplayName = 'SeraACURateOfFire',
                                                                    BuffType = 'SeraACURateOfFire',
                                                                    Stacks = 'ALWAYS',
                                                                    Duration = -1,
                                                                    Affects = {
                                                                        RateOfFireBuf = {
                                                                            Add =
                                                                            bp.NewRateOfFire,
                                                                            ByName = {
                                                                                ChronotronCannon = true,
                                                                            },
                                                                        },
                                                                        MaxRadius = {
                                                                            Add =
                                                                            bp.NewMaxRadius,
                                                                            ByName = {
                                                                                ChronotronCannon =
                                                                                true,
                                                                                OverCharge = true,
                                                                            },
                                                                        },
                                                                    },
                                                                }
                                                            end
                                                            Buff.ApplyBuff(self, 'SeraACURateOfFire')
                                                        else
                                                            if enh == 'RateOfFireRemove' then
                                                                if Buff.HasBuff(self, 'SeraACURateOfFire') then
                                                                    Buff.RemoveBuff(self, 'SeraACURateOfFire')
                                                                end
                                                            else
                                                                oldXSL0001.CreateEnhancement(self, enh)
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
                end
            end
        end
    end,
}
TypeClass = XSL0001