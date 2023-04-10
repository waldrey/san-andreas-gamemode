CREATE TABLE users (
    id int NOT NULL AUTO_INCREMENT,
    username varchar(255) NOT NULL,
    password varchar(255) NOT NULL,
    skin int NOT NULL DEFAULT 1,
    money int NOT NULL DEFAULT 0,
    health int NOT NULL DEFAULT 100,
    armour int NOT NULL DEFAULT 0,
    wanted int NOT NULL DEFAULT 0,
    level int NOT NULL DEFAULT 0,
    job_id int DEFAULT 1,
    spawn_x float NOT NULL DEFAULT 2495.3547,
    spawn_y float NOT NULL DEFAULT -1688.2319,
    spawn_z float NOT NULL DEFAULT 13.6774,
    spawn_a float NOT NULL DEFAULT 351.1646,
    pos_x float,
    pos_y float,
    pos_z float,
    pos_a float,
    PRIMARY KEY (id),
    FOREIGN KEY (job_id) REFERENCES jobs(id)
);

CREATE TABLE jobs (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    level varchar(255) NOT NULL,
    salary int NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO jobs (name, level, salary) VALUES ('Desempregado', 0, 800);
INSERT INTO jobs (name, level, salary) VALUES ('Taxista', 0, 1100);
INSERT INTO jobs (name, level, salary) VALUES ('Pizzaboy', 0, 1100);

CREATE TABLE player_weapons (
    player_id int NOT NULL,
    weapon_id int NOT NULL,
    skill_weapon_id int NOT NULL,
    skill int NOT NULL DEFAULT 0,
    ammo int NOT NULL DEFAULT 0,
    FOREIGN KEY (player_id) REFERENCES users(id)
);