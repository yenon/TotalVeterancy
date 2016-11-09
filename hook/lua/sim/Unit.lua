local mstbuff = Buffs.VeterancyStorageBuff.Affects.MassStorageBuf.Mult - 1
local estbuff = Buffs.VeterancyStorageBuff.Affects.EnergyStorageBuf.Mult - 1
local s = ScenarioInfo

SyncMeta = {
    __index = function(t, key)
        local id = rawget(t, 'id')
        return UnitData[id].Data[key]
    end,
    __newindex = function(t, key, val)
        local id = rawget(t, 'id')
        local army = rawget(t, 'army')
        if not UnitData[id] then
            UnitData[id] = {
                OwnerArmy = rawget(t, 'army'),
                Data = {}
            }
        end
        UnitData[id].Data[key] = val
        if army == GetFocusArmy() or GetFocusArmy() == -1 then
            if not Sync.UnitData[id] then
                Sync.UnitData[id] = {}
            end Sync.UnitData[id][key] = val
        end
    end,
}

--AR : AutoRevive
local s = ScenarioInfo
local AutoReviveRedir1 = function(self, other, firingWeapon)
    if EntityCategoryContains(categories.PROJECTILE, other) and IsEnemy(self:GetArmy(), other:GetArmy()) then
        if not other.red then
            self.Enemy = other:GetLauncher()
            self.Enemyproj = other
            if self.Enemy then
                local otposx, otposy, otposz = other:GetPositionXYZ()
                local protposx, protposy, protposz = self.Enemy:GetPositionXYZ() local function pm()
                local pm = Random(-2, 1)
                if pm == 0 then
                    pm = 2
                end
                return pm
            end

                local function rndg()
                    return (Random(3, 6) * Random() * pm())
                end

                other.red = (other.red or 0) + 1
                other.DamageData.CollideFriendly = true
                other.DamageData.DamageFriendly = true
                other.DamageData.DamageSelf = true other:TrackTarget(true) other:SetTurnRate(720) other:SetLifetime(2.2) other:SetMaxSpeed(0) other:SetPosition({ otposx, otposy + 5, otposz }, false) other:SetNewTargetGround({ protposx + rndg(), protposy - 1, protposz + rndg() }) other:SetVelocity(60):SetAcceleration(30):SetMaxSpeed(100)
                return false
            end
        end
        return false
    end
    return false
end
local ard1 = AutoReviveRedir1
AutoReviveRedir3 = function(self, other, firingWeapon)
    if EntityCategoryContains(categories.PROJECTILE, other) and IsEnemy(self:GetArmy(), other:GetArmy()) then
        if not other.red then
            self.Enemy = other:GetLauncher()
            self.Enemyproj = other
            if self.Enemy then
                local otposx, otposy, otposz = other:GetPositionXYZ()
                other.red = (other.red or 0) + 1
                other.DamageData.CollideFriendly = true
                other.DamageData.DamageFriendly = true
                other.DamageData.DamageSelf = true
                if other.DamageData.DamageRadius < 2 then
                    other.DamageData.DamageRadius = 2
                end
                other:TrackTarget(true) other:SetTurnRate(720) other:SetLifetime(2.2) other:SetPosition({ otposx, otposy + 30, otposz }, true) other:SetNewTarget(self.Enemy) other:SetAcceleration(160)
                return false
            end
            return false
        end
    end
    return false
end
local ard3 = AutoReviveRedir3
local PostAutoreviveRedir1 = function(self, other, firingWeapon)
    if EntityCategoryContains(categories.PROJECTILE, other) and IsEnemy(self:GetArmy(), other:GetArmy()) then
        if not other.red then
            self.Enemy = other:GetLauncher()
            self.Enemyproj = other
            if self.Enemy and self.Owner then
                other.red = (other.red or 0) + 1
                local otposx, otposy, otposz = other:GetPositionXYZ()
                local quickfix = other:GetCurrentTargetPosition()
                if quickfix == nil then
                    return false
                end
                local protposx, protposy, protposz = unpack(quickfix) unpack(other:GetCurrentTargetPosition())
                quickfix = self.Owner:GetCollisionExtents().Max
                if quickfix == nil then
                    return false
                end
                local w, h, l = unpack(quickfix) local function pm()
                local pm = Random(-2, 1)
                if pm == 0 then
                    pm = 2
                end
                return pm
            end

                local function rndg()
                    return (Random(3, 6) * Random() * pm())
                end

                other:SetLifetime(2)
                other.DamageData.CollideFriendly = true
                other.DamageData.DamageFriendly = true
                other.DamageData.DamageSelf = true
                other.DamageData.DamageRadius = 0.01
                local r1, r2 = rndg(), rndg()
                w, h, l = w * r1, h * 5, l * r2 other:SetMaxSpeed(65) other:TrackTarget(true) other:SetTurnRate(90) other:SetNewTargetGround({ protposx - w, h, protposz - l })
                other.delay = ForkThread(function() WaitTicks(4)
                    if other and not other:BeenDestroyed() then
                        other:SetTurnRate(360)
                        local vdx, vdy, vdz = other:GetPositionXYZ()
                        local vdix, vdiy, vdiz = unpack((VDiff({ otposx, otposy, otposz }, other:GetPosition()) or { 0, 0, 0 })) other:SetNewTargetGround({ 0 + vdx - vdix + w, -400 - h * 5 + vdy - vdiy, vdz - vdiz + l }) WaitTicks(2)
                        if other and not other:BeenDestroyed() then
                            other:TrackTarget(false) other:SetTurnRate(0)
                        end
                    end
                end) other.Trash:Add(other.delay)
            end
            return false
        end
    end
    return false
end
local prd1 = PostAutoreviveRedir1
local nn = function()
    return false
end

