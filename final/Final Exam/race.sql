DROP SCHEMA IF EXISTS race;
CREATE SCHEMA IF NOT EXISTS race;
USE race;


-- -----------------------------------------------------
-- Table team
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS team (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(64) NULL,
    PRIMARY KEY (id)
);


-- -----------------------------------------------------
-- Table cyclist
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cyclist (
    usac INT NOT NULL,
    first_name VARCHAR(64) NOT NULL,
    last_name VARCHAR(64) NOT NULL,
    team_id INT NOT NULL,
    age INT NULL,
    PRIMARY KEY (usac),
    FOREIGN KEY (team_id)
        REFERENCES team (id)
);


-- -----------------------------------------------------
-- Table city
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS city (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(64) NOT NULL,
    zip MEDIUMINT(5),
    PRIMARY KEY (id)
);


-- -----------------------------------------------------
-- Table race
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS race (
    id INT NOT NULL AUTO_INCREMENT,
    city_id INT NOT NULL,
    name VARCHAR(64) NOT NULL,
    date DATETIME NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (city_id)
        REFERENCES city (id)
);


-- -----------------------------------------------------
-- Table cyclist_race
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cyclist_race (
    cyclist_usac INT NOT NULL,
    race_id INT NOT NULL, 
    rank INT NOT NULL,
    PRIMARY KEY (cyclist_usac , race_id),
    UNIQUE (race_id , rank),
    FOREIGN KEY (cyclist_usac)
        REFERENCES cyclist (usac),
    FOREIGN KEY (race_id)
        REFERENCES race (id)
);


INSERT INTO team (name) VALUES ('Try to handle bar');
INSERT INTO team (name) VALUES ('Always behind');
INSERT INTO team (name) VALUES ('Sponsors drain');
INSERT INTO team (name) VALUES ('Sore bum');
INSERT INTO team (name) VALUES ('Sweating blood');


INSERT INTO cyclist (team_id, usac, last_name, first_name, age) VALUES (1, 1001, 'Orlando','Myron', 19);
INSERT INTO cyclist (team_id, usac, last_name, first_name, age) VALUES (1, 1002, 'O''Brian','Amy', 24);
INSERT INTO cyclist (team_id, usac, last_name, first_name, age) VALUES (1, 1003, 'Brown','James', 26);
INSERT INTO cyclist (team_id, usac, last_name, first_name, age) VALUES (1, 1004, 'Williams','George', 29);
INSERT INTO cyclist (team_id, usac, last_name, first_name, age) VALUES (1, 1005, 'Farriss','Anne', 30);

INSERT INTO cyclist (team_id, usac, last_name, first_name, age) VALUES (2, 2001, 'Smith','Olette', 21);
INSERT INTO cyclist (team_id, usac, last_name, first_name, age) VALUES (2, 2002, 'Kolmycz','George',22);
INSERT INTO cyclist (team_id, usac, last_name, first_name, age) VALUES (2, 2003, 'Lewis','Rhonda',34);
INSERT INTO cyclist (team_id, usac, last_name, first_name, age) VALUES (2, 2004, 'VanDam','Rhett',23);
INSERT INTO cyclist (team_id, usac, last_name, first_name, age) VALUES (2, 2005, 'Jones','Anne',19);

INSERT INTO cyclist (team_id, usac, last_name, first_name, age) VALUES (3, 3001, 'Lange','John',45);
INSERT INTO cyclist (team_id, usac, last_name, first_name, age) VALUES (3, 3002, 'Williams','Robert',26);
INSERT INTO cyclist (team_id, usac, last_name, first_name, age) VALUES (3, 3003, 'Smith','Jeanine',23);
INSERT INTO cyclist (team_id, usac, last_name, first_name, age) VALUES (3, 3004, 'Diante','Jorge',27);
INSERT INTO cyclist (team_id, usac, last_name, first_name, age) VALUES (3, 3005, 'Wiesenbach','Paul',17);

INSERT INTO cyclist (team_id, usac, last_name, first_name, age) VALUES (4, 4001, 'Smith','George',73);
INSERT INTO cyclist (team_id, usac, last_name, first_name, age) VALUES (4, 4002, 'Genkazi','Leighla',60);
INSERT INTO cyclist (team_id, usac, last_name, first_name, age) VALUES (4, 4003, 'Washington','Rupert',54);

