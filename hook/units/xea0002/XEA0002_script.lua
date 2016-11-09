local oldXEA0002 = XEA0002
XEA0002 = Class(oldXEA0002) {
    AddXP = function(self, amount)
        self.Parent:AddXP(amount)
        oldXEA0002.AddXP(self, amount)
    end,
}
TypeClass = XEA0002