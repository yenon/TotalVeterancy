local UIUtil = import('/lua/ui/uiutil.lua')
local LayoutHelpers = import('/lua/maui/layouthelpers.lua')
local Grid = import('/lua/maui/grid.lua').Grid
local Button = import('/lua/maui/button.lua').Button
local Bitmap = import('/lua/maui/bitmap.lua').Bitmap
local Checkbox = import('/lua/maui/checkbox.lua').Checkbox
local Tooltip = import('/lua/ui/game/tooltip.lua') function LayoutTabs(controls)
    local prevControl = false
    local tabFiles = {
        construction = '/game/construct-tab_top_btn/top_tab_btn_',
        selection = '/game/construct-tab_top_btn/mid_tab_btn_',
        enhancement = '/game/construct-tab_top_btn/bot_tab_btn_',
    }
    local techFiles = {
        t1 = '/game/construct-tech_btn/t1_btn_',
        t2 = '/game/construct-tech_btn/t2_btn_',
        t3 = '/game/construct-tech_btn/t3_btn_',
        t4 = '/game/construct-tech_btn/t4_btn_',
        templates = '/game/construct-tech_btn/template_btn_',
        LCH = '/game/construct-tech_btn/left_upgrade_btn_',
        RCH = '/game/construct-tech_btn/r_upgrade_btn_',
        Back = '/game/construct-tech_btn/m_upgrade_btn_',
    }
    local function GetTabTextures(id)
        if tabFiles[id] then
            local pre = tabFiles[id]
            return UIUtil.UIFile(pre .. 'up_bmp.dds'), UIUtil.UIFile(pre .. 'sel_bmp.dds'), UIUtil.UIFile(pre .. 'over_bmp.dds'), UIUtil.UIFile(pre .. 'down_bmp.dds'), UIUtil.UIFile(pre .. 'dis_bmp.dds'), UIUtil.UIFile(pre .. 'dis_bmp.dds')
        else
            if techFiles[id] then
                local pre = techFiles[id]
                return UIUtil.UIFile(pre .. 'up.dds'), UIUtil.UIFile(pre .. 'selected.dds'), UIUtil.UIFile(pre .. 'over.dds'), UIUtil.UIFile(pre .. 'down.dds'), UIUtil.UIFile(pre .. 'dis.dds'), UIUtil.UIFile(pre .. 'dis.dds')
            end
        end
        local function SetupTab(control) control:SetNewTextures(GetTabTextures(control.ID)) control:UseAlphaHitTest(false)
            control.OnDisable = function(self) self.disabledGroup:Enable() Checkbox.OnDisable(self)
            end
            control.disabledGroup.Height:Set(25) control.disabledGroup.Width:Set(40) LayoutHelpers.AtCenterIn(control.disabledGroup, control)
            control.OnEnable = function(self) self.disabledGroup:Disable() Checkbox.OnEnable(self)
            end
        end

        local function KillSwitch()
            if controls.vetbutton2 then
                controls.vetbutton2:Destroy()
                controls.vetbutton2 = nil
            end
        end

        local function Builders()
            local units = ValidateUnitsList(import('/lua/ui/game/construction.lua').retOptions())
            if units ~= nil and type(units) == 'table' then
                units = EntityCategoryFilterDown(categories.SHOWQUEUE + categories.ueb4202, units)
            end
            return units
        end

        local function ExportBuilders()
            local tab = {}
            for k, v in Builders() do
                table.insert(tab, v:GetEntityId())
            end
            return tab
        end

        local function CheckEnabled()
            if Builders() and table.getsize(Builders()) > 0 then
                for k, v in Builders() do
                    if UnitData[v:GetEntityId()].vetToggle == 0 then
                        UnitData[v:GetEntityId()].vetToggle = nil
                    end
                    if UnitData[v:GetEntityId()].vetToggle ~= nil then
                        UIUtil.SetNewButtonStdTextures(controls.vetbutton2, '/game/construct-tech_btn/t4')
                    else
                        UIUtil.SetNewButtonStdTextures(controls.vetbutton2, '/game/construct-tech_btn/t1')
                    end
                end
            end
        end

        if table.getsize(controls.tabs) > 0 then
            for id, control in controls.tabs do
                SetupTab(control)
                if not prevControl then
                    LayoutHelpers.AtLeftTopIn(control, controls.minBG, 134, 60)
                else
                    local offset = 0 LayoutHelpers.Below(control, prevControl, offset)
                end
                prevControl = control
            end
        end
        SetupTab(controls.constructionTab) LayoutHelpers.AtLeftTopIn(controls.constructionTab, controls.constructionGroup, 20, 7) SetupTab(controls.selectionTab) LayoutHelpers.RightOf(controls.selectionTab, controls.constructionTab, 0) SetupTab(controls.enhancementTab) LayoutHelpers.RightOf(controls.enhancementTab, controls.selectionTab, 0)
        local vetoffset = 122
        if table.getsize(controls.tabs) == 5 then
            KillSwitch()
            controls.vetbutton2 = UIUtil.CreateButtonStd(prevControl, '/game/construct-tech_btn/t1') CheckEnabled() Tooltip.AddButtonTooltip(controls.vetbutton2, 'ToggleVet2', 0)
            controls.vetbutton2.defHandleEvent = controls.vetbutton2.HandleEvent
            controls.vetbutton2.HandleEvent = function(self, event)
                if event.Type == 'MouseEnter' or event.Type == 'MouseMotion' then
                    CheckEnabled()
                end
                return self.defHandleEvent(self, event)
            end
            controls.vetbutton2.OnClick = function(self, modifiers)
                local tab = ExportBuilders() SimCallback({
                Func = 'ToggleVeteranBuilding2',
                Args = {
                    owner = GetFocusArmy(),
                    units = tab
                }
            }) CheckEnabled()
            end
            LayoutHelpers.Above(controls.vetbutton2, prevControl, vetoffset)
        else
            KillSwitch()
        end
    end
end