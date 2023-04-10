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

YCMD:salvar(playerid, params[], help)
{
	SavePlayerAccount(playerid);
    return 1;
}

YCMD:pericias(playerid, params[], help)
{
	new strPericias[1024];
	printf("level weapon in pericias %d", GetSkillWeaponPlayer(playerid, 10));
	format(strPericias, sizeof(strPericias), "{ef6351}[!]{dcdad3} Lembre-se para realizar perícias nas armas é preciso \
		\nque você vá até uma Ammunation para iniciar a prática de armas.\n\n \
		Pistola: %s\n \
		{dcdad3}Pistola com silenciadora: %s\n \
		{dcdad3}Desert Eagle: %s\n \
		{dcdad3}Shotgun: %s\n \
		{dcdad3}Sawn Off: %s\n \
		{dcdad3}Spas 12: %s\n \
		{dcdad3}Uzi: %s\n \
		{dcdad3}MP5: %s\n \
		{dcdad3}AK-47: %s\n \
		{dcdad3}M4: %s\n \
		{dcdad3}Sniper: %s\n \
		",
		//@TODO: Criar uma função para pegar a Skill buscando pelo id da arma e não hardcoded como agora
		GetLevelWeaponSkill(playerid, 0),
		GetLevelWeaponSkill(playerid, 1),
		GetLevelWeaponSkill(playerid, 2),
		GetLevelWeaponSkill(playerid, 3),
		GetLevelWeaponSkill(playerid, 4),
		GetLevelWeaponSkill(playerid, 5),
		GetLevelWeaponSkill(playerid, 6),
		GetLevelWeaponSkill(playerid, 7),
		GetLevelWeaponSkill(playerid, 8),
		GetLevelWeaponSkill(playerid, 9),
		GetLevelWeaponSkill(playerid, 10)
		);

	ShowPlayerDialog(playerid, 39, DIALOG_STYLE_MSGBOX, "Perícias:", strPericias, "Fechar", "");
    return 1;
}