INSERT INTO cyclist (team_id, usac, last_name, first_name, age) VALUES (5, 5001, 'Johnson','Edward',52);
INSERT INTO cyclist (team_id, usac, last_name, first_name, age) VALUES (5, 5002, 'Smythe','Melanie',29);
INSERT INTO cyclist (team_id, usac, last_name, first_name, age) VALUES (5, 5003, 'Brandon','Marie',28);
INSERT INTO cyclist (team_id, usac, last_name, first_name, age) VALUES (5, 5004, 'Saranda','Hermine',12);
INSERT INTO cyclist (team_id, usac, last_name, first_name, age) VALUES (5, 5005, 'Smith','George',33);


INSERT INTO city (name, zip) VALUES ('Flagstaff', '86001');
INSERT INTO city (name, zip) VALUES ('Williams', '86046');
INSERT INTO city (name, zip) VALUES ('Las Vegas', '89101');
INSERT INTO city (name, zip) VALUES ('Sedona', '86336');
INSERT INTO city (name, zip) VALUES ('Goerlitz', NULL);


INSERT INTO race (city_id, `date`, `name`) VALUES (1, 20170125, 'Sunset Crater Challenge');
INSERT INTO race (city_id, `date`, `name`) VALUES (2, 20170305, 'Grand Canyon Memorial');
INSERT INTO race (city_id, `date`, `name`) VALUES (3, 20170514, 'Gambling and Racing');
INSERT INTO race (city_id, `date`, `name`) VALUES (4, 20170623, 'Spiritual Nutcases On The Loose');


INSERT INTO cyclist_race (cyclist_usac, race_id, rank) VALUES (1001, 1, 1);
INSERT INTO cyclist_race (cyclist_usac, race_id, rank) VALUES (1002, 1, 2);
INSERT INTO cyclist_race (cyclist_usac, race_id, rank) VALUES (2003, 1, 3);
INSERT INTO cyclist_race (cyclist_usac, race_id, rank) VALUES (2004, 1, 4);
INSERT INTO cyclist_race (cyclist_usac, race_id, rank) VALUES (3001, 1, 5);
INSERT INTO cyclist_race (cyclist_usac, race_id, rank) VALUES (3002, 1, 6);
INSERT INTO cyclist_race (cyclist_usac, race_id, rank) VALUES (3003, 1, 7);
INSERT INTO cyclist_race (cyclist_usac, race_id, rank) VALUES (3004, 1, 8);
INSERT INTO cyclist_race (cyclist_usac, race_id, rank) VALUES (3005, 1, 9);
INSERT INTO cyclist_race (cyclist_usac, race_id, rank) VALUES (4001, 1, 10);
INSERT INTO cyclist_race (cyclist_usac, race_id, rank) VALUES (4002, 1, 11);
INSERT INTO cyclist_race (cyclist_usac, race_id, rank) VALUES (4003, 1, 12);

INSERT INTO cyclist_race (cyclist_usac, race_id, rank) VALUES (5001, 2, 1);
INSERT INTO cyclist_race (cyclist_usac, race_id, rank) VALUES (1001, 2, 2);
INSERT INTO cyclist_race (cyclist_usac, race_id, rank) VALUES (5002, 2, 3);
INSERT INTO cyclist_race (cyclist_usac, race_id, rank) VALUES (1002, 2, 4);
INSERT INTO cyclist_race (cyclist_usac, race_id, rank) VALUES (5003, 2, 5);
INSERT INTO cyclist_race (cyclist_usac, race_id, rank) VALUES (1003, 2, 6);
INSERT INTO cyclist_race (cyclist_usac, race_id, rank) VALUES (5004, 2, 7);
INSERT INTO cyclist_race (cyclist_usac, race_id, rank) VALUES (1004, 2, 8);
INSERT INTO cyclist_race (cyclist_usac, race_id, rank) VALUES (5005, 2, 9);
INSERT INTO cyclist_race (cyclist_usac, race_id, rank) VALUES (1005, 2, 10);

