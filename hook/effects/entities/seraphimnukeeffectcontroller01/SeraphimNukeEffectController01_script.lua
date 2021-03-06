 
local NullShell = import('/lua/sim/defaultprojectiles.lua').NullShell 
local EffectTemplate = import('/lua/EffectTemplates.lua') 
local Util = import('/lua/utilities.lua') 
local RandomFloat = Util.GetRandomFloat 
local SIFExperimentalStrategicMissileEffect02 = '/effects/Entities/SIFExperimentalStrategicMissileEffect02/SIFExperimentalStrategicMissileEffect02_proj.bp' 
local SIFExperimentalStrategicMissileEffect04 = '/effects/Entities/SIFExperimentalStrategicMissileEffect04/SIFExperimentalStrategicMissileEffect04_proj.bp' 
local SIFExperimentalStrategicMissileEffect05 = '/effects/Entities/SIFExperimentalStrategicMissileEffect05/SIFExperimentalStrategicMissileEffect05_proj.bp' 
local SIFExperimentalStrategicMissileEffect06 = '/effects/Entities/SIFExperimentalStrategicMissileEffect06/SIFExperimentalStrategicMissileEffect06_proj.bp' 
SeraphimNukeEffectController01 = Class(NullShell) { 
NukeOuterRingDamage = 0, 
NukeOuterRingRadius = 0, 
NukeOuterRingTicks = 0, 
NukeOuterRingTotalTime = 0, 
NukeInnerRingDamage = 0, 
NukeInnerRingRadius = 0, 
NukeInnerRingTicks = 0, 
NukeInnerRingTotalTime = 0, 
PassData = function(self, Data)
if Data.NukeOuterRingDamage then
self.NukeOuterRingDamage = Data.NukeOuterRingDamage
end
if Data.NukeOuterRingRadius then
self.NukeOuterRingRadius = Data.NukeOuterRingRadius
end
if Data.NukeOuterRingTicks then
self.NukeOuterRingTicks = Data.NukeOuterRingTicks
end
if Data.NukeOuterRingTotalTime then
self.NukeOuterRingTotalTime = Data.NukeOuterRingTotalTime
end
if Data.DamageType then
self.DamageType = Data.DamageType
end
if Data.NukeInnerRingDamage then
self.NukeInnerRingDamage = Data.NukeInnerRingDamage
end
if Data.NukeInnerRingRadius then
self.NukeInnerRingRadius = Data.NukeInnerRingRadius
end
if Data.NukeInnerRingTicks then
self.NukeInnerRingTicks = Data.NukeInnerRingTicks
end
if Data.NukeInnerRingTotalTime then
self.NukeInnerRingTotalTime = Data.NukeInnerRingTotalTime
end
 self:CreateNuclearExplosion()
end
, 
CreateNuclearExplosion = function(self) 
local myBlueprint = self:GetBlueprint()
if myBlueprint.Audio.NukeExplosion then
 self:PlaySound(myBlueprint.Audio.NukeExplosion)
end
 		 		if (self.NukeInnerRingDamage ~= 0) then
 			self:ForkThread(self.InnerRingDamage) 		end
if (self.NukeOuterRingDamage ~= 0) then
 			self:ForkThread(self.OuterRingDamage) 		end 		 self:ForkThread(self.EffectThread) self:ForkThread(self.CreateEffectInnerPlasma) self:ForkThread(self.CreateEffectElectricity)
end
, 
OuterRingDamage = function(self) 
local myPos = self:GetPosition()
if self.NukeOuterRingTotalTime == 0 then
 DamageArea(self:GetLauncher(), myPos, self.NukeOuterRingRadius, self.NukeOuterRingDamage, self.DamageType, true,true)
else
local ringWidth = ( self.NukeOuterRingRadius / self.NukeOuterRingTicks ) 
local tickLength = ( self.NukeOuterRingTotalTime / self.NukeOuterRingTicks ) DamageArea(self:GetLauncher(), myPos, ringWidth, self.NukeOuterRingDamage,self.DamageType, true,true) WaitSeconds(tickLength)
for 
i = 2, self.NukeOuterRingTicks do
 DamageRing(self:GetLauncher(), myPos, ringWidth * (i - 1), ringWidth * i, self.NukeOuterRingDamage, self.DamageType, true,true) WaitSeconds(tickLength)
end
end
end
, 
InnerRingDamage = function(self) 
local myPos = self:GetPosition()
if self.NukeInnerRingTotalTime == 0 then
 DamageArea(self:GetLauncher(), myPos, self.NukeInnerRingRadius, self.NukeInnerRingDamage, self.DamageType, true,true)
else
local ringWidth = ( self.NukeInnerRingRadius / self.NukeInnerRingTicks ) 
local tickLength = ( self.NukeInnerRingTotalTime / self.NukeInnerRingTicks ) DamageArea(self:GetLauncher(), myPos, ringWidth, self.NukeInnerRingDamage, self.DamageType, true,true) WaitSeconds(tickLength)
for 
i = 2, self.NukeInnerRingTicks do
 DamageRing(self:GetLauncher(), myPos, ringWidth * (i - 1), ringWidth * i, self.NukeInnerRingDamage, self.DamageType, true,true) WaitSeconds(tickLength)
end
end
end
, 	 
CreateEffectInnerPlasma = function(self) 
local vx, vy, vz = self:GetVelocity() 
local num_projectiles = 12 
local horizontal_angle = (2*math.pi) / num_projectiles 
local angleInitial = RandomFloat( 0, horizontal_angle ) local xVec, zVec 
local offsetMultiple = 10.0 local px, pz 		WaitSeconds( 3.5 )
for 
i = 0, (num_projectiles -1) do
xVec = (math.sin(angleInitial + (i*horizontal_angle))) 
zVec = (math.cos(angleInitial + (i*horizontal_angle))) 
px = (offsetMultiple*xVec) 
pz = (offsetMultiple*zVec) 
local proj = self:CreateProjectile( SIFExperimentalStrategicMissileEffect05, px, -10, pz, xVec, 0, zVec ) proj:SetLifetime(5.0) proj:SetVelocity(7.0) proj:SetAcceleration(-0.35)
end
end, 	 	 CreateEffectElectricity = function(self) 
local vx, vy, vz = self:GetVelocity() 
local num_projectiles = 7 
local horizontal_angle = (2*math.pi) / num_projectiles 
local angleInitial = RandomFloat( 0, horizontal_angle ) local xVec, zVec 
local offsetMultiple = 0.0 local px, pz 		WaitSeconds( 3.5 )
for 
i = 0, (num_projectiles -1) do
xVec = (math.sin(angleInitial + (i*horizontal_angle))) 
zVec = (math.cos(angleInitial + (i*horizontal_angle))) 
px = (offsetMultiple*xVec) 
pz = (offsetMultiple*zVec) 
local proj = self:CreateProjectile( SIFExperimentalStrategicMissileEffect06, px, -8, pz, xVec, 0, zVec ) proj:SetLifetime(3.0) proj:SetVelocity(RandomFloat( 11, 20 )) proj:SetAcceleration(-0.35)
end
end, EffectThread = function(self) 
local army = self:GetArmy() 
local position = self:GetPosition() DamageRing(self, position, 0.1, 45, 1, 'Force', true) WaitSeconds(0.1) DamageRing(self, position, 0.1, 45, 1, 'Force', true) CreateLightParticle(self, -1, army, 140, 10, 'glow_02', 'ramp_blue_22') WaitSeconds( 0.3 ) CreateLightParticle(self, -1, army, 80, 36, 'glow_02', 'ramp_blue_16') 		
for k, v in EffectTemplate.SIFExperimentalStrategicMissileHit01 do
emit = CreateEmitterAtEntity(self,army,v)
end
	 	 WaitSeconds( 3.0 ) CreateLightParticle(self, -1, army, 160, 6, 'glow_02', 'ramp_blue_16') WaitSeconds( 0.1 ) CreateLightParticle(self, -1, army, 60, 60, 'glow', 'ramp_blue_22')
for k, v in EffectTemplate.SIFExperimentalStrategicMissileDetonate01 do
emit = CreateEmitterAtEntity(self,army,v)
end
local orientation = RandomFloat(0,2*math.pi) CreateDecal(position, orientation, 'Scorch_012_albedo', '', 'Albedo', 300, 300, 1200, 0, army) CreateDecal(position, orientation, 'Crater01_normals', '', 'Normals', 150, 150, 1200, 0, army) 
local vx, vy, vz = self:GetVelocity() 
local num_projectiles = 24 
local horizontal_angle = (2*math.pi) / num_projectiles 
local angleInitial = RandomFloat( 0, horizontal_angle ) local xVec, zVec 
local offsetMultiple = 60.0 local px, pz
for 
i = 0, (num_projectiles -1) do
xVec = (math.sin(angleInitial + (i*horizontal_angle))) 
zVec = (math.cos(angleInitial + (i*horizontal_angle))) 
px = (offsetMultiple*xVec) 
pz = (offsetMultiple*zVec) 
local proj = self:CreateProjectile( SIFExperimentalStrategicMissileEffect02, px, -12, pz, xVec, 0, zVec ) proj:SetLifetime(12.0) proj:SetVelocity(10.0) proj:SetAcceleration(-0.35)
end
local plume = self:CreateProjectile('/effects/entities/SIFExperimentalStrategicMissileEffect03/SIFExperimentalStrategicMissileEffect03_proj.bp', 0, 3, 0, 0, 1, 0) plume:SetLifetime(6.0) plume:SetVelocity(20.0) plume:SetAcceleration(-0.35) plume:SetCollision(false) plume:SetVelocityAlign(true) WaitSeconds( 1.0 ) 
local num_projectiles = 15 
local horizontal_angle = (2*math.pi) / num_projectiles 
local angleInitial = RandomFloat( 0, horizontal_angle ) local xVec, yVec, zVec 
local angleVariation = 0.5 local px, py, pz
for 
i = 0, (num_projectiles -1) do
xVec = math.sin(angleInitial + (i*horizontal_angle) + RandomFloat(-angleVariation, angleVariation) ) 
yVec = RandomFloat( 0.3, 1.5 ) + 1.2 
zVec = math.cos(angleInitial + (i*horizontal_angle) + RandomFloat(-angleVariation, angleVariation) ) 
px = RandomFloat( 7.5, 14.0 ) * xVec 
py = RandomFloat( 7.5, 14.0 ) * yVec 
pz = RandomFloat( 7.5, 14.0 ) * zVec 
local proj = self:CreateProjectile( SIFExperimentalStrategicMissileEffect04, px, py, pz, xVec, yVec, zVec ) proj:SetVelocity(RandomFloat( 10, 30 )) proj:SetBallisticAcceleration(-9.8)
end
end
, } 
TypeClass = SeraphimNukeEffectController01