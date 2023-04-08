enum EPlayerData
{
    id_database,
    password[128],
    skin,
    money,
    family
}
static PlayerData[MAX_PLAYERS][EPlayerData];

forward OnAccountCheck(playerid);
forward OnAccountLoad(playerid);

stock LoadPlayerAccount(playerid)
{
    SendClientMessage(playerid, -1, "[DEBUG] LoadPlayerAccount");
    new query[57 + MAX_PLAYER_NAME + 1], playerName[MAX_PLAYER_NAME + 1];
    GetPlayerName(playerid, playerName, sizeof(playerName));
    mysql_format(mysql, query, sizeof(query),"SELECT * FROM `users` WHERE `username` = '%s' LIMIT 1", GetPlayerNameEx(playerid));
    mysql_tquery(mysql, query, "OnAccountLoad", "i", playerid);
}

hook OnPlayerRequestClass(playerid, classid)
{
    if(IsPlayerNPC(playerid))
        return 1;

    TogglePlayerSpectating(playerid, true);

	new strPlayer[128];
	format(strPlayer, sizeof(strPlayer), "\t\tOlá, {586ea4}%s. {dcdad3}Atualmente servidor está em desenvolvimento.", GetPlayerNameEx(playerid));

	SendClientMessage(playerid, 0xff0054FF, "Bem-vindo ao waldisney.mp");
	SendClientMessage(playerid, 0xdcdad3FF, strPlayer);
	
    new query[100 + MAX_PLAYER_NAME];
    mysql_format(mysql, query, sizeof(query),"SELECT * FROM users WHERE `username` = '%e' LIMIT 1", GetPlayerNameEx(playerid));
    mysql_tquery(mysql, query, "OnAccountCheck", "i", playerid);

    return 1;
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

GetPasswordPlayer(playerid) 
{
    new str[128];
    format(str, 128, PlayerData[playerid][password]);
    
    return str;
}

/** ABC **/
public OnAccountCheck(playerid)
{
	new rows, fields;
    cache_get_row_count(rows);
    cache_get_field_count(fields);
	if(rows > 0)
	{
        cache_get_value_name(0, "password", PlayerData[playerid][password]);
        SendClientMessage(playerid, 0xdcdad3FF, "\t\tEncontrei sua conta em nosso sistema, utilize o comando {586ea4}/entrar {dcdad3}para autenticar no servidor.");
	}
    else
    {
        SendClientMessage(playerid, 0xdcdad3FF, "\t\tPercebi que você ainda não possui uma conta, utilize o comando {586ea4}/registrar {dcdad3}para criar uma conta.");
    }
    return 1;
}

public OnAccountLoad(playerid)
{
	new rows, fields;
	cache_get_row_count(rows);
    cache_get_field_count(fields);
	if(rows > 0)
	{
        cache_get_value_name_int(0, "skin", PlayerData[playerid][skin]);
        cache_get_value_name_int(0, "money", PlayerData[playerid][money]);
        
        SetSpawnInfo(playerid, 255, PlayerData[playerid][skin], 2495.3547, -1688.2319, 13.6774, 351.1646, 0, 0, 0, 0, 0, 0);
        TogglePlayerSpectating(playerid, false);

        GivePlayerMoney(playerid, PlayerData[playerid][money]);
        SetPlayerInterior(playerid,     0);
        SetPlayerVirtualWorld(playerid, 0);

        //SetPlayerLevel(playerid,        cache_get_field_content_int(0, "level", mysql));
        // SetPlayerHealth(playerid,       gPlayerCharacterData[playerid][e_player_health]);
        // SetPlayerArmour(playerid,       gPlayerCharacterData[playerid][e_player_armour]);
        // SetPlayerCash(playerid,         gPlayerCharacterData[playerid][e_player_money]);

        // SetPlayerSkillLevel(playerid, WEAPONSKILL_PISTOL,			gPlayerWeaponData[playerid][e_player_weapon_skill][0]);
    	// SetPlayerSkillLevel(playerid, WEAPONSKILL_PISTOL_SILENCED,	gPlayerWeaponData[playerid][e_player_weapon_skill][1]);
    	// SetPlayerSkillLevel(playerid, WEAPONSKILL_DESERT_EAGLE,		gPlayerWeaponData[playerid][e_player_weapon_skill][2]);
    	// SetPlayerSkillLevel(playerid, WEAPONSKILL_SHOTGUN,			gPlayerWeaponData[playerid][e_player_weapon_skill][3]);
    	// SetPlayerSkillLevel(playerid, WEAPONSKILL_SAWNOFF_SHOTGUN,	gPlayerWeaponData[playerid][e_player_weapon_skill][4]);
    	// SetPlayerSkillLevel(playerid, WEAPONSKILL_SPAS12_SHOTGUN,	gPlayerWeaponData[playerid][e_player_weapon_skill][5]);
    	// SetPlayerSkillLevel(playerid, WEAPONSKILL_MICRO_UZI,		gPlayerWeaponData[playerid][e_player_weapon_skill][6]);
    	// SetPlayerSkillLevel(playerid, WEAPONSKILL_MP5,				gPlayerWeaponData[playerid][e_player_weapon_skill][7]);
    	// SetPlayerSkillLevel(playerid, WEAPONSKILL_AK47,				gPlayerWeaponData[playerid][e_player_weapon_skill][8]);
    	// SetPlayerSkillLevel(playerid, WEAPONSKILL_M4,				gPlayerWeaponData[playerid][e_player_weapon_skill][9]);
    	// SetPlayerSkillLevel(playerid, WEAPONSKILL_SNIPERRIFLE,		gPlayerWeaponData[playerid][e_player_weapon_skill][10]);

        // SetPlayerFightingStyle(playerid, gPlayerCharacterData[playerid][e_player_fstyle]);

        // LoadPlayerWeapons(playerid);
        // LoadPlayerVehicles(playerid);

        SetPlayerColor(playerid, 0xFFFFFFFF);
        //SetPlayerLogged(playerid, true);

        // SendAdminMessage(PLAYER_RANK_PARADISER, 0x3A9BF4FF, "%s{FFFFFF} conectou-se ao servidor.", GetPlayerFirstName(playerid));
    }
    return 1;
}