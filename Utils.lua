
function getDeckFromAreaGUID(areaGuid)
    local area = getObjectFromGlobalGUID(areaGuid)
--[[     if area == nil then
        area = getObjectFromGUID(areaGuid)
    end --]]
    local objs = area.getObjects()
    if objs[1].tag == 'Deck' or objs[1].tag == 'Card' then
        return objs[1]
    else
        return nil
    end
end

function takeCardFromDeckOrCard(deck_or_card, position, flip)
    if deck_or_card.tag == "Deck" then
        deck_or_card.takeObject({position=position, flip=flip})
    else
        if flip then deck_or_card.flip() end
        deck_or_card.setPositionSmooth(position, false, false)
    end
end

function getObjectFromGlobalGUID(gguid)
    return getObjectFromGUID(Global.getVar(gguid))
end