INSERT INTO cyclist_race (cyclist_usac, race_id, rank) VALUES (2001, 3, 1);
INSERT INTO cyclist_race (cyclist_usac, race_id, rank) VALUES (5001, 3, 2);
INSERT INTO cyclist_race (cyclist_usac, race_id, rank) VALUES (4001, 3, 3);
INSERT INTO cyclist_race (cyclist_usac, race_id, rank) VALUES (4002, 3, 4);
INSERT INTO cyclist_race (cyclist_usac, race_id, rank) VALUES (4003, 3, 5);
INSERT INTO cyclist_race (cyclist_usac, race_id, rank) VALUES (5002, 3, 6);
INSERT INTO cyclist_race (cyclist_usac, race_id, rank) VALUES (2002, 3, 7);
INSERT INTO cyclist_race (cyclist_usac, race_id, rank) VALUES (2003, 3, 8);
INSERT INTO cyclist_race (cyclist_usac, race_id, rank) VALUES (2004, 3, 9);
INSERT INTO cyclist_race (cyclist_usac, race_id, rank) VALUES (5003, 3, 10);
INSERT INTO cyclist_race (cyclist_usac, race_id, rank) VALUES (2005, 3, 11);
INSERT INTO cyclist_race (cyclist_usac, race_id, rank) VALUES (5005, 3, 12);

INSERT INTO cyclist_race (cyclist_usac, race_id, rank) VALUES (2001, 4, 1);
INSERT INTO cyclist_race (cyclist_usac, race_id, rank) VALUES (3001, 4, 2);
INSERT INTO cyclist_race (cyclist_usac, race_id, rank) VALUES (4001, 4, 3);
INSERT INTO cyclist_race (cyclist_usac, race_id, rank) VALUES (2002, 4, 4);
INSERT INTO cyclist_race (cyclist_usac, race_id, rank) VALUES (2003, 4, 5);
INSERT INTO cyclist_race (cyclist_usac, race_id, rank) VALUES (2004, 4, 6);
INSERT INTO cyclist_race (cyclist_usac, race_id, rank) VALUES (4002, 4, 7);
INSERT INTO cyclist_race (cyclist_usac, race_id, rank) VALUES (4003, 4, 8);
INSERT INTO cyclist_race (cyclist_usac, race_id, rank) VALUES (3002, 4, 9);
INSERT INTO cyclist_race (cyclist_usac, race_id, rank) VALUES (3003, 4, 10);
INSERT INTO cyclist_race (cyclist_usac, race_id, rank) VALUES (3004, 4, 11);

-- 01
SELECT
	cyclist.usac, cyclist.first_name, cyclist.last_name
FROM
	cyclist
WHERE
	cyclist.age > 25
;

-- 02
SELECT
	cyclist.usac, cyclist.first_name, cyclist.last_name
FROM
	cyclist
WHERE
	SUBSTRING(cyclist.first_name,1,1) = 'J'
;
 
-- 03
SELECT
	cyclist.usac, cyclist.first_name, cyclist.last_name, race.id, race.name
FROM
	cyclist
		INNER JOIN
	cyclist_race ON cyclist_race.cyclist_usac = cyclist.usac
		INNER JOIN
	race ON cyclist_race.race_id = race.id
WHERE
	(SUBSTRING(cyclist.first_name,-1,1) = 'e' OR Substring(cyclist.last_name,1,1) = 'O') 
    AND cyclist.age > 19 AND cyclist.age < 35 AND (cyclist_race.rank = 2 OR cyclist_race.rank = 1)
;

-- 04
SELECT
	cyclist.usac, cyclist.first_name, cyclist.last_name, race.id, race.name, cyclist_race.rank
FROM
	cyclist
		INNER JOIN
	cyclist_race ON cyclist_race.cyclist_usac = cyclist.usac
		INNER JOIN
	race ON cyclist_race.race_id = race.id
WHERE
	(cyclist_race.rank = 3 OR cyclist_race.rank = 2 OR cyclist_race.rank = 1) AND 
    (race.name = 'Grand Canyon Memorial' OR race.name = 'Gambling and Racing')
;

-- 05
SELECT
	race.id, race.name
FROM
	cyclist
		INNER JOIN
	cyclist_race ON cyclist_race.cyclist_usac = cyclist.usac
		INNER JOIN
	race ON cyclist_race.race_id = race.id
WHERE
	cyclist.age > 59
GROUP BY
	race.id
;

-- 06
SELECT
	race.id, race.name, city.name AS 'City Name'
FROM
	race
		INNER JOIN
	city on race.city_id = city.id
ORDER BY
	race.name
;

-- 07
SELECT
	cyclist.usac, cyclist.first_name, cyclist.last_name