local AutoRevive = function(self, instigator, type, overkillRatio)
    local bp = self:GetBlueprint()
    local brain = GetArmyBrain(self:GetArmy())
    if self.Revive > 0 and not brain:IsDefeated() then
        local unitEnhancements = import('/lua/enhancementcommon.lua').GetEnhancements(self:GetEntityId())
        local where = self:GetPosition()
        local revivee = CreateUnitHPR(self:GetUnitId(), self:GetArmy(), where[1], where[2], where[3], 0, 0, 0) revivee:SetCanBeKilled(false) revivee:SetCanTakeDamage(false) revivee:SetFireState(1)
        if unitEnhancements then
            for k, v in unitEnhancements do
                if bp.Enhancements[v].Prerequisite ~= nil then
                    local recin = {}
                    local rec = v
                    local int = 1
                    while bp.Enhancements[rec].Prerequisite ~= nil do
                        recin[int] = bp.Enhancements[rec].Prerequisite
                        int = int + 1
                        rec = bp.Enhancements[rec].Prerequisite
                    end
                    local size = table.getsize(recin) or 1
                    for
                    i = size, 1, -1 do
                        revivee:CreateEnhancement(recin[i])
                    end
                end
                revivee:CreateEnhancement(v)
            end
        end
        local lvl = math.floor(self.VeteranLevel) - 10
        if s.ALLies == false then
            local cost = bp.Economy
            local massx, energyx = (-cost.BuildCostMass * lvl * 0.1), (-cost.BuildCostEnergy * lvl * .1) SetArmyEconomy(revivee:GetArmy(), massx, energyx)
        end
        revivee:AddLevels(lvl) revivee:SetHealth(nil, 1)
        local reviveelvl = revivee.VeteranLevel
        local br = revivee:GetBuildRate()
        local brRatio = reviveelvl / br revivee:SetBuildRate(0)
        revivee.Revive = self.Revive - 1
        revivee.Sync.Revive = revivee.Revive
        local id = revivee:GetEntityId() ForkThread(function()
        local army = revivee:GetArmy() local function cee(X)
        return CreateEmitterOnEntity(revivee, army, '/effects/emitters/' .. X .. '_emit.bp')
    end

        local function vfx(VFX, bag)
            for k, v in VFX do
                local f = cee(v) revivee.Trash:Add(f) table.insert(bag, f)
            end
        end

        local function clfx(bag)
            for k, v in bag do
                v:Destroy()
                v = nil
            end
        end

        local rbp = revivee:GetBlueprint()
        revivee.Vetredirector = import('/lua/defaultantiprojectile.lua').Flare {
            Owner =
            revivee,
            Radius = 5,
            Category = 'PROJECTILE',
        } revivee.Trash:Add(revivee.Vetredirector)
        local timer = self.VeteranLevel * 10
        local redc = ard1
        revivee.rf = {}
        local rfx = { 'fire' } vfx(rfx, revivee.rf)
        if timer > 1490 then
            redc = ard3
        end
        if s.ALLies == false then
            redc = prd1
        end
        revivee.Vetredirector.OnCollisionCheck = redc
        if s.ALLies == false then
            revivee.Vetredirector:SetCollisionShape('Box', 0, 0, 0, 12, 200, 12)
        end
        if timer > 600 then
            timer = 600
            if s.ALLies == false then
                timer = 200
            end
        end
        local name = ''
        if brain.Nickname then
            name = brain.Nickname
        end
        PrintText(name .. "'s Elite " .. LOC(rbp.Description) .. " revived at Level " .. math.floor(revivee.VeteranLevel) .. ' !!', 20, 'FFFF0000', 10, 'center') PrintText("It'll be Invincible for " .. math.floor(timer*0.1) .. ' seconds !!', 10, 'FFFF0000', 5, 'center')
        for
        i = timer, 1, -1 do
            if not revivee:IsDead() then
                if math.mod(i, 10) == 0 then
                    FloatingEntityText(id, i * 0.1)
                end
                revivee:SetFireState(1)
                if math.mod(i, 100) == 0 then
                    vfx(rfx, revivee.rf)
                end
                WaitTicks(1)
            end
        end
        if not revivee:IsDead() then
            revivee:SetCanBeKilled(true) revivee:SetCanTakeDamage(true) revivee:SetBuildRate(br) revivee:SetFireState(0)
            revivee.Vetredirector.OnCollisionCheck = prd1 revivee.Vetredirector:SetCollisionShape('Box', 0, 0, 0, 12, 200, 12)
            local redir2 = 180 clfx(revivee.rf)
            local rfx = { '_test_swirl_01' } vfx(rfx, revivee.rf)
            if s.ALLies == false then
                redir2 = 2
            end
            for
            i = redir2, 1, -1 do
                if not revivee:IsDead() then
                    FloatingEntityText(id, i) WaitTicks(10)
                end
            end
            if not revivee:IsDead() then
                clfx(revivee.rf)
                revivee.Vetredirector.OnCollisionCheck = nn revivee.Vetredirector:SetCollisionShape('None') revivee.Vetredirector:Destroy()
                revivee.Vetredirector = nil
            end
        end
    end)
    end
end


local mstbuff = Buffs.VeterancyStorageBuff.Affects.MassStorageBuf.Mult - 1
local estbuff = Buffs.VeterancyStorageBuff.Affects.EnergyStorageBuf.Mult - 1
local s = ScenarioInfo
local StorageBuffs = function(self, instigator, type, overkillRatio)
    local bp = self:GetBlueprint()
    local brain = GetArmyBrain(self:GetArmy())
    if bp.Economy.StorageEnergy and self.VeteranLevel > 1 then
        brain.StorageEnergyTotal = brain.StorageEnergyTotal - (bp.Economy.StorageEnergy * estbuff) * (self.VeteranLevel - 1) brain:GiveStorage("ENERGY", brain.StorageEnergyTotal)
    end
    if bp.Economy.StorageMass and self.VeteranLevel > 1 then
        brain.StorageMassTotal = brain.StorageMassTotal - (bp.Economy.StorageMass * estbuff) * (self.VeteranLevel - 1) brain:GiveStorage("MASS", brain.StorageMassTotal)
    end
end
local GetEnemies = function(self, instigator)
    local eAm = {}
    local ps = self:GetPosition()
    local rn = (VDist3(ps, instigator:GetPosition())) * 1.4
    local units = GetUnitsInRect(ps[1] - rn, ps[3] - rn, ps[1] + rn, ps[3] + rn)
    local selA = self:GetArmy()
    for k, y in units do
        if IsAlly(selA, y:GetArmy()) then
            --TODO: FIX continue
            continue
        end
        table.insert(eAm, y)
    end
    return eAm
end

