hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if (dialogid == DIALOG_USER_LOGIN)
    {
        if (!response)
        {
            Kick(playerid);
        }
        else
        {
            if (isequal(GetPasswordPlayer(playerid), inputtext))
            {
                LoadPlayerAccount(playerid);
            }
            else
            {
                ShowPlayerDialog(playerid, DIALOG_USER_LOGIN, DIALOG_STYLE_PASSWORD, "waldisney.mp | Autenticação", "{dcdad3}Hey, parece que algo deu errado na hora de você informar sua senha, tente novamente.\n\t* {ef233c}Senha inválida", "Autenticar", "Sair");
            }
        }
        return 1;
    }


    return 0;
}