DROP SCHEMA IF EXISTS joindemo;
CREATE SCHEMA IF NOT EXISTS joindemo;
USE joindemo;

CREATE TABLE owner (
      pk INT(10) NOT NULL UNIQUE
    , name VARCHAR(35)
    , PRIMARY KEY (pk)
);

INSERT INTO owner VALUES (1,'Dieter');
-- see the effect of duplicate records and UNION.
-- to demo, modify owner table creation code above: remove UNIQUE and comment primary key
-- INSERT INTO owner VALUES (1,'Dieter'); 
INSERT INTO owner VALUES (2,'Sandy');
INSERT INTO owner VALUES (3,'Lena');


CREATE TABLE cat (
      pk INT(10) NOT NULL UNIQUE
    , fk INT(10)
    , name VARCHAR(35)
    , PRIMARY KEY (pk)
    -- commented for being able to enter record that has integrity violation 
    -- , FOREIGN KEY (fk)
        -- REFERENCES owner (pk)
);

INSERT INTO cat VALUES (1,1,'Tiger');
INSERT INTO cat VALUES (2,2,'Lion');
INSERT INTO cat VALUES (3,2,'Marshmellow');
INSERT INTO cat VALUES (4,NULL,'Moody');
INSERT INTO cat VALUES (5,4,'Kitty'); -- for integrity violation checking


-- return owner - cat mappings
SELECT 
    owner.pk AS 'owner id', owner.name AS 'owner name', cat.fk AS 'cat fk', cat.name AS 'cat name', cat.pk AS 'cat id'
FROM
    owner
        INNER JOIN
    cat ON owner.pk = cat.fk
;


-- in addition to owner - cat mappings, also return owners who don't own a cat
SELECT 
    owner.pk AS 'owner id', owner.name AS 'owner name', cat.fk AS 'cat fk', cat.name AS 'cat name', cat.pk AS 'cat id'
FROM
    owner
        LEFT JOIN
    cat ON owner.pk = cat.fk
;


-- in addition to owner - cat mappings, also return cats who don't have an owner
SELECT 
    owner.pk AS 'owner id', owner.name AS 'owner name', cat.fk AS 'cat fk', cat.name AS 'cat name', cat.pk AS 'cat id'
FROM
    owner
        RIGHT JOIN
    cat ON owner.pk = cat.fk
;


-- return all - emulating full outer join
-- proper way for MySQL, as it doesn't have a full outer join
SELECT 
    owner.pk AS 'owner id',
    owner.name AS 'owner name',
    cat.fk AS 'cat fk',
    cat.name AS 'cat name',
    cat.pk AS 'cat id'
FROM
    owner
        LEFT JOIN
    cat ON owner.pk = cat.fk 

UNION ALL 

SELECT 
    owner.pk AS 'owner id',
    owner.name AS 'owner name',
    cat.fk AS 'cat fk',
    cat.name AS 'cat name',
    cat.pk AS 'cat id'
FROM
    owner
        RIGHT JOIN
    cat ON owner.pk = cat.fk
WHERE
    owner.pk IS NULL
;


-- integrity violation
SELECT 
    owner.pk AS 'owner id', owner.name AS 'owner name', cat.fk AS 'cat fk', cat.name AS 'cat name', cat.pk AS 'cat id'
FROM
    owner
        RIGHT JOIN
    cat ON owner.pk = cat.fk
WHERE
	owner.pk IS NULL AND cat.fk IS NOT NULL
;