local XPaward = function(self, instigator, type, overkillRatio)
    local bp = self:GetBlueprint()
    local brain = GetArmyBrain(self:GetArmy())
    if instigator and IsUnit(instigator) and not instigator:IsDead() and not IsAlly(self:GetArmy(), instigator:GetArmy()) then
        if bp.Economy.xpValue then
            local xpR = bp.Economy.xpValue * self.VeteranLevel * 0.25
            if s.ShareEXP then
                local en = GetEnemies(self, instigator)
                local nr = table.getn(en)
                if nr > 0 then
                    local rew = xpR * .9 / nr
                    xpR = xpR * .1
                    for k, v in en do
                        v:AddXP(rew)
                    end
                end
            end
            instigator:AddXP(xpR)
        end
    end
end

local Buff = import('/lua/sim/buff.lua')
local s = ScenarioInfo
local JumpingJackApeshit = function(self,to,height,RANGE)
        if not s.ALLies then
            if (EntityCategoryContains(categories.COMMAND,self) and self.LevelProgress <31) then
                return
            end
            if (EntityCategoryContains(categories.SUBCOMMANDER,self) and self.LevelProgress <6) then
                return
            end
        end
        local army,bs,bp = self:GetArmy(),1,self:GetBlueprint()
        local lvcalc,dodc,maxcost = self.VeteranLevel-1,1,30000
        local faction = bp.General.FactionName or 'UEF'
        local id = self:GetEntityId()
        local x,y,z = unpack(to)
        local x0,z0 = 0,0
        local x1,z1 = GetMapSize()
        if ScenarioInfo.MapData.PlayableRect then
            x0,z0,x1,z1 = unpack(ScenarioInfo.MapData.PlayableRect )
        end
        local function maprangecheck(X,Z)
            if X>x1 then
                X=x1
            end
            if X<x0 then
                X=x0
            end
            if Z>z1 then
                Z=z1
            end
            if Z<z0 then
                Z=z0
            end
            return X,Z
        end
        x,z = maprangecheck(x,z)
        local dx,dy,dz = unpack(VDiff({x,y,z},self:GetPosition()))
        y = GetTerrainHeight(x,z)
        local a,ms,mr =math.abs,math.sin,math.rad
        local rng = a(dx)+dy+a(dz)
        if rng < 1 then
            rng = 1
        end
        local finalD = {x,y,z}
        local nrj,targ,tp = 1
        local rmin,rmax,dxm,dxmin,dxmax,dzmin,dzmax,dxf,dyf,dzf = 10,210,0,0,0,0,0,0,0,0
        local wpn= self:GetWeapon(1)
        if RANGE =='howlingfury' then
            bs= 2
            maxcost = 300000
            local RNG = self.VeteranLevel*0.1+30
            local utype = 'SCU'
            if EntityCategoryContains(categories.COMMAND,self) then
                utype = 'ACU'
            end
            local howftb={
                Aeon={
                    ACU={
                        AoE=4,
                        RoF=0.25,
                        dmg=4,
                        RNG=RNG*0.5},
                    SCU={
                        AoE=1,
                        RoF=1,
                        dmg=4,
                        RNG=RNG}, },
                Cybran={
                    AoE=0,
                    RoF=6,
                    dmg=6,
                    RNG=RNG},
                UEF={
                    AoE=3,
                    RoF=6,
                    dmg=8,
                    RNG=RNG},
                Seraphim={
                    AoE=6,
                    RoF=8,
                    dmg=6,
                    RNG=RNG}, }
            local hbff = howftb[faction]
            if faction =='Aeon' then
                hbff = howftb[faction][utype]
            end
            BuffBlueprint {
                Name = 'HowlingFury'..
                        faction, DisplayName = 'HowlingFury'..
                        faction, BuffType = 'HowlingFury..faction',
                Stacks = 'ALWAYS',
                Duration = -1,
                Affects = {
                    Damage = {
                        Mult = hbff.dmg, },
                    RateOfFireBuf = {
                        Mult = hbff.RoF, },
                    DamageRadius = {
                        Add = hbff.AoE, },
                    MaxRadius = {
                        Add = hbff.RNG, }, }, }
        end
        if RANGE =='danceofdeath' then
            targ=wpn:GetCurrentTarget() do
            dc = targ:GetHealth()*.0012
            lvcalc = 1
            maxcost = 300000 BuffBlueprint {
            Name = 'DanceofDeath',
            DisplayName = 'DanceofDeath',
            BuffType = 'DanceofDeath',
            Stacks = 'ALWAYS',
            Duration = 7,
            Affects = {
                RateOfFireBuf = {
                    Mult = 4, }, }, }
        end
            if RANGE == 'longrange' then
                maxcost = 130000
                local c = MATH_IRound
                nrj = c(rng*.024)
                dx,dy,dz=dx/nrj,dy/nrj,dz/nrj
                dxf,dyf,dzf = dx,dy,dz
                dxm,dzm = math.max(a(dx*.3),10),math.max(a(dz*.3),10)
                dxmin,dxmax,dzmin,dzmax = -a(dxm),a(dxm),-a(dzm,dzm),a(dzm)
                nrj=nrj-1
                x,z = x-dx*nrj,z-dz*nrj
                nrj=nrj+1
                x,z=x+Random(dxmin,dxmax),z+Random(dzmin,dzmax)
                x,z = maprangecheck(x,z)
                y = GetTerrainHeight(x,z)
                dx,dy,dz = unpack(VDiff({x,y,z},self:GetPosition()))
                rng = a(dxf)+dyf+a(dzf)
            end
            local rnmax = 179
            if not s.ALLies then
                rnmax = 79
                rmax = 70
            end
            local range = -rnmax/rng
            if rng > rmax or rng < rmin or (RANGE == 'longrange' and nrj<4) then
                if RANGE ~='howlingfury' then
                    if RANGE ~= 'danceofdeath' then
                        local text = ''
                        if rng>rmax then
                            text='-exceeding maximum range'
                        end
                        if rng<rmin or (RANGE == 'longrange' and nrj<4) then
                            text='-below minimum range'
                        end
                        FloatingEntityText(id,'Jump aborted. '..text)
                        return
                    end
                end
            end
            rng = rng * height
            range = math.floor(range)
            rng = math.pow(rng,0.85)
            local nrjj = nrj
            local packedfun = {maprangecheck,a,ms,mr,lvcalc,dodc,bs,s,wpn,maxcost,id} local function Jump()
            if self:IsDead() then
                return
            end
            local maprangecheck,a,ms,mr,lvcalc,dodc,bs,s,wpn,maxcost,id = unpack(packedfun)
            self.jtb = {}
            local mlt,nrjp = rng,0
            local SFX={
                Aeon={{
                    b='UALWeapon',
                    c='UAB2108_Missile_Serpent2'},{
                    b='Impacts',
                    c='AEON_Expl_Med_Impact'},},
                Cybran={{
                    b='URLWeapon',
                    c='URB2108_Missile_Cruise'},{
                    b='Impacts',
                    c='CYB_Expl_Med_Impact'},},
                UEF={{
                    b='UELWeapon',
                    c='UEB2108_Missile_Cruise'},{
                    b='Impacts',
                    c='UEF_Expl_Med_Impact'},},
                Seraphim={{
                    b='XSB_Weapon',
                    c='XSB2108_Laanse_Missile'},{
                    b='Impacts',
                    c='XSL_Artillery_Impact'},} }
            local jfx={{
                t=1,
                r=rng*0.18,
                f1='glow_02',
                f2='ramp_red_02'}, {
                t=2,
                r=rng*0.38,
                f1='glow_03',
                f2='ramp_fire_06'}, {
                t=3.8,
                r=rng*.58,
                f1='glow_03',
                f2='ramp_nuke_04'} }
            local tfx={'_test_swirl_01', 'nuke_munition_launch_trail_05', 'air_hover_exhaust_01', }
            local hfx={'a3_end_nis_01', 'a3_end_nis_02', 'czar_splash_01', 'czar_splash_03', 'distortion_ring_01', 'destruction_explosion_concussion_ring_01', }
            local cbp={
                Aeon='/projectiles/AIFFragmentationSensorShell01/AIFFragmentationSensorShell01_proj.bp',
                Cybran='/projectiles/aifquanticcluster01/aifquanticcluster01_proj.bp',
                UEF='/projectiles/TIFHETacticalNuclearShell01/TIFHETacticalNuclearShell01_proj.bp',
                Seraphim='/projectiles/adfoblivioncannon04/adfoblivioncannon04_proj.bp',
                current='' }
            local function cee(X)
            return CreateEmitterOnEntity(self, army,'/effects/emitters/'..X..'_emit.bp')
        end
            local function vfx(VFX,bag,rep)
                for k,v in VFX do
                    local f=cee(v)
                    if rep then
                        f:SetEmitterParam('Lifetime',-1)
                    end
                    self.Trash:Add(f) table.insert(bag,f)
                end
            end
            local function clfx(bag)
                for k,v in bag do
                    v:Destroy()
                    v=nil
                end
            end
            local function sfx(fn)
                local L='Weapon_LodCutoff' self:PlaySound(Sound {
                Bank =
                fn.b, Cue =
                fn.c, LodCutoff = L, })
            end
            local function crv(mc)
                return ms(mr(mc))
            end
            local function ckdod()
                if RANGE=='danceofdeath' then
                    if not targ:IsDead() then
                        return true
                    end
                    return false
                end
            end
            local function random(inp)
                return Random(-a(inp),a(inp))
            end
            local function hv(r)
                return random(r)*.1*Random()
            end
            local function chkdrn()
                x,y,z = targ:GetPositionXYZ()
                x,z=x+random(20),z+random(20)
                x,z = maprangecheck(x,z)
                y = GetTerrainHeight(x,z)
                return x,y,z
            end
            local function faceIt(ovrr)
                local ht = wpn:WeaponHasTarget()
                if ht or ovrr then
                    if ckdod() and targ then
                        wpn:SetTargetEntity(targ)
                    end
                end
                local gps= self:GetPosition()
                local ps = wpn:GetCurrentTargetPos() or {x,y,z}
                local pv = VDiff(ps,gps)
                if ovrr then
                    pv[2]=0
                end
                ps=OrientFromDir(pv) self:SetOrientation(ps,true)
            end
            local function Busy(bool) self:SetImmobile(bool) self:SetBusy(bool)
            end
            Busy(true)
            if s.ALLies == false and nrjj == nrj and not self.Vetredirector then
                local jm = 250*(lvcalc)*math.pow(nrj*height*bs,0.5)*dodc
                if jm > maxcost then
                    ja = maxcost
                end
                self.jcb={}
                local fx={'explosion_fire_sparks_02','build_yellow_paint_spray','dust_cloud_07','quark_bomb2_01'} vfx(fx,self.jcb)
                self.event = CreateEconomyEvent(self, 0, jm, 0)
                mlt = 12 WaitFor(self.event)
                if self.event then
                    RemoveEconomyEvent(self, self.event )
                    self.event = nil
                end
                clfx(self.jcb)
            end
            sfx(SFX[faction][1])
            for
            i=1,3 do
                local j=jfx[i] CreateLightParticle(self,-1,army,j.t,j.r,j.f1,j.f2)
            end
            if not EntityCategoryContains(categories.uel0106,self) then
                vfx(tfx,self.jtb) DamageArea(self,self:GetPosition(),12,rng*mlt,'Force',false,false)
            end
            IssueClearCommands({self})
            if ckdod() then
                range=-3 Buff.ApplyBuff(self,'DanceofDeath',self) wpn:SetTargetEntity(targ)
                nrjp=2end
            WaitTicks(1) self:SetWorkProgress(0.0) faceIt(0)
            if RANGE ~= 'howlingfury' then
                local div,mult = 0.0055,1
                if s.ALLies==false then
                    div = 0.0125
                    mult = 2.25
                end
                for
                i = rnmax,0,range do
                    if self:IsDead() then
                        return
                    end
                    self:SetPosition({x-(dx*div*i),y-(dy*div*i)+crv(i*mult)*rng,z-(dz*div*i)},true) faceIt() WaitTicks(1)
                end
            else
                local pass ={x,y,z} Buff.ApplyBuff(self,'HowlingFury'..faction,self)
                for
                i = 1,table.getn(bp.Weapon) do
                    if bp.Weapon[i].ProjectileId ~= "" then
                        wpn = self:GetWeapon(i) break
                    end
                end
                cbp.current = wpn:GetProjectileBlueprint().BlueprintId wpn:ChangeProjectileBlueprint(cbp[faction]) wpn:SetFiringRandomness(4) vfx(hfx,self.jtb,true)
                height = math.ceil(height+GetSurfaceHeight(x,z)-GetTerrainHeight(x,z)+math.pow(self.VeteranLevel,0.5))
                local oft = -0.2
                for
                i = height,0,-1 do
                    if self:IsDead() then
                        return
                    end
                    to = self:GetPosition()
                    x,y,z = to[1]+1,to[2]-a(hv(1)),to[3]+1 self:SetPosition({to[1]+oft,to[2]+0.1*math.pow(i,.6),to[3]+oft},true) faceIt() WaitTicks(1)
                end
                for
                i=self.VeteranLevel+50,0,-1 do
                    if self:IsDead() then
                        return
                    end
                    if math.mod(i,10)==0 then
                        FloatingEntityText(id,i*0.1,nil,nil,'FFFAEBD7')
                    end
                    to =self:GetPosition()
                    x,y,z = x+1,y-a(hv(10)),z+1 self:SetPosition({to[1]+ms(i)*.1,to[2],to[3]+math.cos(i)*.1},true) faceIt() WaitTicks(1)
                end
                local descent = math.floor(to[2]-GetTerrainHeight(to[1],to[3]))
                for
                i = descent,0,-4 do
                    if self:IsDead() then
                        return
                    end
                    to =self:GetPosition() self:SetPosition({to[1],to[2]-0.1*i,to[3]},true) faceIt() WaitTicks(1)
                end
                x,z=maprangecheck(to[1],to[3])
                y=GetTerrainHeight(x,z) wpn:ChangeProjectileBlueprint(cbp.current) wpn:SetFiringRandomness(0) Buff.RemoveBuff(self,'HowlingFury'..faction,true,self)
            end
            faceIt(0) self:SetPosition({x,y,z},true) cee('czar_splash_01'):ScaleEmitter(0.1) sfx(SFX[faction][2]) clfx(self.jtb)
            self.jtb=nil Busy(false) self.jump:Destroy()
            self.jump=nil
            nrj=nrj-1+nrjp
            if nrj>0 and (RANGE == 'longrange' or ckdod()) then
                x,z=x+dxf+Random(dxmin,dxmax),z+dzf+Random(dzmin,dzmax)
                if nrj < 2 then
                    x,y,z=unpack(finalD)end
                if ckdod() then
                    x,y,z = chkdrn()
                end
                x,z = maprangecheck(x,z)
                y = GetTerrainHeight(x,z)
                dx,dy,dz = unpack(VDiff({x,y,z},self:GetPosition()))
                self.jump = ForkThread(Jump,self)
            end
        end
            if not self.jump then
                self.jump = ForkThread(Jump,self)
            end
            self.Trash:Add(self.jump)
        end
        end
