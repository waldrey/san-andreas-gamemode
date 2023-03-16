YCMD:cv(playerid, params[], help)
{
	new vehModel;
    if (sscanf(params, "d", vehModel)) {
		return SendClientMessage(playerid, -1, "USE: /cv <model>");
    }

	if(vehModel < 400 || vehModel > 611) {
		return SendClientMessage(playerid, -1, "Veículo não existente");
	}

	new Float:x, Float:y, Float:z, Float:a;
	GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, a);
	CreateVehicle(vehModel, x, y, z, a, -1, -1, 60);
	SendClientMessage(playerid, -1, "Veículo criado!");
    return 1;
}