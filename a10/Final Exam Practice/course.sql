-- -----------------------------------------------------
-- Schema course
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS course;
CREATE SCHEMA IF NOT EXISTS course;
USE course ;

-- -----------------------------------------------------
-- Table trainee
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS trainee (
  id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(45) NULL,
  last_name VARCHAR(45) NULL,
  age INT,
  PRIMARY KEY (id)
);

-- -----------------------------------------------------
-- Table instructor
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS instructor (
  id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(45) NULL,
  last_name VARCHAR(45) NULL,
  PRIMARY KEY (id)
);

-- -----------------------------------------------------
-- Table course
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS course (
  id INT NOT NULL AUTO_INCREMENT,
  short_name VARCHAR(45),
  long_name VARCHAR(45),
  PRIMARY KEY (id)
);

-- -----------------------------------------------------
-- Table class
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS class (
    course_id INT NOT NULL,
    section_id INT NOT NULL,
    instructor_id INT NOT NULL,
    PRIMARY KEY (course_id , section_id),
    FOREIGN KEY (course_id)
        REFERENCES course (id),
    FOREIGN KEY (instructor_id)
        REFERENCES instructor (id)
);

-- -----------------------------------------------------
-- Table trainee_class
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS trainee_class (
    trainee_id INT NOT NULL,
    course_id INT NOT NULL,
    section_id INT NOT NULL,
    grade CHAR(1),
    PRIMARY KEY (trainee_id , course_id , section_id),
    FOREIGN KEY (trainee_id)
        REFERENCES trainee (id),
    FOREIGN KEY (course_id , section_id)
        REFERENCES class (course_id , section_id)
);


-- -----------------------------------------------------
-- Data table instructor
-- -----------------------------------------------------
INSERT INTO instructor (last_name, first_name) VALUES ('Otte Lochow', 'Lena');
INSERT INTO instructor (last_name, first_name) VALUES ('Lochow','Sandy');
INSERT INTO instructor (last_name, first_name) VALUES ('Dunne','Leona');
INSERT INTO instructor (last_name, first_name) VALUES ('Drump','Tonald');
INSERT INTO instructor (last_name, first_name) VALUES ('Otte','Dieter');


-- -----------------------------------------------------
-- Data table trainee
-- -----------------------------------------------------
INSERT INTO trainee (last_name, first_name, age) VALUES ('Orlando','Myron', 19);
INSERT INTO trainee (last_name, first_name, age) VALUES ('O''Brian','Amy', 24);
INSERT INTO trainee (last_name, first_name, age) VALUES ('Brown','James', 26);
INSERT INTO trainee (last_name, first_name, age) VALUES ('Williams','George', 29);
INSERT INTO trainee (last_name, first_name, age) VALUES ('Farriss','Anne', 30);
INSERT INTO trainee (last_name, first_name, age) VALUES ('Smith','Olette', 21);
INSERT INTO trainee (last_name, first_name, age) VALUES ('Kolmycz','George',22);
INSERT INTO trainee (last_name, first_name, age) VALUES ('Lewis','Rhonda',34);
INSERT INTO trainee (last_name, first_name, age) VALUES ('VanDam','Rhett',23);
INSERT INTO trainee (last_name, first_name, age) VALUES ('Jones','Anne',19);
INSERT INTO trainee (last_name, first_name, age) VALUES ('Lange','John',45);
INSERT INTO trainee (last_name, first_name, age) VALUES ('Williams','Robert',26);
INSERT INTO trainee (last_name, first_name, age) VALUES ('Smith','Jeanine',23);
INSERT INTO trainee (last_name, first_name, age) VALUES ('Diante','Jorge',27);
INSERT INTO trainee (last_name, first_name, age) VALUES ('Wiesenbach','Paul',17);
INSERT INTO trainee (last_name, first_name, age) VALUES ('Smith','George',73);
INSERT INTO trainee (last_name, first_name, age) VALUES ('Genkazi','Leighla',60);
INSERT INTO trainee (last_name, first_name, age) VALUES ('Washington','Rupert',54);
INSERT INTO trainee (last_name, first_name, age) VALUES ('Johnson','Edward',52);
INSERT INTO trainee (last_name, first_name, age) VALUES ('Smythe','Melanie',29);
INSERT INTO trainee (last_name, first_name, age) VALUES ('Brandon','Marie',28);
INSERT INTO trainee (last_name, first_name, age) VALUES ('Saranda','Hermine',12);
INSERT INTO trainee (last_name, first_name, age) VALUES ('Smith','George',33);


-- -----------------------------------------------------
-- Data table course
-- -----------------------------------------------------
INSERT INTO course (short_name, long_name) VALUES ('CS345','Databases');
INSERT INTO course (short_name, long_name) VALUES ('ANT101','Underwater Basket Weaving');
INSERT INTO course (short_name, long_name) VALUES ('PE305','Uphill skiing');
INSERT INTO course (short_name, long_name) VALUES ('FIN511','Tax Evasion Basics');


