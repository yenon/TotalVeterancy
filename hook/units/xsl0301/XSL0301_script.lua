do
    local oldXSL0301 = XSL0301
    XSL0301 = Class(oldXSL0301) {
        OnStartBuild = function(self, unitBeingBuilt, order) SWalkingLandUnit.OnStartBuild(self, unitBeingBuilt, order) oldXSL0301.OnStartBuild(self, unitBeingBuilt, order)
        end,
        CreateEnhancement = function(self, enh)
            local bp = self:GetBlueprint().Enhancements[enh]
            if not bp then
                return
            end
            if enh == 'EngineeringThroughput' then
                SWalkingLandUnit.CreateEnhancement(self, enh)
                if not Buffs['SeraphimSCUBuildRate'] then
                    BuffBlueprint {
                        Name = 'SeraphimSCUBuildRate',
                        DisplayName = 'SeraphimSCUBuildRate',
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
                Buff.ApplyBuff(self, 'SeraphimSCUBuildRate')
            else
                if enh == 'EnhancedSensors' then
                    SWalkingLandUnit.CreateEnhancement(self, enh)
                    if not Buffs['SeraSCUEnhancedSensors'] then
                        BuffBlueprint {
                            Name = 'SeraSCUEnhancedSensors',
                            DisplayName = 'SeraSCUEnhancedSensors',
                            BuffType = 'SeraSCUEnhancedSensors',
                            Stacks = 'ALWAYS',
                            Duration = -1,
                            Affects = {
                                VisionRadius = {
                                    Add = bp.NewVisionRadius,
                                },
                                OmniRadius = {
                                    Add = bp.NewOmniRadius,
                                },
                            },
                        }
                    end
                    Buff.ApplyBuff(self, 'SeraSCUEnhancedSensors')
                else
                    if enh == 'EnhancedSensorsRemove' then
                        SWalkingLandUnit.CreateEnhancement(self, enh) Buff.RemoveBuff(self, 'SeraSCUEnhancedSensors', false)
                    else
                        oldXSL0301.CreateEnhancement(self, enh)
                    end
                end
            end
        end,
    }
    TypeClass = XSL0301
end
--(of non-destructive hook) --TODO: WTF?!