stock ShowFamiliesDialog(playerid) {
    if (GetPlayerFamily(playerid) == -1) {
        return ShowPlayerDialog(playerid, DIALOG_FAMILIES_MENU_WITHOUT_F, DIALOG_STYLE_LIST, "{e14d28}Família: {eaeaea}Menu", "{a588ef}Criar uma família\n{a588ef}Ver familias\n{7bdf84}Solicitar entrada para uma família", "Selecionar", "Fechar");
    }
    
    return ShowPlayerDialog(playerid, DIALOG_FAMILIES_MENU, DIALOG_STYLE_LIST, "{e14d28}Família: {eaeaea}Menu", "{a588ef}Ver membros\n{a588ef}Veículos da família\n{7bdf84}Banco da família\n{f5ef7d}Investir na família\n{f5ef7d}Gerenciamento da família\n{da4e4e}Sair da família", "Selecionar", "Fechar");
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if (dialogid == DIALOG_FAMILIES_MENU_WITHOUT_F)
    {
        if (response)
        {
            switch(listitem)
            {
                case 0: CreateFamily(playerid);
                case 1: ShowDialogFamilies(playerid);
                case 2: SendClientMessage(playerid, -1, "[DEBUG] @TODO: Criar mecanismo para solicitar entrada em alguma familia"); // Entrada
            }
        }
        return 1;
    }

    // Dialog with family
    if (dialogid == DIALOG_FAMILIES_MENU)
    {
        if (response)
        {
            switch(listitem)
            {
                case 0: ShowDialogFamilyMembers(playerid); //Ver membros
                case 1: SendClientMessage(playerid, -1, "[DEBUG] @TODO: veiculos da familia"); //Veiculos da familia
                case 2: SendClientMessage(playerid, -1, "[DEBUG] @TODO: banco da familia"); // Banco da família
                case 3: SendClientMessage(playerid, -1, "[DEBUG] @TODO: investir na familia"); // Investir na família
                case 4: SendClientMessage(playerid, -1, "[DEBUG] @TODO: gerenciamento da familia"); // Gerenciamento da família
                case 5: SendClientMessage(playerid, -1, "[DEBUG] @TODO: sair da familia"); // Sair da família
            }
        }
        return 1;
    }

    // Create family START
    if (dialogid == DIALOG_FAMILIES_CREATE_1)
    {
        if (response) {
            ShowPlayerDialog(playerid, DIALOG_FAMILIES_CREATE_2, DIALOG_STYLE_INPUT, "{e14d28}Família: {eaeaea}Criar uma família", "{eaeaea}Massa, agora você precisa definir qual vai ser a cor da sua família:\n{ffffff}Passe abaixo HEX da cor deseja exemplo (f5ef7d).", "Criar família", "Fechar");
            SetNameFamilyCreate(playerid, inputtext);
        }
        return 1;
    }

    // Create family END
    if (dialogid == DIALOG_FAMILIES_CREATE_2)
    {
        if (response) {
            SetColorFamilyCreate(playerid, inputtext);
            CreatedFamily(playerid);
        }
        return 1;
    }
    return 0;
}

stock ShowDialogFamilyMembers(playerid) {
    new playerFamilyId = GetPlayerFamily(playerid);
    if (playerFamilyId == -1) {
        return 1;
    }
    
    new strFamily[64];
    format(strFamily, sizeof(strFamily), "{e14d28}Família: {%s}%s", GetColorFamily(playerFamilyId), GetNameFamily(playerFamilyId));
    return ShowPlayerDialog(playerid, DIALOG_FAMILIES_MEMBERS, DIALOG_STYLE_LIST, strFamily, "1. poseidon\n2. disponível\n3. disponível\n4. bloqueado\n5. bloqueado\n6. bloqueado", "Voltar", "Fechar");
}