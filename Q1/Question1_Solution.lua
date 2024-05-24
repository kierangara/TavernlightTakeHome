--Check for valid player reference. If valid then release storage
local function releaseStorage(playerId)
    local player = Player(playerId)
    if player then
        player:setStorageValue(1000, -1)
    end
end

--Pass the player ID instead of the player object to release storage
--This is more secure as we can ensure the player reference is still valid after the 1s delay
--Generally get "Argument is unsafe error" if don't do this
function onLogout(player)
    if player:getStorageValue(1000) == 1 then
        addEvent(releaseStorage, 1000, player:getId())
    end
    return true
end