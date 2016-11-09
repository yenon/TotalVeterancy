local TStructureUnit = import('/lua/terranunits.lua').TStructureUnit
local oldXEB2402 = XEB2402
XEB2402 = Class(oldXEB2402) {
    OpenState = State() {
        Main = function(self)
            oldXEB2402.OpenState.Main(self)
            if self.Satellite and IsUnit(self.Satellite) and self.LevelProgress and self.LevelProgress > 1 then
                self.Satellite:AddLevels(self.LevelProgress - 1)
            end
        end,
    },
}
TypeClass = XEB2402