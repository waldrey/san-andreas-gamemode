#include <open.mp>

/* Includes */
#define YSI_NO_HEAP_MALLOC
#include <YSI_Coding\y_malloc>
#include <YSI_Coding\y_hooks>
#include <YSI_Data\y_foreach>
#include <YSI_Coding\y_timers>
#include <YSI_Visual\y_commands>
#include <streamer>
#include <sscanf2>

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

hook OnGameModeInit()
{
	LoadFamilies();
	UsePlayerPedAnims();
	DisableInteriorEnterExits();
	EnableStuntBonusForAll(false);
	AddPlayerClass(0, 2495.3547, -1688.2319, 13.6774, 351.1646, WEAPON_M4, 500, WEAPON_KNIFE, 1, WEAPON_COLT45, 100);
	AddStaticVehicle(495, 2493.7583, -1683.6482, 12.9099, 270.8069, -1, -1);
	AddStaticVehicle(538, 1765.4504, -1953.7933, 14.8756, 269.9386, 1, 1);
	return 1;
}

hook OnGameModeExit()
{
	return 1;
}

// Modulos
/* Data */
#include "../modules/data/player.pwn"

/* Defs */
#include "../modules/def/dialogs.pwn"
#include "../modules/def/families.pwn"

/* Jogador */
#include "../modules/player/player.pwn"
#include "../modules/player/commands.pwn"

/* Families */
#include "../modules/families/families.pwn"
#include "../modules/families/dialogs.pwn"
#include "../modules/families/commands.pwn"

/* Game */
// #include "../modules/game/mapicons.pwn"

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, 217.8511, -98.4865, 1005.2578);
	SetPlayerFacingAngle(playerid, 113.8861);
	SetPlayerInterior(playerid, 15);
	SetPlayerCameraPos(playerid, 215.2182, -99.5546, 1006.4);
	SetPlayerCameraLookAt(playerid, 217.8511, -98.4865, 1005.2578);
	ApplyAnimation(playerid, "benchpress", "gym_bp_celebrate", 4.1, true, false, false, false, 0, SYNC_NONE);
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