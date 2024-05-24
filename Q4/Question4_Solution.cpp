void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId)
{
	Player* player = g_game.getPlayerByName(recipient);
	if (!player) {
		player = new Player(nullptr);
		if (!IOLoginData::loadPlayerByName(player, recipient)) {
			delete player; //Deallocate player memory if it wasn't able to be loaded properly
			return;
		}
	}

	Item* item = Item::CreateItem(itemId);
	if (!item) {
		delete item; //Deallocate item memory if it wasn't able to be created properly
		delete player; //Deallocate player memory if couldn't add item
		return;
	}

	g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

	if (player->isOffline()) {
		IOLoginData::savePlayer(player);
	}

	delete item; //Deallocate item and player memory once done
	delete player;
}