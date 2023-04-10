GetLevelWeaponSkill(playerid, weaponid) {
    new levelWeaponSkill[32];
    if (GetSkillWeaponPlayer(playerid, weaponid) <= 45) {
        format(levelString, 32, "{ef6351}%d", GetSkillWeaponPlayer(playerid, weaponid));
    } else if (GetSkillWeaponPlayer(playerid, weaponid) <= 75) {
        format(levelString, 32, "{eae2b7}%d", GetSkillWeaponPlayer(playerid, weaponid));
    } else {
        format(levelString, 32, "{6a994e}%d", GetSkillWeaponPlayer(playerid, weaponid));
    }

    return levelWeaponSkill;
}