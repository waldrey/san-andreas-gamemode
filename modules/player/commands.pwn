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

/** AUTH **/
YCMD:entrar(playerid, params[], help)
{
	ShowPlayerDialog(playerid, DIALOG_USER_LOGIN, DIALOG_STYLE_PASSWORD, "waldisney.mp | Autenticação", "Olá, agora você pode só colocar sua senha ai para acessar o servidor.", "Autenticar", "Sair");
    return 1;
}

YCMD:registrar(playerid, params[], help)
{
	ShowPlayerDialog(playerid, DIALOG_USER_REGISTER, DIALOG_STYLE_INPUT, "waldisney.mp | Crie sua senha", "Olá, agora coloca uma senha para gente te resgistrar, mula.", "Criar conta", "Sair");
    return 1;
}

YCMD:status(playerid, params[], help)
{
	new strMessage[1024];
	format(strMessage, sizeof(strMessage), "\t{a7c957}%s\n\n{ffffff}Profissão: %s | Nível: 0 | Respeito: 0", GetPlayerNameEx(playerid), GetJobName(GetPlayerJob(playerid), true));
	

	ShowPlayerDialog(playerid, DIALOG_USER_STATUS, DIALOG_STYLE_MSGBOX, "Status:", strMessage, "Fechar", "");
    return 1;
}