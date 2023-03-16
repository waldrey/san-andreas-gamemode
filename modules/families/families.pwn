enum FamilyData
{
    id,
    name[28],
    leader_id,
    members[12][FamilyMembersData],
    color[8],
    patrimony,
    level
}

enum FamilyMembersData
{
    name[28]
}
static FamilyInfo[MAX_FAMILY][FamilyData];
static familyCount;
static familyCreateName[MAX_PLAYERS][28], familyCreateColor[MAX_PLAYERS][8];

/* Functions */
stock LoadFamilies()
{
    familyCount = 0;
    printf("%d families loaded", familyCount);
    return 0;
}

stock SetNameFamilyCreate(playerid, nameFamily[]) {
    format(familyCreateName[playerid], 28, "%s", nameFamily);
    return 1;
}

stock SetColorFamilyCreate(playerid, nameFamily[]) {
    format(familyCreateColor[playerid], 8, "%s", nameFamily);
    return 1;
}

stock GetNameFamilyCreate(playerid)
{
    new str[28];
    format(str, 28, familyCreateName[playerid]);

    return str;
}

stock GetColorFamilyCreate(playerid)
{
    new str[28];
    format(str, 28, familyCreateColor[playerid]);

    return str;
}

stock GetFamilies()
{
    return FamilyInfo;
}

stock GetFamily(familyid)
{
    return FamilyInfo[familyid];
}

stock GetNameFamily(familyid)
{
    new str[28];
    format(str, 28, FamilyInfo[familyid][name]);

    return str;
}

stock GetColorFamily(familyid)
{
    new str[8];
    format(str, 8, FamilyInfo[familyid][color]);

    return str;
}

stock CreateFamily(playerid) {
    if (GetPlayerFamily(playerid) == -1) {
        return ShowPlayerDialog(playerid, DIALOG_FAMILIES_CREATE_1, DIALOG_STYLE_INPUT, "{e14d28}Família: {eaeaea}Criar uma família", "{eaeaea}Informe o nome da sua família abaixo:\n{ffffff}Siga os passos para finalizar a criação de uma família.", "Prosseguir", "Fechar");
    }
    
    return 0;
}

stock CreatedFamily(playerid) {
    if (familyCount == 0) {
        FamilyInfo[0][id] = 1;
        FamilyInfo[0][leader_id] = GetIdDatabasePlayer(playerid);
        FamilyInfo[0][members][0] = GetIdDatabasePlayer(playerid);
        format(FamilyInfo[0][color], 8, GetColorFamilyCreate(playerid));
        FamilyInfo[0][patrimony] = 0;
        FamilyInfo[0][level] = 0;

        format(FamilyInfo[0][name], 28, "%s", GetNameFamilyCreate(playerid));
        SetPlayerFamily(playerid, 0);
        GivePlayerMoney(playerid, -10000);

        new str[128];
        format(str, sizeof(str), "%s criada com sucesso!", FamilyInfo[0][name]);
        SendClientMessage(playerid, -1, str);
        familyCount++;
    } else {
        FamilyInfo[familyCount][id] = 1;
        FamilyInfo[familyCount][leader_id] = GetIdDatabasePlayer(playerid);
        FamilyInfo[familyCount][members][0] = GetIdDatabasePlayer(playerid);
        format(FamilyInfo[familyCount][color], 8, GetColorFamilyCreate(playerid));
        FamilyInfo[familyCount][patrimony] = 0;
        FamilyInfo[familyCount][level] = 0;

        format(FamilyInfo[familyCount][name], 28, "%s", GetNameFamilyCreate(playerid));
        SetPlayerFamily(playerid, familyCount);
        GivePlayerMoney(playerid, -10000);

        new str[128];
        format(str, sizeof(str), "%s criada com sucesso!", FamilyInfo[familyCount][name]);
        SendClientMessage(playerid, -1, str);
    }
    return 0;
}

/* Functions */
stock ShowDialogFamilies(playerid) {
    new strFamily[128], 
        str[1028];
    format(strFamily, sizeof(strFamily), "{eaeaea}Abaixo as famílias existentes no Brazucas.mp\n\n");
    for(new i; i < MAX_FAMILY; i++) {
        new familyTeste[FamilyData];
        familyTeste = GetFamily(i);
        if (i > 0) {
            if (isnull(familyTeste[name])) {
                ShowPlayerDialog(playerid, DIALOG_FAMILIES_CREATED, DIALOG_STYLE_MSGBOX, "{e14d28}Famílias", str, "Fechar", "");
                return 1;
            }
            format(str, sizeof(str), "%s\t{ffffff}%d. {%s}%s\n", str, i + 1, GetColorFamily(i), GetNameFamily(i));
        } else {
            if (isnull(familyTeste[name])) {
                format(str, sizeof(str), "%s\t{e95252}NENHUMA FAMÍLIA", strFamily);
                ShowPlayerDialog(playerid, DIALOG_FAMILIES_CREATED, DIALOG_STYLE_MSGBOX, "{e14d28}Famílias", str, "Fechar", "");
                return 1;
            }
            format(str, sizeof(str), "%s\t{ffffff}%d. {%s}%s\n", strFamily, i + 1, GetColorFamily(i), GetNameFamily(i));
        }
    }

    ShowPlayerDialog(playerid, DIALOG_FAMILIES_CREATED, DIALOG_STYLE_MSGBOX, "{e14d28}Famílias", str, "Fechar", "");
	return 1;
}

// Generator members
stock GetMembersFamily(familyid) {
    new str[1028];
    for(new i; i < 12; i++) {
        new family[FamilyData];
        family = GetFamily(i);
        if (family[level] == 0) {
            format(str, sizeof(str), "{7bdf84}%d. %s\n", i + 1, GetPlayerNameEx(family[members][i]));
        }
        
        if (i > 0) {
            if (isnull(familyTeste[name])) {
                ShowPlayerDialog(playerid, DIALOG_FAMILIES_CREATED, DIALOG_STYLE_MSGBOX, "{e14d28}Famílias", str, "Fechar", "");
                return 1;
            }
            
        } else {
            if (isnull(familyTeste[name])) {
                format(str, sizeof(str), "%s\t{e95252}NENHUMA FAMÍLIA", strFamily);
                ShowPlayerDialog(playerid, DIALOG_FAMILIES_CREATED, DIALOG_STYLE_MSGBOX, "{e14d28}Famílias", str, "Fechar", "");
                return 1;
            }
            format(str, sizeof(str), "%s\t{ffffff}%d. {%s}%s\n", strFamily, i + 1, GetColorFamily(i), GetNameFamily(i));
        }
    }
}