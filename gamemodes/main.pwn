#include <open.mp>

/* Includes */
#define YSI_NO_HEAP_MALLOC

#include <a_mysql>
#include <YSI_Coding\y_malloc>
#include <YSI_Coding\y_hooks>
#include <YSI_Data\y_foreach>
#include <YSI_Coding\y_timers>
#include <YSI_Visual\y_commands>
#include <streamer>
#include <sscanf2>
#include <strlib>

#define MAX_MAPICON_RANGE								150.0
#if !defined isnull
    #define isnull(%1) ((!(%1[0])) || (((%1[0]) == '\1') && (!(%1[1]))))
#endif

/*
     ___      _
    / __| ___| |_ _  _ _ __
    \__ \/ -_)  _| || | '_ \
    |___/\___|\__|\_,_| .__/
                      |_|
*/

main()
{
	printf(" ");
	printf("  -------------------------------");
	printf("  |  My first open.mp gamemode! |");
	printf("  -------------------------------");
	printf(" ");
}

// Modulos
/* Data */
#include "../modules/data/database.pwn"
#include "../modules/data/player.pwn"

/* Defs */
#include "../modules/def/dialogs.pwn"
//#include "../modules/def/families.pwn"

/* Jogador */
#include "../modules/player/player.pwn"
#include "../modules/player/commands.pwn"
#include "../modules/player/dialogs.pwn"

/* Families */
//#include "../modules/families/families.pwn"
//#include "../modules/families/dialogs.pwn"
//#include "../modules/families/commands.pwn"

/* Game */
#include "../modules/game/mapicons.pwn"

public OnGameModeInit()
{
	//LoadFamilies();
	UsePlayerPedAnims();
	DisableInteriorEnterExits();
	EnableStuntBonusForAll(false);
	AddPlayerClass(0, 2495.3547, -1688.2319, 13.6774, 351.1646, WEAPON_M4, 500, WEAPON_KNIFE, 1);
	AddStaticVehicle(495, 2493.7583, -1683.6482, 12.9099, 270.8069, -1, -1);
	AddStaticVehicle(538, 1765.4504, -1953.7933, 14.8756, 269.9386, 1, 1);
	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	return 1;
}

public OnPlayerSpawn(playerid)
{
	SetPlayerColor(playerid, 0xFFFFFFFF);
	SetPlayerInterior(playerid, 0);
	return 1;
}

stock GetPlayerNameEx(playerid)
{
	new name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, sizeof(name));
	return name;
}