FROM
	cyclist
		INNER JOIN
	cyclist_race ON cyclist_race.cyclist_usac = cyclist.usac
		INNER JOIN
	race ON cyclist_race.race_id = race.id
		INNER JOIN
	city on race.city_id = city.id
WHERE
	city.name = 'Flagstaff' OR city.name = 'Las Vegas'
ORDER BY
	cyclist.last_name
;

-- 08
SELECT
	city.name
FROM
	city
		LEFT JOIN
	race ON race.city_id = city.id
WHERE
	race.id IS NULL
;

-- 09
SELECT
	cyclist.usac, race.id
FROM
	cyclist
		INNER JOIN
	cyclist_race ON cyclist_race.cyclist_usac = cyclist.usac
		INNER JOIN
	race ON cyclist_race.race_id = race.id
		INNER JOIN
	city on race.city_id = city.id
WHERE
	city.name = 'Sedona' OR city.name = 'Flagstaff'
;

-- 10
SELECT
	COUNT(cyclist.usac), city.name
FROM
	cyclist
		INNER JOIN
	cyclist_race ON cyclist_race.cyclist_usac = cyclist.usac
		INNER JOIN
	race ON cyclist_race.race_id = race.id
		INNER JOIN
	city on race.city_id = city.id
GROUP BY
	city.id
;

-- 11
SELECT
	MAX(cyclist.age), team.id, team.name
FROM
	team
		INNER JOIN
	cyclist ON cyclist.team_id = team.id
GROUP BY
	team.id
;

-- 12
SELECT
	cyclist.usac, cyclist.first_name, cyclist.last_name, MIN(cyclist_race.rank)
FROM
	cyclist
		INNER JOIN
	cyclist_race ON cyclist_race.cyclist_usac = cyclist_usac
GROUP BY
	cyclist.usac
;

-- 13
SELECT
	cyclist.usac, cyclist.first_name, cyclist.last_name, city.name
FROM 
	cyclist
		LEFT JOIN
	cyclist_race ON cyclist.usac = cyclist_race.cyclist_usac
		INNER JOIN 
	race ON cyclist_race.race_id = race.id
		INNER JOIN
	city ON race.city_id = city.id
WHERE
	city.name IS NULL
;

-- 14
CREATE VIEW all_data AS
(SELECT
	team.id 			AS 'team_id', 
    team.name 			AS 'team_name', 
    cyclist.usac 		AS 'cyclist_usac', 
    cyclist.first_name 	AS 'cyclist_first_name',
    cyclist.last_name 	AS 'cyclist_last_name', 
    cyclist.age 		AS 'cyclist_age', 
    race.id 			AS 'race_id', 
    race.name 			AS 'race_name',
    race.date 			AS 'race_date', 
    cyclist_race.rank 	AS 'cyclist_rank', 
    city.id 			AS 'city_id', 
    city.name 			AS 'city_name', 
    city.zip 			AS 'city_zip'
FROM
	team
		INNER JOIN
	cyclist ON cyclist.team_id = team.id
		INNER JOIN
	cyclist_race ON cyclist_race.cyclist_usac = cyclist.usac 
		INNER JOIN
	race ON cyclist_race.race_id = race.id
        INNER JOIN
	city ON city.id = race.city_id

);

-- 15
SELECT
	cyclist_rank, team_id, team_name, outer_table.cyclist_usac, cyclist_first_name, cyclist_last_name, city_name
FROM
	all_data AS outer_table
WHERE
	cyclist_rank = (
	SELECT
		MAX(cyclist_rank)
	FROM
		all_data AS inner_table
	WHERE
		inner_table.cyclist_usac = outer_table.cyclist_usac
)
GROUP BY team_id
ORDER BY team_id
;

-- 16
SELECT
	cyclist_rank, team_id, team_name, outer_table.cyclist_usac, cyclist_first_name, cyclist_last_name, city_name
FROM
	all_data AS outer_table
		INNER JOIN
	( SELECT
		cyclist_usac, max(cyclist_rank) AS max_rank
	FROM
		all_data
	GROUP BY cyclist_usac ) AS inner_table
	ON outer_table.cyclist_usac = inner_table.cyclist_usac AND outer_table.cyclist_rank = inner_table.max_rank
GROUP BY team_id
ORDER BY team_id
;