local DanceofDeath = function(self,to,height,range)
            self.dncod=ForkThread(function()
                local wpn= self:GetWeapon(1)
                local id = self:GetEntityId() local ht,targ
                for
                m=30,0,-1 do
                    if self:IsDead() then
                        return
                    end
                    if math.mod(m,10)==0 then
                        FloatingEntityText(id,m*.1)
                    end
                    ht = wpn:WeaponHasTarget()
                    targ=wpn:GetCurrentTarget()
                    if ht and targ ~=nil and IsUnit(targ) then
                        to = targ:GetPosition()
                        to = {to[1]+Random(-5,5),to[2],to[3]+Random(-5,5)} self:JumpingJackApeshit(to,height,range) break
                    end
                    WaitTicks(1)
                end
                if not ht then
                    FloatingEntityText(id,'Jump aborted. No Valid target found.')
                end
                self.dncod:Destroy()
                self.dncod=nil
            end
            ) self.Trash:Add(self.dncod)
        end
local HowlingFury = function(self,to,height,range)
            height = 30
            to=self:GetPosition()
            if not self.jump and not self.dncod then
                self:JumpingJackApeshit(to,height,range)
            end
        end

local oldUnit = Unit
Unit = Class(oldUnit) {
    OnCreate = function(self) oldUnit.OnCreate(self)
        local bp = self:GetBlueprint()
        local brain = GetArmyBrain(self:GetArmy())
        if bp.Economy.XPperLevel then
            self.XPnextLevel = bp.Economy.XPperLevel
            self.xp = 0
            self.VeteranLevel = 1
            self.LevelProgress = 1
            self.Sync.LevelProgress = self.LevelProgress
            self.Sync.RegenRate = bp.Defense.RegenRate
            if EntityCategoryContains(categories.COMMAND, self) then
                self.eco = ForkThread(function() WaitSeconds(1.8) SetArmyEconomy(self:GetArmy(), 0, 5000) self.eco:Destroy()
                    self.eco = nil
                end) self.Trash:Add(self.eco)
            end
            if s.AItoggle and self.BuildXPLevelpSecond and brain.BrainType ~= "Human" then
                self.vetToggle = 4
            end
        end
    end,
    JumpingJackApeshit =
    JumpingJackApeshit,
    DanceofDeath =
    DanceofDeath,
    HowlingFury =
    HowlingFury,
    OnStartBeingBuilt = function(self, builder, layer)
        if builder.LevelProgress and builder.LevelProgress > 5 and builder.vetToggle and builder.vetToggle > 0 and not self:GetBlueprint().Economy.vetBuild then
            local bp = self:GetBlueprint().Economy
            bp.vetBuild = (builder.LevelProgress - 1) * builder.vetToggle
            self.Sync.vetBuild = bp.vetBuild
        end
        oldUnit.OnStartBeingBuilt(self, builder, layer)
    end,
    OnStopBeingBuilt = function(self, builder, layer)
        if self:GetBlueprint().Economy.xpTimeStep and EntityCategoryContains(categories.ENERGYPRODUCTION + categories.MASSSTORAGE + categories.ENERGYSTORAGE, self) then
            self:ForkThread(self.XPOverTime)
        end
        oldUnit.OnStopBeingBuilt(self, builder, layer)
        if not self.XPosbb then
            self.XPosbb = ForkThread(self.OnStopBeingBuiltXP, self) self.Trash:Add(self.XPosbb)
        end
    end,
    OnStopBeingBuiltXP = function(self)
        local bp = self:GetBlueprint().Economy
        if bp.vetBuild and bp.vetBuild > 1 then
            self:AddLevels(bp.vetBuild * 0.05)
            bp.vetBuild = nil
            self.Sync.vetBuild = 0
        end
        local brain = GetArmyBrain(self:GetArmy()) WaitTicks(9) self.XPosbb:Destroy()
        self.XPosbb = nil
    end,
    OnStopBuild = function(self, unitBeingBuilt)
        local sbp = self:GetBlueprint()
        if unitBeingBuilt and not unitBeingBuilt:IsDead() and sbp.Economy.xpValue and sbp.Economy.xpValue > 0 and sbp.Economy.BuildXPLevelpSecond and sbp.Economy.BuildXPLevelpSecond > 0 and unitBeingBuilt.XPosbb then
            local bp = unitBeingBuilt:GetBlueprint().Economy
            if bp.xpValue and bp.xpValue > 0 then
                local vetmult = 1
                if unitBeingBuilt.LevelProgress > 1 then
                    vetmult = vetmult + (unitBeingBuilt.LevelProgress - 1) * 0.2
                end
                self:AddXP(bp.xpValue * 0.25 * vetmult)
            end
        end
        oldUnit.OnStopBuild(self, unitBeingBuilt)
    end,
    WorkingState = State {
        OnWorkEnd = function(self, work)
            local enhBp = self:GetBlueprint().Enhancements[work]
            local enhxp = math.pow(enhBp.BuildCostMass + enhBp.BuildCostEnergy * 0.1 + enhBp.BuildTime * 0.04, 0.5)
            local mult = self.LevelProgress - 0.9999
            if s.ALLies == false then
                mult = 0
                if self.enhcnt then
                    self.enhcnt = self.enhcnt + 1
                else
                    self.enhcnt = 1
                end
                if self.enhcnt > 25 then
                    oldUnit.WorkingState.OnWorkEnd(self, work)
                    return
                end
                if self.LevelProgress > 26 then
                    mult = -0.2 * (self.VeteranLevel)
                    if mult < -24 then
                        mult = -24
                    end
                end
            end
            enhxp = enhxp * (100 + (4 * (mult))) * .01 self:AddXP(enhxp) oldUnit.WorkingState.OnWorkEnd(self, work)
        end,
    },
    SetMaintenanceConsumptionActive = function(self)
        if self.XPOverTimeThread then
            KillThread(self.XPOverTimeThread)
        end
        self.XPOverTimeThread = ForkThread(self.XPOverTime, self) self.Trash:Add(self.XPOverTimeThread) oldUnit.SetMaintenanceConsumptionActive(self)
    end,
    XPOverTime = function(self)
        if not self:GetBlueprint().Economy.xpTimeStep then
            return
        end
        if self:GetBlueprint().Economy.xpTimeStep <= 0 then
            return
        end
        local waittime = self:GetBlueprint().Economy.xpTimeStep * 0.5
        local step = 0.75
        if s.ALLies == false then
            step = 0.34
        end
        WaitSeconds(waittime)
        while not self:IsDead() and (self.MaintenanceConsumption or EntityCategoryContains(categories.ENERGYPRODUCTION + categories.MASSSTORAGE + categories.ENERGYSTORAGE, self)) do self:AddXP(self.XPnextLevel * step) WaitSeconds(waittime)
        end
    end,
    startBuildXPThread = function(self)
        local levelPerSecond = self:GetBlueprint().Economy.BuildXPLevelpSecond
        if not levelPerSecond then
            return
        end
        if levelPerSecond <= 0 then
            return
        end
        WaitTicks(2)
        if not self:IsDead() and self.ActiveConsumption then
            self:AddXP(self.XPnextLevel * levelPerSecond * 0.017)
        else
            return
        end
        WaitTicks(10)
        if not self:IsDead() and self.ActiveConsumption then
            self:AddXP(self.XPnextLevel * levelPerSecond * 0.017)
        else
            return
        end
        WaitTicks(10)
        while not self:IsDead() and self.ActiveConsumption do
            self:AddXP(self.XPnextLevel * levelPerSecond * 0.05) WaitTicks(30)
        end
    end,
    SetActiveConsumptionActive = function(self)
        if s.ALLies ~= false then
            if self.BuildXPThread then
                KillThread(self.BuildXPThread)
            end
            self.BuildXPThread = ForkThread(self.startBuildXPThread, self) self.Trash:Add(self.BuildXPThread)
        end
        oldUnit.SetActiveConsumptionActive(self)
    end,
    startSiloXPThread = function(self)
        local levelPerSecond = self:GetBlueprint().Economy.BuildXPLevelpSecond
        if not levelPerSecond then
            return
        end
        if levelPerSecond <= 0 then
            return
        end
        WaitTicks(2)
        if not self:IsDead() and self:IsUnitState("SiloBuildingAmmo") then
            self:AddXP(self.XPnextLevel * levelPerSecond * 0.016)
        else
            return
        end
        WaitTicks(10)
        if not self:IsDead() and self:IsUnitState("SiloBuildingAmmo") then
            self:AddXP(self.XPnextLevel * levelPerSecond * 0.016)
        else
            return
        end
        WaitTicks(10)
        if not self:IsDead() and self:IsUnitState("SiloBuildingAmmo") then
            self:AddXP(self.XPnextLevel * levelPerSecond * 0.016)
        else
            return
        end
        WaitTicks(10)
        while not self:IsDead() and self:IsUnitState("SiloBuildingAmmo") do
            self:AddXP(self.XPnextLevel * levelPerSecond * 0.05) WaitTicks(60)
        end
    end,
    OnSiloBuildStart = function(self, weapon)
        if self.SiloXPThread then
            KillThread(self.SiloXPThread)
        end
        self.SiloXPThread = ForkThread(self.startSiloXPThread, self) self.Trash:Add(self.SiloXPThread) oldUnit.OnSiloBuildStart(self, weapon)
    end,
    SetVeterancy = function(self, veteranLevel)
        veteranLevel = veteranLevel or 0
        if veteranLevel <= 5 then
            return oldUnit.SetVeterancy(self, veteranLevel)
        else
            local bp = self:GetBlueprint()
            if bp.Veteran['Level' .. veteranLevel] then
                self:AddKills(bp.Veteran['Level' .. veteranLevel])
            else
                WARN('SetVeterancy called on ' .. self:GetUnitId() .. ' with veteran level ' .. veteranLevel .. ' which was not defined in its BP file. ' .. ' Veterancy level has not been set.')
            end
        end
    end,
    CheckVeteranLevel = function(self)
        if not self.XPnextLevel then
            return
        end
        local bp = self:GetBlueprint()
        while self.xp >= self.XPnextLevel do
            self.xp = self.xp - self.XPnextLevel
            self.XPnextLevel = bp.Economy.XPperLevel * (1 + 0.1 * self.VeteranLevel) self:SetVeteranLevel(self.VeteranLevel + 1)
        end
        self.LevelProgress = self.xp / self.XPnextLevel + self.VeteranLevel
        self.Sync.LevelProgress = self.LevelProgress
    end,
    PlayVeteranFx = function(self, time)
        if self.disableSFX == true then
            return
        end
        time = time or 1 CreateAttachedEmitter(self, 0, self:GetArmy(), '/effects/emitters/destruction_explosion_concussion_ring_01_emit.bp'):ScaleEmitter(time)
    end,
    SetVeteranLevel = function(self, level)
        local bapb = Buff.ApplyBuff
        local mod = math.mod
        self.VeteranLevel = level
        local buffTypes = { 'Health', 'Regen', 'Vision', 'Damage', 'DamageArea', 'Range', 'RateOfFire', 'Speed', 'BuildRate', 'Radar', 'Sonar', 'OmniRadius', 'ResourceProduction', 'Shield' } bapb(self, 'VeterancyHealthRegen') bapb(self, 'VeterancyVision')
        local bp = self:GetBlueprint()
        local brain = GetArmyBrain(self:GetArmy())
        local gotweapon = false
        if bp.Weapon then
            for k, v in bp.Weapon do
                if v.Label ~= 'DeathWeapon' then
                    bapb(self, 'VeterancyDamageRoF') bapb(self, 'VeterancyDamageArea') bapb(self, 'VeterancyRange')
                    gotweapon = true break
                end
            end
        end
        if EntityCategoryContains(categories.MOBILE, self) and not EntityCategoryContains(categories.AIR, self) then
            bapb(self, 'VeterancySpeed')
        end
        if self:GetBuildRate() and self:GetBuildRate() > 2 then
            bapb(self, 'VeterancyBuildRate')
        end
        if bp.Intel.RadarRadius and bp.Intel.RadarRadius > 0 then
            bapb(self, 'VeterancyRadar')
        end
        if bp.Intel.SonarRadius and bp.Intel.SonarRadius > 0 then
            bapb(self, 'VeterancySonar')
        end
        if bp.Intel.OmniRadius and bp.Intel.OmniRadius > 0 then
            bapb(self, 'VeterancyOmniRadius')
        end
        if (bp.Economy.ProductionPerSecondEnergy and bp.Economy.ProductionPerSecondEnergy > 0) or (bp.Economy.ProductionPerSecondMass and bp.Economy.ProductionPerSecondMass > 0) then
            bapb(self, 'VeterancyResourceProduction')
        end
        local gotShield = false
        if EntityCategoryContains(categories.COMMAND, self) or EntityCategoryContains(categories.SUBCOMMANDER, self) then
            bapb(self, 'VeterancyCommandProduction') bapb(self, 'VeterancySpeed2')
            if self.VeteranLevel == 101 then
                for
                i = 1, self:GetWeaponCount() do
                    local wep = self:GetWeapon(i)
                    local wepbp = wep:GetBlueprint()
                    if wep.Label ~= 'DeathWeapon' then
                        wep:SetFireTargetLayerCaps('Air|Land|Water|Seabed|Sub')
                        wepbp.FireTargetLayerCapsTable = {
                            Land = 'Air|Land|Water|Seabed|Sub',
                            Seabed = 'Air|Land|Water|Seabed|Sub',
                            Water = 'Air|Land|Water|Seabed|Sub',
                        }
                    end
                end
            end
            if not EntityCategoryContains(categories.CYBRAN, self) then
                gotShield = true
            end
        end
        if self:GetShield() or gotShield then
            bapb(self, 'VeterancyShield')
        end
        local bpb = self:GetBlueprint().Buffs
        if bpb then
            for bLevel, bData in bpb do
                if (bLevel == 'Any' or bLevel == 'Level' .. level) then
                    for bType, bValues in bData do
                        local buffName = self:CreateUnitBuff(bLevel, bType, bValues)
                        if buffName then
                            bapb(self, buffName)
                        end
                    end
                end
            end
        end
        if gotweapon then
            if level == 6 then
                self.pFx = ForkThread(self.PlayVeteranFx, self, 0.5)
            end
            self.Trash:Add(self.pFx)
            if mod(level, 10) == 1 then
                if self.pFx then
                    KillThread(self.pFx)
                end
                self.pFx = ForkThread(self.PlayVeteranFx, self, level * 0.1)
            end
            if mod(level, 25) == 1 then
                if EntityCategoryContains(categories.MOBILE - categories.AIR, self) then
                    if brain.BrainType == "Human" then
                        local revive = self.Revive or 0
                        local revadd = 1
                        if self.Revive > 2 and s.ALLies == false then
                            revadd = 0
                        end
                        self.Revive = revive + revadd
                        self.Sync.Revive = self.Revive
                    end
                end
            end
        end
        if not brain.StorageEnergyTotal then
            brain.StorageEnergyTotal = 0
        end
        if not brain.StorageMassTotal then
            brain.StorageMassTotal = 0
        end
        if not brain.ME then
            brain.ME = "Mass"
        end
        if bp.Economy.StorageMass then
            brain.StorageMassTotal = brain.StorageMassTotal + (bp.Economy.StorageMass * mstbuff)
        end
        if bp.Economy.StorageEnergy then
            brain.StorageEnergyTotal = brain.StorageEnergyTotal + (bp.Economy.StorageEnergy * estbuff)
        end
        if brain.ME then
            if brain.ME == "Mass" then
                if brain.StorageMassTotal then
                    brain:GiveStorage("MASS", brain.StorageMassTotal)
                end
            else
                if brain.ME == "Energy" then
                    if brain.StorageEnergyTotal then
                        brain:GiveStorage("ENERGY", brain.StorageEnergyTotal)
                    end
                else
                    brain.ME = "Mass"
                end
            end
            self:GetAIBrain():OnBrainUnitVeterancyLevel(self, level) self:DoUnitCallbacks('OnVeteran')
        end
    end,
    CreateUnitBuff = function(self, levelName, buffType, buffValues)
        local buffName = self:GetUnitId() .. levelName .. buffType
        local buffMinLevel = nil
        local buffMaxLevel = nil
        if buffValues.MinLevel then
            buffMinLevel = buffValues.MinLevel
        end
        if buffValues.MaxLevel then
            buffMaxLevel = buffValues.MaxLevel
        end
        if not Buffs[buffName] then
            BuffBlueprint {
                MinLevel =
                buffMinLevel,
                MaxLevel =
                buffMaxLevel,
                Name =
                buffName,
                DisplayName =
                buffName,
                BuffType =
                buffType,
                Stacks =
                buffValues.Stacks,
                Duration =
                buffValues.Duration,
                Affects = buffValues.Affects,
            }
        end
        return buffName
    end,
    UpdateProductionValues = function(self)
        local bpEcon = self:GetBlueprint().Economy
        if not bpEcon then
            return
        end
        self:SetProductionPerSecondEnergy((self.EnergyProdMod or bpEcon.ProductionPerSecondEnergy or 0) * (self.EnergyProdAdjMod or 1)) self:SetProductionPerSecondMass((self.MassProdMod or bpEcon.ProductionPerSecondMass or 0) * (self.MassProdAdjMod or 1))
    end,
    AddLevels = function(self, levels)
        if levels <= 0 then
            return
        end
        local bp = self:GetBlueprint()
        local curlevel = self.VeteranLevel
        local percent = self.LevelProgress - curlevel
        local xpAdd = 0
        if levels >= (1 - percent) then
            xpAdd = self.XPnextLevel * (1 - percent)
            levels = levels - (1 - percent)
        else
            xpAdd = self.XPnextLevel * levels
            levels = 0
        end
        while levels > 1 do
            levels = levels - 1
            curlevel = curlevel + 1
            xpAdd = xpAdd + bp.Economy.XPperLevel * (1 + 0.1 * curlevel)
        end
        xpAdd = xpAdd + bp.Economy.XPperLevel * (1 + 0.1 * (curlevel + 1)) * levels self:AddXP(xpAdd)
    end,
    AddXP = function(self, amount)
        if not self.XPnextLevel then
            return
        end
        if amount <= 0 then
            return
        end
        local brain = GetArmyBrain(self:GetArmy())
        self.xp = self.xp + (amount) self:CheckVeteranLevel()
    end,
    OnKilled = function(self, instigator, type, overkillRatio) StorageBuffs(self, instigator, type, overkillRatio) AutoRevive(self, instigator, type, overkillRatio) XPaward(self, instigator, type, overkillRatio) oldUnit.OnKilled(self, instigator, type, overkillRatio)
    end,
    CreateShield = function(self, shieldSpec) oldUnit.CreateShield(self, shieldSpec) Buff.BuffAffectUnit(self, 'VeterancyShield', self, true)
    end,
    CreatePersonalShield = function(self, shieldSpec) oldUnit.CreatePersonalShield(self, shieldSpec) Buff.BuffAffectUnit(self, 'VeterancyShield', self, true)
    end,
    InitiateTeleportThread = function(self, teleporter, location, orientation)
        local tbp = teleporter:GetBlueprint()
        local ubp = self:GetBlueprint()
        self.UnitBeingTeleported = self self:SetImmobile(true) self:PlayUnitSound('TeleportStart') self:PlayUnitAmbientSound('TeleportLoop')
        local bp = self:GetBlueprint().Economy local energyCost, time
        if bp then
            local mass = bp.BuildCostMass * (bp.TeleportMassMod or 0.01)
            local energy = bp.BuildCostEnergy * (bp.TeleportEnergyMod or 0.01)
            energyCost = mass + energy
            time = energyCost * (bp.TeleportTimeMod or 0.01)
            if s.ALLies == false then
                if EntityCategoryContains(categories.COMMAND, self) then
                    if (time - self.VeteranLevel * 0.2) > 6 then
                        time = time - (self.VeteranLevel * 0.2)
                    else
                        time = 6
                    end
                else
                    if EntityCategoryContains(categories.SUBCOMMANDER, self) then
                        if (time - self.VeteranLevel * 0.4) > 10 then
                            time = time - (self.VeteranLevel * 0.4)
                        else
                            time = 10
                        end
                    else
                        if (time - self.VeteranLevel) > 15 then
                            time = time - (self.VeteranLevel)
                        else
                            time = 15
                        end
                    end
                end
            else
                if EntityCategoryContains(categories.COMMAND, self) then
                    if (time - self.VeteranLevel * 0.5) > 0 then
                        time = time - (self.VeteranLevel * 0.5)
                    else
                        time = 0.1
                    end
                else
                    if EntityCategoryContains(categories.SUBCOMMANDER, self) then
                        if (time - self.VeteranLevel) > 0.2 then
                            time = time - (self.VeteranLevel)
                        else
                            time = 0.2
                        end
                    else
                        if (time - self.VeteranLevel) > 1 then
                            time = time - (self.VeteranLevel)
                        else
                            time = 1
                        end
                    end
                end
            end
            self.TeleportDrain = CreateEconomyEvent(self, energyCost or 100, 0, time or 5, self.UpdateTeleportProgress) self:PlayTeleportChargeEffects() WaitFor(self.TeleportDrain)
            if self.TeleportDrain then
                RemoveEconomyEvent(self, self.TeleportDrain)
                self.TeleportDrain = nil
            end
            self:PlayTeleportOutEffects() self:CleanupTeleportChargeEffects() WaitSeconds(0.1) self:SetWorkProgress(0.0)
            if not self:IsDead() then
                Warp(self, location, orientation)
            end
            self:PlayTeleportInEffects() WaitSeconds(0.1) self:StopUnitAmbientSound('TeleportLoop') self:PlayUnitSound('TeleportEnd') self:SetImmobile(false)
            self.UnitBeingTeleported = nil
            self.TeleportThread = nil
        end
    end,
    GetShield = function(self)
        return self.MyShield or nil
    end,
    EnableUnitIntel = function(self, intel)
        if intel and intel == 'Cloak' then
            if not self.dnt then
                self:SetDoNotTarget(true)
                self.dnt = ForkThread(function() WaitTicks(1) self:SetDoNotTarget(false) self.dnt:Destroy()
                    self.dnt = nil
                end) self.Trash:Add(self.dnt)
            end
        end
        oldUnit.EnableUnitIntel(self, intel)
    end,
    GetHealthPercent = function(self)
        local health = self:GetHealth()
        local maxHealth = self:GetMaxHealth()
        return health / maxHealth
    end,
}