-- -----------------------------------------------------
-- Data table class
-- -----------------------------------------------------
INSERT INTO class (course_id, section_id, instructor_id) VALUES (1,1,1);
INSERT INTO class (course_id, section_id, instructor_id) VALUES (1,2,2);
INSERT INTO class (course_id, section_id, instructor_id) VALUES (1,3,5);
INSERT INTO class (course_id, section_id, instructor_id) VALUES (2,1,1);
INSERT INTO class (course_id, section_id, instructor_id) VALUES (2,2,2);
INSERT INTO class (course_id, section_id, instructor_id) VALUES (4,1,4);


-- -----------------------------------------------------
-- Data table trainee_class
-- -----------------------------------------------------
INSERT INTO trainee_class (course_id, section_id, trainee_id, grade) VALUES (1,1,1,'A');
INSERT INTO trainee_class (course_id, trainee_id, section_id, grade) VALUES (1,1,2,'B');
INSERT INTO trainee_class (course_id, section_id, trainee_id, grade) VALUES (1,1,3,'C');
INSERT INTO trainee_class (course_id, section_id, trainee_id, grade) VALUES (1,1,4,'D');
INSERT INTO trainee_class (course_id, section_id, trainee_id, grade) VALUES (1,1,5,'F');
INSERT INTO trainee_class (course_id, section_id, trainee_id, grade) VALUES (1,2,6,'F');
INSERT INTO trainee_class (course_id, section_id, trainee_id, grade) VALUES (1,2,7,'F');
INSERT INTO trainee_class (course_id, section_id, trainee_id, grade) VALUES (1,2,8,'A');
INSERT INTO trainee_class (course_id, section_id, trainee_id, grade) VALUES (1,2,9,'A');
INSERT INTO trainee_class (course_id, section_id, trainee_id, grade) VALUES (1, 2,10,'A');
INSERT INTO trainee_class (course_id, section_id, trainee_id, grade) VALUES (1,3,11,'B');
INSERT INTO trainee_class (course_id, section_id, trainee_id, grade) VALUES (1,3,12,'A');
INSERT INTO trainee_class (course_id, section_id, trainee_id, grade) VALUES (1,3,13,'A');
INSERT INTO trainee_class (course_id, section_id, trainee_id, grade) VALUES (2, 1,14,'B');
INSERT INTO trainee_class (course_id, section_id, trainee_id, grade) VALUES (2, 1,15,'C');
INSERT INTO trainee_class (course_id, section_id, trainee_id, grade) VALUES (2, 1,16,'D');
INSERT INTO trainee_class (course_id, section_id, trainee_id, grade) VALUES (2, 2,17,'A');
INSERT INTO trainee_class (course_id, section_id, trainee_id, grade) VALUES (2, 2,18,'F');
INSERT INTO trainee_class (course_id, section_id, trainee_id, grade) VALUES (2, 2,19,'A');
INSERT INTO trainee_class (course_id, section_id, trainee_id, grade) VALUES (2, 2,20,'B');
INSERT INTO trainee_class (course_id, section_id, trainee_id, grade) VALUES (4,1,21,'A');
INSERT INTO trainee_class (course_id, section_id, trainee_id, grade) VALUES (4,1,22,'C');
INSERT INTO trainee_class (course_id, section_id, trainee_id, grade) VALUES (4,1,1,'B');
INSERT INTO trainee_class (course_id, section_id, trainee_id, grade) VALUES (4,1,2,'A');


-- -----------------------------------------------------
-- View all_data
-- -----------------------------------------------------
CREATE VIEW all_data AS
    (SELECT 
        course.id 				AS course_id,
        class.section_id 		AS section_id,
        course.short_name 		AS course_short_name,
        course.long_name 		AS course_long_name,
        instructor.id 			AS instructor_id,
        instructor.first_name 	AS instructor_first_name,
        instructor.last_name 	AS instructor_last_name,
        trainee_class.grade 	AS trainee_grade,
        trainee.id 				AS trainee_id,
        trainee.first_name 		AS trainee_first_name,
        trainee.last_name 		AS trainee_last_name,
        trainee.age 			AS trainee_age
    FROM
        course
            INNER JOIN
        class ON course.id = class.course_id
            INNER JOIN
        trainee_class ON trainee_class.course_id = class.course_id
            AND trainee_class.section_id = class.section_id
            INNER JOIN
        instructor ON class.instructor_id = instructor.id
            INNER JOIN
        trainee ON trainee.id = trainee_class.trainee_id);

SELECT * FROM all_data;

SELECT
	trainee.id, trainee.last_name, trainee.first_name
FROM
	trainee
		LEFT JOIN
	trainee_class ON trainee_class.trainee_id = trainee.id
WHERE
	trainee_class.trainee_id IS NULL
;


SELECT * FROM all_data








