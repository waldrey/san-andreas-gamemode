YCMD:familia(playerid, params[], help)
{
    ShowFamiliesDialog(playerid);
	return 1;
}

YCMD:familias(playerid, params[], help)
{
    ShowDialogFamilies(playerid);
    return 1;
}

YCMD:minhafamilia(playerid, params[], help)
{
    if (GetPlayerFamily(playerid) == -1) {
        SendClientMessage(playerid, 0xFF0000AA, "Você não pertence a nenhuma família");
        return 1;
    }

    new str[128];
    format(str, sizeof(str), "Você pertence a familia {%s}%s", GetColorFamily(GetPlayerFamily(playerid)), GetNameFamily(GetPlayerFamily(playerid)));
    SendClientMessage(playerid,-1, str);
	return 1;
}