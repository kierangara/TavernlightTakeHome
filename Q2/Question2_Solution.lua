function printSmallGuildNames(memberCount)
-- this method is supposed to print names of all guilds that have less than memberCount max members
-- The given code only attempted to print one guild
-- We need to loop through all the guilds from the result and print them
    local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;"
    local resultId = db.storeQuery(string.format(selectGuildQuery, memberCount))
--While there are results, loop through printing the names of the guilds
    if resultId then
        repeat
            local guildName = result.getString("name")
            print(guildName)
        until not result.next(resultId)
        result.free(resultId) --Good practice to free resources when done
    end
end