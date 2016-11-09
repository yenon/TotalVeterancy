local function PrintText(text, fontSize, fontColor, duration, location, army)
    if not text and location then
        WARN('Trying to print text with no string or no location.')
        return false
    else
        if not Sync.PrintText then
            Sync.PrintText = {}
        end
        table.insert(Sync.PrintText, {text = text, size = fontSize, color = fontColor, duration = duration, location = location, army = army})
    end
end

local function FloatingEntityText(entityId, text,size,font,color,LoD,Fade)
    if not entityId and text then
        WARN('Trying to float entity text with no entityId or no text.')
        return false
    else
        if GetEntityById(entityId):GetArmy() == GetFocusArmy() then
            if not Sync.FloatingEntityText then
                Sync.FloatingEntityText = {}
            end
            table.insert(Sync.FloatingEntityText, {entity = entityId, text = text, size = size , color = color, LoD = LoD, Fade = Fade})
        end
    end
end