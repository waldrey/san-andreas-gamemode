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

/*
CREATE TABLE users (
    id int NOT NULL AUTO_INCREMENT,
    username varchar(255) NOT NULL,
    password varchar(255) NOT NULL,
    skin int,
    money int,
    PRIMARY KEY (id)
);
*/