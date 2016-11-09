TotalVeterancy g V4.86
Keywords: TVg v4.86 V4 V3 V2 Total Veterancy Level lvl lv XP UI TotalVeterancy Support Commander SCU ACU buff Ultimate Warrior TVgV4 TVgV4.86 (S)ACU SACU revive auto storage MP SP Survival balance 3603 Quantum Gate restrictions drones final rush pro gameenders nukes explosions hotfix mex fix Energy jump Jumping apeshit exploit shield cloak Bullet Storm

If you have played Total Veterancy v1.17 before, you can skip the following paragraph.

What does this mod do?
Units gain xp for killing other units. As they level up their stats improve significantly. At Level 11 their HP and damage output increases by ~100%.
They gain various other buffs, specifics can be found in the readme.
There is no level limit.
Since V4 everything can be built as Veterans by expending extra economy by Veterans.

This adds some depth to the game, as spamming units to be killed by the enemy can be your undoing.
Protect your Veterans, they're worth the hassle! 


What has changed:
Improved speed, simspeed does not suffer as much. There's still room for improvement, though. Version 4 is slower than Version 2b1, the fastest to date.

Multiplayer and Singleplayer/Mp against AI games have a seperate set of balance.
UI display vastly improved, you get numerical data for xp and enemy levels.
Many tooltips added to explain new buttons and UI items
Auto Revive amount also gets displayed.
Level 26+ units gain Auto-Revive
Toggleable Eco Storage Buffs
Lightweight Shockwave Fx on hitting landmark levels (6,11,21,31, etc)
Teleport time decreases per gained level, energy cost increases.
Only kills award xp, AoE Weapons no longer award massive extra xp.
Shields, Eco and Intel structures gain xp over time, as do builders while building.
(this means they're prime targets for gaining serious xp)
Friendly fire is disabled.
Beams and Lasers get damage Buff
Finishing to build or assist something awards xp on the cost of the completed entity.
Economy awards double xp when killed.

Adjusted Balance
ACU's and SCU's are capable of dishing out serious damage, specifics can be read below.
Units now gain XP*level of killed enemy, still require 4 times the own XPvalue +10% for each extra level gained.

Tons of bug fixes and adjustments, details can be read in the changelog.


Details:

Maximum Level: 
somewhere around 1,000,000,000.

UI: 
current XP: How much you've collected until now.
next Level: The sum you need to achieve to gain a level.
worth: Killing this unit will gain you this amount of XP
Enemy Level is guessed, can be wrong due to map scripts and other factors, ie. enhancements. Enemy ACUs and SCUs do not display a guessed level or worth.

Mechanics:
Killing a enemy unit gains you enemyLevel*xpValue.
You need 4 times your own value to progress a level +10% for each gained level.
A units XP value is sqrt(masscost + energycost/10 + buildtime/25) with exception of ACUs and SCUs who have a lower value.
Shields gain XP while they are damaged at 150% a level per minute.
--------------------------------------------------------------------------------
Multiplayer
Economy, Intel, Shields, Storages gain a third of a level per minute while enabled.
Builders gain xp on cempleting to build depending on costs. 
Silos gain half a level when building per minute, They need to be active for more than 2 ticks.
Shields don't recharge to full on levelup.
Teleport Time decreases much slower, caps at a few seconds.

--------------------------------------------------------------------------------
Singleplayer & MP Survival
Economy, Intel, Shields, Storages gain three quarters a level per minute while enabled.
Builders gain 2 levels, Silos half a level while building per minute.
Builders gain xp on completing to build depending on costs. 
They need to be active for more than 2 ticks.
Shields recharge on Levelup.
AI Unit levels can be adjusted via UI buttons.
(Land,Defense,Structures,Navy,Air)
BuildXP can be enabled/disabled globally via button.
Teleport Time decreases faster and caps at up to 1 second 

--------------------------------------------------------------------------------

Starting with TVg V2, xp gains are the same for all units, AoE Damage will no longer increase the amount of xp awarded.
Starting with TVg v4, all units can be built as Veterans by Veterans, toggleable via UI, costs are adjusted on the fly.
Starting with TVg v4.3, No GameEnders and No Nuke restrictions adjusted as follows:
-No Nukes affects all T3-T4 Silos, including mobile and anti-missile silos. 
-No GameEnders doesn't affect T3 Nukes, but T4 Nukes of any kind, t3/t4 arty, t4 economy, t4 stationary factories, Satellites.
Affecting all custom units with the proper categories set.

Also some minor balance changes from patch 3603 included, please read changelog for details

  

Buffs and Balance Overview:

All units have an additional starting regeneration based on their HP.

Gain per level of all Units:
       Maxes out at Level
+10%        HP
+10%        Shield HP
+10%        Shield Regen
+10%        Damage for all Weapons
+10%        Energycosts and Energydrain for Weapons
+ 5%   21   AoE Area
+ 1%        RoF for all Weapons
+ 1%   101  Range for all Weapons
+ 1%   101  Speed (Movement, Turn, Acceleration)
+ 2.5%  41  Vision, Omni, Radar, Sonar, Range
+10%        Buildrate
+10%        Mass production
+20%        Energy production
+40%        Mass/Energy Storage (only one can be active at a time)

+1 Auto-Revive each +25 levels, applies to Human player, mobile non-Air units only.    

Teleportation delay reduces per gained level, energycosts increase accordingly. 
in seconds:
  ACU SCU OTHER
MP (-0.2/-0.4/-1)
cap (3/6/10)

SP/s (-0.5/-1/-1)
cap (0.1/0.2/1)

Additionally for ACUs and SCUs  (first 20 levels only)
+0.5 metal/s
+50 energy/s
Starting at level 41 up to 941 they gain:
+ 1% Speed (Movement, Turn, Acceleration) on top of the standard buff.

Gain ability to fire at air/ground sea as long as projectile permits at level 101+


ACUs and SCUs main weapon now have AoE = 1.
Aeon ACUs "Quantum Accelerator" enhancement quadruples RoF.
Aeon ACUs "Chronotron" enhancement moved from back to left Slot.
Cybran ACUs "Cloaking Generator" enhancement improves Health by 25000 HP. 
Cybran ACUs "Microwave Laser Generator" costs increased damage output  reduced due to beam weapon buffs taking effect at V3.
UEF ACUs "Zephyr Amplifier" enhancement quadruples damage output.
The enhancement costs were adjusted accordingly.
Seraphim ACU "Refracting Chronotron Amplifier" and "Chronotron Accelerator" slots swapped.
SCUs buildtime reduced to a third.
All SCUs Damage buffed to Brick level.
Cybran SCU AA damage doubled.
Cybran SCU Cloaking Generator adds 45k health, costs adjusted.
Seraphim SCU Regen enhancement costs adjusted.
UEF ACU and SCU drones unlock building options on leveling up.
levels: 6,11,21,31,41,51,61 
unlock: all t1,partial t2, all t2, partial t3,all t3,partial t4, all t4
 
All Enhancements take effect retroactively immediately.
Enhancements award xp on being built.

0 Values will stay 0.
A Unit without area effect weapon will not gain AoE with veterancy.

To install the mod you need to extract the "TVg V4" folder into your "SupremeCommander-FA\mods\" folder. If it does not exist just create it.  ('SupremeCommander-FA' is what ever you have called your forged alliance installation path)


Many thanks to ChirmayaWrongEmail for the work on UI display stuff.


Changelog:

V1.0
Initial Version.

V1.1
Version 1.1

-Lifetime Issues Fixed. There are 2 Lifetimes. and Long range weapons used the wrong one.

-Air Speed Fixed. Air units no longer get speed buff on levels. This will avoid misslead for bombers and fighters.

-Lobo issue fixed. I was missing a return value in a projectile function which lead to a lot of issues (most obvious was the lobo)

-Range issue for Fatboy Fixed. Max Pitch range and MuzzleVelocity got increased in the Fatboy blueprint. Buffing muzzelvelocity by veterancy i do not want to do as a lot of projectile scripts (mainly missiles) change this value during the flight and i may conflict with this.

V1.2

-Lifetime of Nukes fixed.

-changed default veterancy buffs and implemented a level cap for different stats.

HP now is 5% per level to a maximum of infinit bonus
Buildrate is now 10% per level to a maximum of infinit bonus
Danage and RoF is now 5% per level to a maximum of infinit bonus
range now is 5% per level to a maximum of 100% bonus
AoE now is 2.5% per level to a maximum of 100% bonus
vision,radar and omni is now 2.5% per level to a maximum of 100% bonus
speed is now 2.5% per level to a maximum of 50% bonus (ground and sea units only)

v1.3
-Changed mass/energy bonus
-Changed from kill based to damage based veterancy.
-Implemented the UI support for the new veterancy stuff

v1.4
-Formula changed to a sqrt one. Will slow down low tech units leveling a bit and speed up high tech units leveling.
-Units now need 4 times their value per levelup.
-Units now gain shield power and regen per level (if they have a shield). -Additional units now gain XP for taking shield damage (less than real damage)
-Mass extractors now gain XP over time (one level all 10 minutes). This increase the value of old mexes and makes raids more hurting if you lose one.

v1.5
-Tuned down leveling speed of ACUs a bit
-Fixed UI dispaly of levels and progress
-Fixed Beam weapons to allow them geting buffs. Origin scripts from GPG only used blueprintvalues and ignored all modifications.

v1.6
lot of stuff

TotalVeterancy Core v1.7
-Changed the XPvalue calculation in the blueprints.lua. There are now 4 locals to customize.
   default is 4 times own value per level and value is sqrt(coststuff)
-Implemented nuke Damage/Area buffs. Nuke Damage gets normal Damage buffs. AoE gets half AoE buffs.

TotalVeterancy AutoXP V1.1
-Powerplants now get a level all 10 minutes.
-Radars now get a level all 5 minutes

Total Veterancy UI V1.1
-There is now a display for Buildpower of a unit
-There is now a display for Regenrate of a unit


TotalVeterancy Core V1.8
-UEF laser sat XP value adjusted
-UEF laser sat now shares XP with its command station

Total Veterancy UI V1.2
-Fixed a bug with buildrate display. It said '1' if no info was available

FF-SAM V1.1
-added an allive check into the Cybran missile code when trying to set speed and acceleration.
-removed multiple LOG commands that should not be in a release
-removed the retargeting on losing traget as it is not working in FA. Will be back as soon as i figured out what prevents tracking after lost target.

TotalVeterancy Core V1.9
-'Untargetable' units bo longer gain XP if there is no baseXP set in the blueprint
-Seraphim ACU regenaura is now stacking with other buffs. Because how HP buffs are applyed in my mod they no longer work as a heal.

CheapAntiNuke V1.0
NEW
-Cuts all Antinuke Costs by 10 to allow fights against multiple AIx.

TotalVeterancy Core V1.10
-Seraphim SCU and ACU build XP fixed.

TotalVeterancy Core V1.11
-Cybran Destroyer speed buffs fixed.
-Nuke AoE and Damage buffs fixed. They wrote Aoe into damage and damage into AoE

TotalVeterancy Core V1.12
-Fixed the calculation of the "RegenPercent" buff used by the Seraphim ACU aura. The aura gives now the bonus that the blueprint tells.

-NEW-
No Com Rush V1.0
-A commander will lose its damage and buildpower (reclaim ability)  as long as it is close to an enemy commander.

TotalVeterancy Core V1.13
-changed the default regen buffs per level. They are now 10% regen per level. Starting regen of all units is incresed but the 10% will be less than old regen gain per level.

TotalVeterancy AutoXP V1.2
-Quantumgates now get XP while building SCUs.

FF-SAM V1.2
-Fixed a typo in the nanite missile scripts.

No Com Rush V1.1
-A Commander will now take full overcharge damage if its distance to the starting location is >100 (~t1 radar range) in the first 10 minutes.

TotalVeterancy Core V1.14
-Bug fixed that caused errors with indestructible units gaining XP.

Total Veterancy ShieldXP
- now available in 4 Version. normal. x2, x4 and x8.

TotalVeterancy Core V1.15
-Bug fixed that prevented Seraphim enigneer build XP.
-check added to stop errors in DoTakeDamage if an other mod changed XP values in blueprints.

TotalVeterancy Core V1.16
-Fix for Shield buffs
-Vision buff now affects cybran soothsayer
-t3 mobile arty muzzelvelocity increased to match the range gain by veterancy
-removed fuel buff to fix some problems with non mobile units gaining XP

TotalVeterancy UI V1.3
-Shield current and max HP are now displayed

TotalVeterancy AutoXP V1.3
-Soothsayer now gain one level all 4 minutes

TotalVeterancy Core V1.17
-maxHP buffs are now initialised in a different way and should include map based values.
-bug fixed in shield chargup. GetHealth() was lowercase.
-XP required now increases by 10% per level. was 5% before.

TotalVeterancy UI V1.4
-Shield regen is now displayed.


Total Veterancy g releases by Ghaleon

TotalVeterancy 1.19 g b6
-Merged Core with AutoXP and ShieldXP and UI
-changed formatting, replaced '#' with '--', tabs with spaces.

--performance optimizations
-removed sync table entries for build rate, replaced ui with generic getbuildrate method
-XP over time, auto XP, etc, get called much less, adjusted gains accordingly
-XP for damage only gained for significant hits, fixes issues with high level units gaining too many levels by just being shot at.
-economy buildings will gain XP over time, as do all intelligence buildings and sonars.

--bugs fixed
-Addlevel was adding levels according to the old 5% XP increase for next level,fixed
-XPOverTime check added for safety
-XPAdd did not add XP for uneven values below 1
-duplicate entry for cybran scu
-uef acu t3 upgrade seems to not behave correctly, need to investigate why, temp fix, adjusted buildrate to 90
-paused builders were gaining XP, switched to award XP when resources are spent.
-enhancements also gain XP

--balance changes
-XP gained on damage formula changed, now only adds XP for significant damage
-kills add base XP value multiplied by square root of level
-engineers,stations now gain builderXP.
-shields only gain XP if damage is above ~2% of maxhealth
-but gain XP over time
-SCU dps adjusted to ~375-500(upgrades)

--UI improvements
-Current XP, XP to next level is now shown.
-Enemy units now have a approximated level displayed
-Enemy units now display baseXP and HP required to gain 1XP,
-XP gained for doing damage depends on doing more damage than "xxxHP > 1XP"
-destroyed enemy units award BaseXP * level^0.78

--known bugs not fixed yet
-t2 aa stationary & mobile gains XP way too fast
-disabling massfabs seems(need to replicate) to increase the XP gain rate.
-AI seems to not gain much XP at all(?)
-XP acquisition rate seems buggy in other spots, too.


TotalVeterancy 1.19 g b7 alpha
--balance changes
-Support Commander base XP adjusted to reflect damage buff in b6.
(they were leveling too fast)


TotalVeterancy 1.19 g b7 release
Note: since b6 XP is only awarded for significant hits and killing a unit, this makes the game run faster. Also solves issues with certain units gaining XP much too fast. b8 may use a different fix, reintroducing slight XP gains per hit.

--bugs fixed
-OnCreate sLevel set to 1, q'n dirty fix for units not gaining XP if target was lv0.
Side effect: first level up awards lvl 1+XP, instead of lvl 0+XP, afterwards it is back to normal.
-do/end block added for unitview.lua, changed uid to 9f, for compatibility with BlackopsIconSupport mod.

--balance changes
-baseXP calculation formula changed, it's now sqrt( mass+(energy*0.1)+(buildtime*0.04) ),
was sqrt( mass+(energy/200)+(Buildtime/25) ).
change also improves map load slightly.
-support commander base XP adjusted again

--performance optimizations
-where feasible, replaced division by multiplication, will speed up map load a bit


TotalVeterancy 1.19 g b7 release 2

--bugs fixed
-current and XPtoNextLevel UI display now works properly at the cost of two new sync entries
-AutoXP, fixed a threading issue, fixes massfabs,shields,intel gaining way too much XP when constantly switched on/off

--balance changes
-removed XP gains on damage, kills still award XP.
-kills now award BaseXP*Level, this is displayed in ui
-shields still gain a quarter of the damage as XP
-Command type units BaseXP adjusted
-Cybran SCU AA damage doubled
-SCU BuildTime reduced to a third, still twice as much as in Vanilla SC
-Fatboy,Ravager, disabled friendly fire
-Builder and XP over Time now increases faster
-nerfed rate of fire buff by 4%, 3 digit level units should be far less menacing now.
-increased damagebuff by 5% to adjust for RoF nerf.

--UI improvements
-approximate XP to gain can be seen on selecting a target
-Total XP worth of own unit selected is displayed
-removed XP per HP display, next version may replace it with Max ShieldHP for enemy shields
-deflated XP values

--performance optimizations
-more divisions replaced
-removed XP for HP and some DoTakeDamage rework, ought to be a lot faster now
-nerfed rate of fire buff, was 5% now is 1%, also should increase performance noticeably
-a few more checks and reordering of some code segments

--known bugs
-look at b8

TotalVeterancy_g b8
--bugs fixed
-new Sync entries and bp values in b7r2 were causing slowdown.
reverted to ui only calculation, this can be inaccurate at times.
-included a max level for UI xp calculation to avoid level 1000+ units xp showing
may lower this cap after some testing


--performance optimizations
-removed blueprint&sync values for extra xp calculation introduced in b7r2
-Stationary Shields only gain xp on absorbing significant damage in the 4 digits range.
(<500~1200 depending on shield),they still gain auto xp over time
-pgens autoxp gain rate lowered to 4 minutes again, improved buff accordingly
-removed ceil from xp functions, should speed things up


--UI changes
-xp again calculated within UI, can be inaccurate, auto disables after level 999
-Enemy commanders and subcommanders no longer display a level/worth, it is impossible to calculate this reliably within the ui.
-added some checks to reset the UI xp/worth display once certain conditions are met


--balance changes
-range buff adjusted to max out at level 101, doubling range.
previously maxing out at level 41.
-movement speed adjusted maxes out at level 101, doubling speed.
previously maxing out at level 21 adding a 50% speed bonus.
-pgens autoxp gain rate lowered to 4 minutes again, improved buff accordingly


--known bugs
-AoE Damage can result in awarding XP multiple times.
game engine bug, t2 aa is especially troublesome.
(may adjust XP gain rates/BaseXP for affected units in a future version)
-ui may display enemy level inaccurate, there is nothing within reason to fix this.
game engine is unable to properly calculate at times
-UI may sometimes display shield HP for enemy units, will be fixed next revision
-BuilderXP, AutoXP threading start two threads each, one is paused when consumption is stopped, should be only one thread each and no gain when consumption is stopped.
-building missiles of any kind does not trigger BuilderXP, esp. not on commander
-Buff system gets called too often, high level jumps result in slowdowns.


TotalVeterancy_g v2 Final

--Compatibility
-All Units with the ACU or SCU categories set now gain the first 5 level +2/+200 eco buffs, this includes BlackOps ACU.


--bugs fixed
-rare ui bugs fixed, baseXp, enemy level lacked a check each
-buffs with a MaxLevel were set one level below intended
-units with a buildrate below 2 were getting build rate buffs
(all units have a buildrate of 1)
-units were gaining all possible buffs on levelup
-Sonars had no buff
-friendly fire disabled, killing own units gained you xp
-fixed AoE XP bug by awarding xp from OnKilled function
-Cybran SCU AA Damage wasn't doubled
-Silos of any kind, gain BuildXP, this includes ACUs and SCUs
-threading issue fixed, intel, shields, eco now gain half a level a minute
-UEF and Seraphim ACUs main weapon now have a projectile rendered in Strategic Overlay view.


--performance optimizations
-units now only gain buffs they need, major improvement, faster sim, less ram needed
-no longer hooking DoTakeDamage to register kills, big improvement
-ACUs and SCUs blueprint bufftable shrunk
-halved the XPOverTime threads, also removed half a dozen hooks

--UI/fx changes
-added fx for units achieving level 6,11,21,31,... etc., limited to weapon bearing units.
also visible to other players, though easy to miss on low levels.

--balance changes
-XP gains are the same for any unit, units with AoE used to gain XP multiple times
-max buildrange if not defined is now 10, helps declustering swarms of engineers and Sc's slightly
-Cybran SCU AA Damage is now doubled for real
-Time required to Teleport decreases a second each level, energy drain increases
-adjusted one enhancements strength and cost for Aeon and UEF ACU, increasing damage output
they can now compete with Cybran and Seraphim ACU's
-adjusted a Cybran ACU enhancements health bonus and cost, now the ACU can take more damage, still the easiest to kill.
-added Movement speed buff for commanders, starts at level 40, increases by+1%, no cap


--known bugs and issues
-(S)ACU movement speed buff can revert to default  if level is too high
-Shields throw errors, possibly related to a missing check

TotalVeterancy_g v2 b1 - working build 1
--Compatibility
-shields no longer gain hp on being damaged,helps blackops

--bugs fixed
-(S)ACU Speed buff now has upper cap of 940, including standard speed buff 
max speed is 10x, apparently extremely high speed can not be applied properly.
-shields no longer gain hp on being damaged, quick fix for shield disruptors creating errors 

--performance optimizations
-shields no longer gain hp on being damaged, less calculations

--balance changes
-(S)ACUs at level 200+ can now fire at air/subs with all weapons, 
however projectile limitations still apply, ie dispersing in/on water.
-Cybran SACU Cloaking Generator enhancement now gives 45.000 health bonus,cost adjusted
-Seraphim SACU Regen enhancement cost adjusted 

--known bugs and issues
-Shields may lack a IsDead check, seems resolved by removing xp gain on damage
-nukes don't get damage or AoE buffs
-Beam weapons do not get a damage buff
-upgraded shields do not carry over gained xp.

TVg V3 - TotalVeterancy Version 3
Introduced many changes which likely lower performance. If you have Data to gauge the severity please contact me via a Gaspowered Forum pm to member "Ghaleon".

--Compatibility


--Bugs fixed
-Beam Weapons now get damage buff.
-Nukes get damage buff, AoE buff disabled until preview Decal updates, too.
-Exploitative "fastbuilding" no longer awards XP boni, now all builders gain a bit more xp while they build at a higher resolution timer.
-Upgraded Shields carry over level, gain additional level for being upgraded. 
-Enhancement Shields get buffs applied  directly after being built, was after a level up.

--Performance optimizations
-this release features a few changes which have a negative impact on performance, 
in doubt please refer to TVg V2b1, it is the fastest build to date.
-levelup fx now is a thread which is killed if it is triggered again before the old one finished. Also can be disabled via "unit.disableSFX == true". helps my BlackBox map slightly.

--UI changes
-if auto revives exist, remaining count is displayed on unit Icon.
-storage buffs can be swapped on demand by clicking at the new button on the left near  the economy panel.

--Balance changes & New Features
-BuildxpThread updates every 3 seconds, price is a performance hit.
each 3 seconds you gain 10% needed to reach next level. first three seconds update at a per second interval.
-SiloXPThread updates every 6 seconds, awards 5% needed for next level.
-Stationary Shields gain a thread which checks every 4 seconds if it is damaged, awards 4% xp needed to level up. This replaces the OnDamage hook and reimplements extra xp gains for shields while they are damaged.
-Mobile Defense only Shields also gain the same amount of xp while being damaged.
-Cybran ACU Microwave Laser cost increased and Damage decreased to account for the Damage buff it now receives.
-Aeon Chrono Dampener moved from Back to Left Slot.
-Mobile non-Air Human controlled units with weapons gain a Auto-Revive at level 51 +1 
for each 50 gained levels. Revived units get their HP set to 1, Level reduced by 10, 
custom name cleared, Buildrate set to 0 and can't attack for level*3 seconds. This 
timer is displayed in-game to the owner, they are also invulnerable during this time. 
Unit which "killed" the unit gains xp and wreckage is also created. 
-Storages gain xp over time. buffing either mass or energy can be done via ui
-(S)ACUs fire at anything buff now applies at level 101.
-added button to increase AI mobile non air troops' level by 1, only appears if you are the only human playing.
-added detection logic for Single Player & Survival MP/MP games, Veterancy system changes depending on Sp/s /MP gameplay
-Weapons which require energy to fire will get the Energycost increased by the same increment damage increases on level up, ie. a weapon which has 100% damage buff at level 11 will also require 100% more energy to fire. 
-Enhancement Shields get buffed to proper strength immediately.
-Multiplayer, Buildxp increases at 1 level per minutes building
-SP/Survival, Buildxp increases at 2 levels per minute building
-MP, Autoxp increases at 1 level per 4 minutes
-SP/S, Autoxp increases at 1 level per 2 minutes
-MP Teleport time req decreases at 0.2~0.4 seconds a level, hitting cap of 3~6 seonds for ACU/SCUs respectively at around level 80~, other units cap out at 10 seconds
-SP/S Teleport time req decreases at around 0.5~1 seconds a level, hitting cap of 0.1 and 0.2 seconds for ACU/SCUs respectively, other units cap out at 1 second
-v3, added ability to disable build and silo xp for other mods 
-v3, revive unkillable timout starts at ~15 seconds, up to 45

--Known Bugs and issues
-buff ai-callback had a check using a nonexisting function and such failed
(buff enemy land ai units button wasn't working) 
-Invalid Weapon Blueprint merges can ctd since V2
-buff values are off, resulting in rounding errors due to game using single precision
-Aeon SACU has had ras buff not removed on enhancement removal
-mobile shields are not gaining xp as intended
-shields recharge on leveling up
-Storage Buff toggle had a error, toggling on unit levelup if energy buff was active

TVg V4 - TotalVeterancy Version 4

--Compatibility


--bugs fixed
-check implemented for faulty Weapon tables, fixes 4th-Dimension 1.91 ctd.
-game has improperly set bp values for cybran und UEF SACU's preventing proper ui preview of Energyproduction
-buff values adjusted to account for single precision and rounding
-Aeon SACU RAS fixed, buff wasn't removed on enhancement removal 
-Mobile shields were not gaining XP when damaged, fixed
-MP, leveling up does not recharge shields to max
-storage buffs got toggled on levelup if energy buff was active

--performance optimizations
-added another few sync entries for building veteran ui and sim>ui display
impacts performance slightly
-MP performance improvement, buildXP threads are gone for standard MP games
-replaced a few divisions in buff application

--UI & Visual changes
-added veteranbuilding option to constructionpanel
-unitview displays Veteran building state
-preview of cost changes for building veterans is displayed accordingly
-veteran unit being built displays tentative level during construction (- ~1) 
-Auto Revive Numbers displayed in lower left corner now.
-Next Level xp display now only displays the amount needed to next level, omitting the total value needed.
-lots of tooltips added to ui to explain various elements and mechanics.
-Explosions of Veterans are larger
-Buttons added to buff several AI unit types by a level 
-button added added to enable/disable buildxp for all units, also affects bo acus v2,9
-Ai tweak Buttonbar toggleable

--Balance changes & New Features
-build/siloxp triggers after 0.2 seconds instead of 1
-builders gain xpValue of created unit on completion adjusted by costs. 
-enhancements award xp on completing to be built.
-buildxp while building halved for SP/Survival, completely disabled for MP
-storage buffs increment at 40%
-MP balance: xpovertime increased from 25% xp a per minute to 34%
-silos will _not_ gain xp based on the missile costs, still limited to over time linear gains
-swapped sera acu weapon enhancements
-economy buildings are worth twice as much xp now
-veteran building option, units can gain xp on being built, 20% of the builders level when starting to build. m/e costs adjusted accordingly(20% extra per extra level). default is disabled, toggleable via ui
-each +25 levels a auto revive is gained, was 50
-revivee invincibility timeout range adjusted to 26~60 seconds 
-ShieldXP while damaged increased from 4% each 4 seconds to 10% each 4 seconds.
-Shields no longer recharge in MP games when leveling up
-SACU eco buff changed from 100>50 1>0.5 energy mass and subsequently 10>20 levels


--Known Bugs and issues
-Sera Advanced RAS enhancement makes ACU invincible if it was auto-revived,
-Several ACU enhancements are bugged.
-date back to stock Total Veterancy
 


TotalVeterancy_g v4.1

--Compatibility
-deprecated support to disable buildxp externally, no longer needed as mp gains are tied to costs

--bugs fixed
-uef,sera acu enhancements did not increase range
-uef acu t3 enhancement buff code fix
-sera acu had a buff error which made it invincible when revived
-onstopbuild could fail, code optimized
-Novax Satellite did not gain Veteranbuilding level buff.
-added checks to prevent negative xp additions
-construction drones now gain level of unit building them.
-projectiles don't gain xp for certain

--performance optimizations


--UI & Visual changes
-Player name of revived unit displayed
-SP, SP/MP Balance can be toggled via UI button
-Auto-Revives now have a very visible message displayed when triggered
-SP button status messages also more visible.

--Balance changes & New Features
-uef acu/scu drones unlock building options on hitting levels 6,11,21,31,41,51,61
all t1,t2-eco,all t2,t3-strategic,all t3,t4-strategic/sats,all t4
-revived units are fully invincible during the timeout period (26~60secs)
-implemented some of patch 3603 changes:
restorer speed reduced to 8,energy costs up to 60000, health to 6000, ground damage remains
Aeon and Sera t3 engineer buildrate increased from 15>20
Aeon mercy Fuel buffed from 70>110
Cybran Fire Beetle Damage buffed to 4500,radius 3,randomness to 100,health reduced from 750 to 300, 
No Nuke, all nukebearing vessels and buildings not buildable incld. t4 and subs.
No Gameender, all t3 arty, t4 arty/nukes/sats not buildable, t3 nukes/subs unaffected. 
-Quantum Gates can now build all Land units of their respective faction


--Known Bugs and issues
-Final Rush Pro map fails loading if no restrictions are set, TVg V4.2 fixes this. 

TotalVeterancy_g v4.2

--Compatibility
-FinalRush Pro map now loads without issues if no  restrictions are set

--bugs fixed
-Final Rush Pro compatibility fix

--Known Bugs and issues
-Score and Team initialization failed due to the above hastily implemented code fix


TotalVeterancy_g v4.3

--Compatibility
-FinalRush Pro map now always loads without issues, regardless if restrictions are set

--bugs fixed
-Final Rush Pro compatibility fix
-Initialization, Alliance and Score issues are resolved, only v4.2 was affected

--Balance changes & New Features
No Nukes / No Gameenders restrictions apply to all units with the proper categories set. Also affects custom units ie. Blackops Family and 4th-Dimension  


--Known Bugs and issues
-since v3: auto revive did not take into account if player was defeated
-since stock fa:buff removal code could error things out, breaking auto revive among other things
-since v4: ui error with new veteranbuilding option


TotalVeterancy_g v4.4

--bugs fixed
-auto-revive no longer occurs if you're defeated.
-UI error pertaining to veteranbuilding option fixed
-hp buff application code fix
-buff removal function could error out things, hotfixed this so it doesn't, 
needs investigation why it happens for a thorough fix
-explosions were too large

--Balance changes & New Features
-MP: Auto revive capped to 3
-MP: max Timout 45 seconds down from 60  

--Known Bugs and issues
-veterans built can sometimes have negative levels or otherwise messed up buffs or stats, difficult to reproduce, hopefully fixed in version after this one
-enhancements were always awarding extra xp regardless of veteranbuild option status
-buildxp toggle status message displayed was static

TotalVeterancy_g v4.5

--bugs fixed
-veteranbuild option only sticks to a built unit if its builder is beyond level 5
hopefully fixes vetbuilt units bugging out on level gains
-enhancements are no longer affected by vetbuild option
-possible fix for exp constructed not always gaining veteran bonus.
-cosmetic, SP, BuildXP status message fixed 

--performance optimizations


--UI & Visual changes


--Balance changes & New Features
MP: enhancements always award xp based on costs.
SP: enhancements award extra xp scaled by level.
MP: On defeat of an army its unit cap is spread evenly among its allies
3603 balance change: 
Cybran/Sera T2 PD damage adjusted

--Known Bugs and issues
-Veteranbuilt units sometimes don't receive the paid for improvements, since v4

TotalVeterancy_g v4.6

--bugs fixed
-Missing buffs on veteranbuilt unit hopefully fixed
-Unitcap spillover from defeated allies now rounds up
-mex upgrade/pausing bug fix from patch 3603 by Ragnarok_X, Combine and Gowerly

--Balance changes & New Features
-Overcharge energy costs increased from 3000 to 5000
-Overcharge now requires energy be available before being able to shoot.
-Economy gets storage based on output (energy 10x / mass 65x) doesn't affect (S)ACU's

--Known Bugs and issues
-ACU Overcharge change results in unwanted lack of energy at Gamestart
-Since v3, Auto Revive prerequisite enhancements were not applied on a revived unit, 
resulting in missing enhancement effects on custom ACU's.
-since v3, teleporting units which died *could* (still need replay) spawn a line of revived units.


TotalVeterancy_g v4.7

--performance changes
-localized some functions, improving performance minimally
-Missile and Projectile redirection code changes
this can affect performance adversely, if you find loyalist spam to significantly
reduce simspeed please notify me, thanks!
-units' forked threads put to trashbag, uncertain of benefit.
-Storage Buffs also enabled for AI

--bugs fixed
-ACU Overcharge drain on Gamestart offset.
-some scripts and blueprints patched to make the new Deathnuke damage type work as intended
-Missile Redirection no longer "returns to sender"
-Auto Revive, prereq enhancements are now all queried and applied
-Auto Revive and Teleportation unit multiplication should no longer happen

--Compatibility
-Auto-Revive compatibility for custom ACU's improved, ie. BO.ACU's

--Balance changes & New Features
-Aeon ACU Chrono Dampener now affects buildings, Enemy ACUs and Experimentals are still unaffected
-Seraphim Advanced Regen Aura Enhancement no longer limited to +200hp/s regen, costs doubled 
-Seraphim Regen Aura Radius is also affected by AoE buff, max is level21 when its AoE is doubled
-Aeon SCU Sacrifice efficency increased from 60% to 100%
-Support Commanders take half damage from Overcharge, 10% of death nuke damage.
-Support Commanders do double damage against ACU's and Experimentals.
-patch 3603 armor definitions imported
-ACU Deathnukes changed to do 45000/5000 damage
-ACUs now take 1/3 damage of Overcharge instead of 1/30
-AI now also receives Storage Buffs
-Teleport time reduction cap in MP changed from 3/6/10 to 6/10/15 ACU/SCU/other
-Tech over Time mod recognized, when enabled will set MP balance
-Auto-Revive: During invincibility phase shots are deflected randomly towards shooter, if unit was level 150+ the effect increases. After invincibility phase a different deflection sets in, allowing the unit to flee, duration: 3 minutes.
-MP: enhancements award *less xp after reaching level 50. *-(level*0.8)% (4% min at level 96+) 

--UI & Visual changes
-explosion scale reduced, changed to linear progression
-Auto-Revived units now deflect all incoming projectiles randomly, deflected projectiles damage friendly, looks cool, rarely hits enemies


TotalVeterancy_g v4.8


--performance changes
-shrunk buff definitions, improves performance
-Jumping, takes about the same performance as moving, takes less time than ordering a standard formation.

--bugs fixed
-patched Entitytext, it now always displays unit text regardless of Zoom. this affects the new jump fail messages, as well as countdowns above units.
-a quick fix for redirection script
-teleport time caps in MP were messed up in v4.7, are now fixed to 6/10/15


--Compatibility

--Balance changes & New Features
-Jumping:
ACU's and SCU's can now jump over a short distance.
Press the new button and select a target destination by mouseclick. 
modifiers: (when pressing the new button, not selecting destination)
Right Click:Formation jump. All units will retain their relative positions while jumping.
Shift: shallow jump(.5x) 
Ctrl: high leap(2x)


Default group jump sort units in a square.
OrderQueue is emptied upon jumping.
Range octagon is a rough estimate, maximum jump length is determined by distance to target, to jump on top of a mountain you need to get closer.
modifiers do not affect length of a jump, only height.
In order to jump from Isis top left to top right you need about ten jumps.
If you order a jump below the minimum or beyond the maximum range a unit text will notify you.
units will still try and walk to the destionation you selected.
Once you pressed the jump button you have to select a target, to cancel just select a target out of range.
You can not jump out of Map.Your jumping unit is still targetable while jumping.
Your jumping unit will fire on units below.
Units can not be re-selected by the owner while they're jumping if you de-select them.
A jump order stops a enhancement task.

You can not shift-queue jumps. -this is possible but may introduce a yet to be determined lag.

MP
required level to jump ACU >31 / SCU >11
Force AreaDamage range 30~800 depending on length and height of the jump
Cost: 2500 mass* height modifier of the jump (.5x-2x) per unit each jump, units will not jump until after cost has been paid.

SP/Coop
ACU/SCU can always jump
Force AreaDamage range 3~4200 depending on length and height of the jump.
no costs

-MP: enhancements award *less xp after reaching level 26. *-(level*0.8)% (4% min at level 96+)
-SP: AI's can now build veterans, default is disabled (if you think this needs to be enabled by default, tell me.) 
All following AI units are affected.

-Aeon ACU Chrono Dampener energycosts per shot increased from 200 to 10000, also increase +10% each gained level, as all other weapons requiring energy to fire. 
added preview for base energy drain, sans increase per level.
cost adjusted, enhancement now takes longer to build and 4 times the energy.
-MP: post autorevive projectile redirection now limited to 15 seconds
-patched S(ACU) projectiles to allow firing into water (affects only those level 101+) 
still not possible to fire from under water, except with tacticals.

--UI & Visual changes
Jumping:
Small explosion upon jumping, smoketrail on jumper. including per Faction sound for liftoff and landing.
Exhaustive tooltip for new button, ~1 second delay


--Known Bugs and issues
-since V4 reclaim/repairing exploit allowed a builder to gain levels extremely fast.

TotalVeterancy_g v4.81

--bugs fixed
-Fixed instagain xp exploit, a big Thank you to Typo91 and Habeed for making me aware of the issue!

--Known Bugs and issues
-jumping, mp does not work, was fixed in 4.82
-since 4.8, some useless testcode enhancement


TotalVeterancy_g v4.82

--bugs fixed
-Jumping, mp works now, should've taken more time to check things, sorry.
-removed useless testcode
-killing allied units no longer awards you xp.
-shield toggle exploit fixed for MP, added extra logic to still 
allow it as feature in SP/Coop

--Balance Changes
-imported patch3603 shield state changes, this fixes the shield 
toggling exploit, pre 3603 game is responsible for the shield 
toggle exploit, not tvg. This affects MP, SP/Coop still have the toggling allowed as a feature.
-killing allied units no longer nets you any xp



TotalVeterancy_g v4.83


--Balance Changes/new Features
-Cloaked units are no longer attacked once they are invisible again.
this currently only affects single units, not cloak fields, i think

--UI & Visual changes
-mini-layout, moved unitview up, level display is no longer blocked by jump button

--Known Bugs and issues
-(MP) since 4.8, unit was not immobilized during Jump charge phase
-Radar/Sonar did not carry over level on being upgraded

TotalVeterancy_g v4.84 nightly build

--UI & Visual changes
-Mini-layout, build preview moved up to make room for jump icon
-Full unitview stats can be seen as observer in replays
-All engineers should now be capable to toggle veteranbuilding, fix for Alien nations' flying engineers

--Known Bugs and issues
-longstanding issue, not checking a blueprint manipulation

TotalVeterancy_g v4.85

--bugs fixed/Compatibility
-added a check to blueprint manipulation, fixes 4DC issue.

--Balance Changes
-MP: Auto-Revive, Invulnerability projectile reflection changed to deflection,
duration capped to 20 seconds, max Auto-revives capped to 2, 
Auto-Revived units immediately drain 10% of Mass/Energy cost*revived level,
SP Auto-Revive unchanged.

-Tactical Missile Enhancements for UEF/Seraphim commander Mass/Time cost 
increased from 1000 to 2000 


-On Levelup Storage Buffs could swap erratically
-non human players when controlled by humans result in logspam
-Radar/Sonar do not carry over level when upgraded
-Seraphim ACu projectile was tracking target


TotalVeterancy_g v4.86


--performance optimizations
-cleaned jumpcode much more
-two buff definitions merged, slight performance gain

--bugs fixed
-Jump charge phase, unit is now immobile, can't abort charge.
-seraphim acu projectile was tracking target, fixed
-Radar/Sonar also carry over level on being upgraded 
-GPG's unit:GetHealthPercent() was not taking current maxhp into account, only bp values, fixed
-Mass/Energy Storage buffs were ill behaving at times, hopefully fixed
-Switching to AI armies could error out Avatars, fixed

--Balance Changes/new Features
-MP: Enhancements award xp 25 times, diminishing returns still apply. 
-MP: Auto-Revived Units don't need to charge/pay to jump while timer is active.
-Jumping - Dance of Death:
triggered while firing at an enemy unit, clicking the jump button+'ALT'
within 3 seconds the unit needs to lock on to nearby target.
it then will jump around this unit, firing at it until one of the two is dead.
Try this with two opposing ACU's at the same time, looks awesome.
-Jumping - Bulletstorm:
Click Jump Button while pressing CTRL. 
Command unit will Hover upwards and unleash a barrage of bullets.
Each factions' Bulletstorm have their own characteristics, Shells differ:
Aeon - Salvation Shells, Cybran - Scattershot, UEF - Mavor Shells
Seraphim - Tempest Shells
As do the respective Buffs.
ie: Aeon has a short range but devastating AoE, Cybran the best accuracy, Seraphim massive damage,splash, low accuracy, UEF the best visuals.


Including a very visible Special Effects assortment.
-Quantum Gates build planes.
-Group XP, on killing an enemy unit all opposing forces in a radius  around the death unit will gain XP, currently SP only, needs to be toggled via ui. 

--UI & Visual changes
-Jump charge phase got fx
-SP: Jumping now occurs at a higher resolution
-SP: Group XP can be toggled bia button
-Type of revived unit is now announced to all players
-when curving bullets effect is activated, effected units display a swirling effect around it
-CZAR and Ahwassa now crash into/below water and leave wreckage
-Mass/Energy Buff status is now displayed


--Compatibility
-Some more BO ACU fix, ACU's now got proper xp bases again

--Known Balance issues
-Jumping speed & costs need to be finalized, 
maybe add a cooldown, which requires too much work to do, sim/ui syncing, last resort.
-Projectile redirection after Auto Revive, neither time nor effect strength is ideal, goal is to offer unit a way to escape repeated death while preventing abuse due to the virtual invincibiility the redirection offers.
-Area Stunning, a very powerful effect, requires offsetting its huge gain, can't have a 'iwin' button in MP.


--Known Bugs and issues
-gaining more than one level at a time is a resource hog still, can't directly apply
buffs to a given level yet, requires major rework of buff code.
depending on unit, much less severe than in versions prior to v2 though
-some range rings do not update properly, ie Cybran Soothsayer, t2 arty does update but not fire up to the displayed area.
-t2 tml needs a lifetime increase to use max range buffs.
-nukes still don't respect friendly fire option. - can be fixed but due to possibility of exploits remains as is
-Strategic Overlay impact effects are enabled only for Sera ACU and
Aeon SCU
-BO ACU's are not fully supported, some enhancements need to be converted to Buff system.
-BO Unleashed/BO ACU's interfere with Regen.
-campaign ui stops displaying negative income (construction drain) for acus once they level up
-campaign, auto-revive will not stop failing a campaign mission if it is triggered.
-veteranbuilding can award a extra level at times
-stock FA shield.lua does not check if a unit is alive when applying shield regen, can lead to a single error if a unit with a shield dies too fast, a future version may patch the official shield.lua for this.
-Jumping: pathfinding may still throw off some units while jumping, don't give them direct move orders while they jump.
-Jumping, ACU/SCU personal shields don't protect while in the Air
can be fixed, but since units are very hard to hit while in the air anyway, I'm leaving it for some other time.
-Jumping, AA will not engage jumping units, don't know if it can be fixed, doubt it.
-Jumping charge phase, can not be aborted
