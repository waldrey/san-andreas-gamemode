enum EPlayerData
{
    e_id_database,
    password[128],
    skin,
    money,
    coins,
    wanted,
    level,
    health,
    armour,
    Job:job,
    family,
    Float:spawn_x,
    Float:spawn_y,
    Float:spawn_z,
    Float:spawn_a
}
static PlayerData[MAX_PLAYERS][EPlayerData];

enum EPlayerWeaponData
{
    e_weapon[13],
    e_ammo[13],
    e_weaponid_skill[11],
    e_skill[11]
}
static PlayerWeaponData[MAX_PLAYERS][EPlayerWeaponData];

forward OnAccountCheck(playerid);
forward OnAccountLoad(playerid);
forward OnWeaponsLoad(playerid);

stock LoadPlayerAccount(playerid)
{
    new query[57 + MAX_PLAYER_NAME + 1], playerName[MAX_PLAYER_NAME + 1];
    GetPlayerName(playerid, playerName, sizeof(playerName));
    mysql_format(mysql, query, sizeof(query),"SELECT * FROM `users` WHERE `username` = '%s' LIMIT 1", GetPlayerNameEx(playerid));
    mysql_tquery(mysql, query, "OnAccountLoad", "i", playerid);
}

stock LoadPlayerWeapons(playerid)
{
    SendClientMessage(playerid, -1, "DEBUG: LoadPlayerWeapons");
    new query[68];
    mysql_format(mysql, query, sizeof(query), "SELECT * FROM player_weapons WHERE player_id = %d;", PlayerData[playerid][e_id_database]);
    mysql_tquery(mysql, query, "OnWeaponsLoad", "i", playerid);
}

hook OnPlayerRequestClass(playerid, classid)
{
    if(IsPlayerNPC(playerid))
        return 1;

    TogglePlayerSpectating(playerid, true);

	new strPlayer[128];
	format(strPlayer, sizeof(strPlayer), "\t\tOlá, {586ea4}%s. {dcdad3}Atualmente servidor está em desenvolvimento.", GetPlayerNameEx(playerid));

	SendClientMessage(playerid, 0xdc93f6FF, "Bem-vindo ao waldisney.mp");
	SendClientMessage(playerid, 0xdcdad3FF, strPlayer);
	
    new query[100 + MAX_PLAYER_NAME];
    mysql_format(mysql, query, sizeof(query),"SELECT * FROM users WHERE `username` = '%e' LIMIT 1", GetPlayerNameEx(playerid));
    mysql_tquery(mysql, query, "OnAccountCheck", "i", playerid);

    return 1;
}

/* Gets */
GetSkillWeaponPlayer(playerid, weaponid)
{
    return PlayerWeaponData[playerid][e_skill][weaponid];
}

GetPlayerFamily(playerid)
{
    return PlayerData[playerid][family];
}

