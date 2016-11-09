oldSetLayout = SetLayout
function SetLayout()
    oldSetLayout()
    local control = import('/lua/ui/game/unitviewDetail.lua').View
    local OrderGroup = false
    if not SessionIsReplay() then
        OrderGroup = import('/lua/ui/game/orders.lua').controls.bg
    end
    if OrderGroup then
        LayoutHelpers.Above(control, OrderGroup, 27)
    end
end