enum EPlayerData
{
    id_database,
    skin,
    money,
    family
}
static PlayerData[MAX_PLAYERS][EPlayerData];

stock LoadPlayerAccount(playerid) {
    PlayerData[playerid][id_database] = 0;
    PlayerData[playerid][skin] = 68;
    PlayerData[playerid][money] = 1500;
    PlayerData[playerid][family] = -1;

    SetPlayerSkin(playerid, PlayerData[playerid][skin]);
    GivePlayerMoney(playerid, PlayerData[playerid][money]);
    return 0;
}

/* Gets */
GetPlayerFamily(playerid)
{
    return PlayerData[playerid][family];
}

SetPlayerFamily(playerid, familyid) {
    return PlayerData[playerid][family] = familyid;
}

GetIdDatabasePlayer(playerid) 
{
    return PlayerData[playerid][id_database];
}