GetPlayerJob(playerid)
{
    return PlayerData[playerid][job];
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
        cache_get_value_name_int(0, "id", PlayerData[playerid][e_id_database]);
        cache_get_value_name_int(0, "skin", PlayerData[playerid][skin]);
        cache_get_value_name_int(0, "money", PlayerData[playerid][money]);
        cache_get_value_name_int(0, "coins", PlayerData[playerid][coins]);
        cache_get_value_name_int(0, "job_id", PlayerData[playerid][job]);
        cache_get_value_name_int(0, "wanted", PlayerData[playerid][wanted]);
        cache_get_value_name_int(0, "level", PlayerData[playerid][level]);
        cache_get_value_name_int(0, "health", PlayerData[playerid][health]);
        cache_get_value_name_int(0, "armour", PlayerData[playerid][armour]);

        cache_get_value_name_float(0, "spawn_x", PlayerData[playerid][spawn_x]);
        cache_get_value_name_float(0, "spawn_y", PlayerData[playerid][spawn_y]);
        cache_get_value_name_float(0, "spawn_z", PlayerData[playerid][spawn_z]);
        cache_get_value_name_float(0, "spawn_a", PlayerData[playerid][spawn_a]);
        
        SetSpawnInfo(playerid, 255, PlayerData[playerid][skin], PlayerData[playerid][spawn_x], PlayerData[playerid][spawn_y], PlayerData[playerid][spawn_z], PlayerData[playerid][spawn_a], 0, 0, 0, 0, 0, 0);
        TogglePlayerSpectating(playerid, false);
        
        SetPlayerInterior(playerid,     0);
        SetPlayerVirtualWorld(playerid, 0);

        SetPlayerScore(playerid,        PlayerData[playerid][level]);
        SetPlayerHealth(playerid,       PlayerData[playerid][health]);
        SetPlayerArmour(playerid,       PlayerData[playerid][armour]);
        SetPlayerWantedLevel(playerid,  PlayerData[playerid][wanted]);
        GivePlayerMoney(playerid,       PlayerData[playerid][money]);

        // SetPlayerFightingStyle(playerid, gPlayerCharacterData[playerid][e_player_fstyle]);

        LoadPlayerWeapons(playerid);
        // LoadPlayerVehicles(playerid);

        SetPlayerColor(playerid, 0xFFFFFFFF);
        //SetPlayerLogged(playerid, true);
    }
    return 1;
}

public OnWeaponsLoad(playerid) 
{
    new rows;
    cache_get_row_count(rows);
	for(new i; i < rows; i++)
	{
	    cache_get_value_name_int(i, "weapon_id", PlayerWeaponData[playerid][e_weapon][i]);
        cache_get_value_name_int(i, "skill_weapon_id", PlayerWeaponData[playerid][e_weaponid_skill][i]);
	    cache_get_value_name_int(i, "ammo", PlayerWeaponData[playerid][e_ammo][i]);
        cache_get_value_name_int(i, "skill", PlayerWeaponData[playerid][e_skill][i]);

        SetPlayerSkillLevel(playerid, PlayerWeaponData[playerid][e_weaponid_skill][i], PlayerWeaponData[playerid][e_skill][i]);

		if(!(0 <= PlayerWeaponData[playerid][e_weapon][i] <= 46))
		{
			printf("[info] Warning: OnWeaponsLoad - Unknown weaponid '%d'. Skipping.", PlayerWeaponData[playerid][e_weapon][i]);
			continue;
		}

        if(PlayerWeaponData[playerid][e_ammo][i] < 1) {
            continue;
        }

		GivePlayerWeapon(playerid, PlayerWeaponData[playerid][e_weapon][i], PlayerWeaponData[playerid][e_ammo][i]);
	}

    return 1;
}

SavePlayerAccount(playerid)
{
    // if(!IsPlayerLogged(playerid))
    //     return 0;

    new Float:x, Float:y, Float:z, Float:a;
    new Float:PlayerHealth, Float:PlayerArmour;
    GetPlayerPos(playerid, x, y, z);
    GetPlayerFacingAngle(playerid, a);
    GetPlayerHealth(playerid, PlayerHealth);
    GetPlayerArmour(playerid, PlayerArmour);

    // Account saving
    new query[1310];
	mysql_format(mysql, query, sizeof(query),
	"UPDATE `users` SET `pos_x`=%.2f, `pos_y`=%.2f, `pos_z`=%.2f, `pos_a`=%.2f, \
    `skin`=%d, `money`=%d, `health`=%d, `armour`=%d, \
    `job_id`=%d, `level`=%d WHERE `username`='%s'", 
        x,
        y,
        z,
        a,
        PlayerData[playerid][skin], 
        GetPlayerMoney(playerid), 
        100, 
        PlayerArmour, 
        PlayerData[playerid][job], 
        PlayerData[playerid][level], 
        GetPlayerNameEx(playerid)
    );
	mysql_pquery(mysql, query);
    
    SendClientMessage(playerid, 0xdc93f6FF, "[waldisney.mp] Seu progresso foi salvo com sucesso.");
    return 1;
}