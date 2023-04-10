#include <YSI_Coding\y_hooks>

#define MYSQL_HOST        "localhost"
#define MYSQL_USER        "root"
#define MYSQL_PASS        "root"
#define MYSQL_DB          "san-andreas"
#define MYSQL_DEBUG       true

new MySQL:mysql;

hook OnGameModeInit()
{

    #if MYSQL_DEBUG == true
        mysql_log(ALL);
    #endif

    mysql = mysql_connect(MYSQL_HOST, MYSQL_USER, MYSQL_PASS, MYSQL_DB);
 
    if (mysql_errno(mysql) != 0)
    {
        print("ERROR: Could not connect to database!");
        return -1;
    }
    else
    {
        print("Connected to database successfully!");
    }
    return 1;
}