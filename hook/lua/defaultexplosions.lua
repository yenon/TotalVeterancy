function CreateFlash(obj, bone, scale, army) CreateLightParticle(obj, bone, army, GetRandomFloat(6, 10) * scale, GetRandomFloat(10.5, 14.5), 'glow_04', 'ramp_red_09')
end

function _CreateScalableUnitExplosion(obj)
    local army = obj.Spec.Army
    local vetscale = obj.Spec.OverKillRatio.LevelProgress or 0
    local scale = obj.Spec.BoundingXZRadius + math.max(((vetscale - 1) * 0.01), 0)
    local layer = obj.Spec.Layer
    local BaseEffectTable = {}
    local EnvironmentalEffectTable = {}
    local EffectTable = {}
    local ShakeTimeModifier = 0
    local ShakeMaxMul = 1
    if scale < 0.5 then
        BaseEffectTable = EffectTemplate.ExplosionEffectsSml01
    else
        if scale > 4 then
            BaseEffectTable = EffectTemplate.ExplosionEffectsLrg01
            ShakeTimeModifier = 1.0
            ShakeMaxMul = 0.25
        else
            BaseEffectTable = EffectTemplate.ExplosionEffectsMed01
        end
        EnvironmentalEffectTable = GetUnitEnvironmentalExplosionEffects(layer, scale)
        if table.getn(EnvironmentalEffectTable) ~= 0 then
            EffectTable = EffectTemplate.TableCat(BaseEffectTable, EnvironmentalEffectTable)
        else
            EffectTable = BaseEffectTable
        end
        CreateEffects(obj, army, EffectTable) CreateFlash(obj, -1, scale, army)
        if layer == 'Land' then
            if scale > 1.2 then
                CreateScorchMarkDecal(obj, scale, army)
            else
                CreateScorchMarkSplat(obj, scale, army)
            end
        end
        CreateDebrisProjectiles(obj, obj.Spec.BoundingXYZRadius, obj.Spec.Dimensions) obj:ShakeCamera(30 * scale, scale * ShakeMaxMul, 0, 0.5 + ShakeTimeModifier) obj:Destroy()
    end
 end