local LayoutHelpers = import('/lua/maui/layouthelpers.lua')
local Tooltip = import('/lua/ui/game/tooltip.lua')
local Button = import('/lua/maui/button.lua').Button
local UIUtil = import('/lua/ui/uiutil.lua') function SwapButton(parent)
    local meButton = Button(parent, UIUtil.UIFile('/game/mfd_btn/economy_btn_up.dds'), UIUtil.UIFile('/game/mfd_btn/economy_btn_down.dds'), UIUtil.UIFile('/game/mfd_btn/economy_btn_over.dds'), UIUtil.UIFile('/game/mfd_btn/economy_btn_dis.dds')) meButton.Left:Set(function()
    return parent.Left() + 0
end) meButton.Top:Set(function()
    return parent.Top() + 60
end)
    meButton.OnClick = function() SimCallback({
        Func = 'ToggleMEStorage',
        Args = {
            owner = GetFocusArmy()
        }
    })
    end
    meButton.Depth:Set(100) meButton:EnableHitTest(true) meButton:Show() Tooltip.AddButtonTooltip(meButton, 'ToggleMEStorage', 0.2)
end

function ToggleButtons(parent)
    local Group = import('/lua/maui/group.lua').Group
    group = Group(parent) LayoutHelpers.AtLeftTopIn(group, parent, 0, 0) group.Height:Set(1) group.Width:Set(1)
    local BuffAIs = UIUtil.CreateButtonStd(group, '/game/mfd_btn/military') Tooltip.AddButtonTooltip(BuffAIs, 'BuffAIs', 0.4) LayoutHelpers.AtLeftTopIn(BuffAIs, group, 40, 60)
    BuffAIs.OnClick = function() SimCallback({
        Func = 'BuffAIs',
        Args = {
            owner = GetFocusArmy()
        }
    })
    end
    local BuffButtonDef = UIUtil.CreateButtonStd(group, '/game/mfd_btn/defenses') LayoutHelpers.AtLeftTopIn(BuffButtonDef, group, 70, 60)
    BuffButtonDef.OnClick = function() SimCallback({
        Func = 'BuffButtonDef',
        Args = {
            owner = GetFocusArmy()
        }
    })
    end
    Tooltip.AddButtonTooltip(BuffButtonDef, 'BuffButtonDef', 1.2)
    local bButtonBase = UIUtil.CreateButtonStd(group, '/game/mfd_btn/control') LayoutHelpers.AtLeftTopIn(bButtonBase, group, 100, 60)
    bButtonBase.OnClick = function() SimCallback({
        Func = 'bBBase',
        Args = {
            owner = GetFocusArmy()
        }
    })
    end
    Tooltip.AddButtonTooltip(bButtonBase, 'bBBase', 1.2)
    local bButtonS = UIUtil.CreateButtonStd(group, '/game/mfd_btn/ping-move') LayoutHelpers.AtLeftTopIn(bButtonS, group, 130, 60)
    bButtonS.OnClick = function() SimCallback({
        Func = 'BuffAIsSea',
        Args = {
            owner = GetFocusArmy()
        }
    })
    end
    Tooltip.AddButtonTooltip(bButtonS, 'BuffAIsSea', 0.4)
    local bButtonA = UIUtil.CreateButtonStd(group, '/game/mfd_btn/ping-attack') LayoutHelpers.AtLeftTopIn(bButtonA, group, 160, 60)
    bButtonA.OnClick = function() SimCallback({
        Func = 'BuffAIsAir',
        Args = {
            owner = GetFocusArmy()
        }
    })
    end
    Tooltip.AddButtonTooltip(bButtonA, 'BuffAIsAir', 0.4)
    local AIVetBuild = 4
    local AIVButton = UIUtil.CreateButtonStd(group, '/game/mfd_btn/military-radar') LayoutHelpers.AtLeftTopIn(AIVButton, group, 190, 60)
    AIVButton.OnClick = function() SimCallback({
        Func = 'AIVetBuildEnabled',
        Args = {
            owner = GetFocusArmy(),
            enabled = AIVetBuild
        }
    })
        if AIVetBuild > 0 then
            AIVetBuild = 0
        else
            AIVetBuild = 4
        end
    end
    Tooltip.AddButtonTooltip(AIVButton, 'AIVetBuildEnabled', 0.4)
    local BuildXPEnabled = 1
    local bxpButton = UIUtil.CreateButtonStd(group, '/game/mfd_btn/team-color') LayoutHelpers.AtLeftTopIn(bxpButton, group, 220, 60)
    bxpButton.OnClick = function() SimCallback({
        Func = 'BuildXPEnabled',
        Args = {
            owner = GetFocusArmy(),
            enabled = BuildXPEnabled
        }
    })
        if BuildXPEnabled > 0 then
            BuildXPEnabled = 0
        else
            BuildXPEnabled = 1
        end
    end
    Tooltip.AddButtonTooltip(bxpButton, 'BuildXPEnabled', 0.4)
    local ShareXPEnabled = true
    local sxpButton = UIUtil.CreateButtonStd(group, '/game/mfd_btn/team-color') LayoutHelpers.AtLeftTopIn(sxpButton, group, 250, 60)
    sxpButton.OnClick = function() SimCallback({
        Func = 'ShareXPEnabled',
        Args = {
            owner = GetFocusArmy(),
            enabled = ShareXPEnabled
        }
    })
        --TODO: FIX lolwut!
        if ShareXPEnabled then
            ShareXPEnabled = false
        else
            ShareXPEnabled = true
        end
    end
    Tooltip.AddButtonTooltip(sxpButton, 'ShareXPEnabled', 0.4)
    local togglebalance = true
    local TBButton = UIUtil.CreateButtonStd(group, '/game/mfd_btn/team-color') LayoutHelpers.AtLeftTopIn(TBButton, group, 280, 60)
    TBButton.OnClick = function() SimCallback({
        Func = 'ToggleBalance',
        Args = {
            owner = GetFocusArmy(),
            ToggleBalance = togglebalance
        }
    })
        --TODO: FIX lolwut!
        if togglebalance == true then
            togglebalance = false
        else
            togglebalance = true
        end
    end
    Tooltip.AddButtonTooltip(TBButton, 'ToggleBalance', 0.4)
    local Checkbox = import('/lua/maui/checkbox.lua').Checkbox
    expandCheck = Checkbox(parent, UIUtil.SkinnableFile('/game/tab-l-btn/tab-open_btn_up.dds'), UIUtil.SkinnableFile('/game/tab-l-btn/tab-close_btn_up.dds'), UIUtil.SkinnableFile('/game/tab-l-btn/tab-open_btn_over.dds'), UIUtil.SkinnableFile('/game/tab-l-btn/tab-close_btn_over.dds'), UIUtil.SkinnableFile('/game/tab-l-btn/tab-open_btn_dis.dds'), UIUtil.SkinnableFile('/game/tab-l-btn/tab-close_btn_dis.dds')) LayoutHelpers.AtLeftTopIn(expandCheck, group, 33, 61)
    expandCheck.OnCheck = function(self, checked)
        if checked then
            group:Hide()
        else
            group:Show()
        end
    end
    expandCheck.Depth:Set(110) expandCheck:EnableHitTest(true) expandCheck:Show() group.Depth:Set(100) group:EnableHitTest(true) group:Show()
end

local originalCreateUI = CreateUI
function CreateUI(isReplay)
    originalCreateUI(isReplay)
    if isReplay == false then
        local parent = import('/lua/ui/game/borders.lua').GetMapGroup() SwapButton(parent)
        if SessionIsMultiplayer() == false then
            ToggleButtons(parent)
        end
    end
end