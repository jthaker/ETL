CREATE DATABASE homicide_db;
use homicide_db;

CREATE TABLE homicide (
  State TEXT,
  crime_type TEXT,
  victim_sex TEXT,
  victim_age TEXT,
  perpetrator_sex TEXT,
  perpetrator_age TEXT,
  Relationship TEXT,
  Weapon TEXT
);

SELECT * FROM homicide;

CREATE TABLE weapons (
	Circumstances VARCHAR(100),	
    Handguns TEXT,
    Rifles TEXT,
    Shotguns TEXT,
    blunt_object TEXT,
    knives TEXT,
    martial_arts INT,
    Poison INT,
    defenestration INT,
    Explosives INT,
    Fire INT,
    Narcotics INT,
    Drowning INT,
    Strangulation INT,
    Asphyxiation INT
    );
    
ALTER TABLE homicide_db.weapons MODIFY COLUMN Circumstances VARCHAR(100)
CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;

# SELECT ISNULL(Circumstances, '0' ) AS RESULT FROM weapons;

SELECT Circumstances, COALESCE(Circumstances, 0) from weapons;
    
SELECT * FROM weapons;


CREATE TABLE relationship (
	Circumstances TEXT,
	Husband	TEXT,
    Wife TEXT,
    Mother TEXT,
    Father TEXT,
    Son TEXT,
    Daughter TEXT,
    Brother TEXT,
    Sister TEXT, 
    other_family TEXT,
    Acquaintance TEXT,
    Friend TEXT,
    Boyfriend TEXT,
    Girlfriend TEXT,
    Neighbor TEXT,
    Employee TEXT,
    Employer TEXT,
    Stranger TEXT
);

SELECT * FROM relationship;

ALTER TABLE homicide_db.relationship MODIFY COLUMN Circumstances VARCHAR(100)
CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL;

SELECT Circumstances, COALESCE(Circumstances, 0) from relationship;

SELECT weapons.Circumstances, weapons.Handguns, weapons.Rifles, weapons.Shotguns, weapons.blunt_object, weapons.knives, weapons.martial_arts, weapons.Poison, weapons.defenestration, weapons.Explosives, 
	weapons.Fire, weapons.Narcotics, weapons.Drowning, weapons.Strangulation, weapons.Asphyxiation, 
    relationship.Husband, relationship.Wife, relationship.Mother, relationship.Father, relationship.Son, relationship.Daughter,
	relationship.Brother, relationship.Sister, relationship.other_family, relationship.Acquaintance, relationship.Friend, relationship.Boyfriend, 
    relationship.Girlfriend, relationship.Neighbor, relationship.Employee, relationship.Employer, relationship.Stranger
FROM weapons
JOIN relationship
ON weapons.Circumstances = relationship.Circumstances;



