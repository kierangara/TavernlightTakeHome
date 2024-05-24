--This function searches for the party member with name membername in the party
--and removes them if they are in the party
--Changed name to match the purpose
function removeMemberFromParty(playerId, membername)
    player = Player(playerId)
    local party = player:getParty()
    
    --Added check for if player isn't in a party
    if not party then
        print("Player is not in a party")
        return
    end

    --The first value in the pair returned by getMembers is just the table index of the member
    --We don't need this so use placeholder instead of k.
    --The second value is the member name so rename v to member
    for _, member in pairs(party:getMembers()) do
        if member == Player(membername) then
            party:removeMember(Player(membername))
        end
    end
end
--Could have added notice if member not found in party but since no notice of member found
--in original script decided not to