DROP SCHEMA IF EXISTS classes;
CREATE SCHEMA IF NOT EXISTS classes;
USE classes;

CREATE TABLE student (
    id INT(10) NOT NULL UNIQUE, -- AUTO_INCREMENT
    f_name VARCHAR(15),
    l_name VARCHAR(15),
    PRIMARY KEY (id)
);

CREATE TABLE class (
    id INT(10) NOT NULL UNIQUE AUTO_INCREMENT, -- AUTO_INCREMENT
    name VARCHAR(10),
    cap INT(2),
    id_name VARCHAR(10),
    PRIMARY KEY (id)
);

CREATE TABLE student_in_class (
	student_id INT(10) NOT NULL UNIQUE,
    class_id INT(10) NOT NULL UNIQUE,
    PRIMARY KEY (student_id, class_id),
    FOREIGN KEY (student_id)
        REFERENCES student (id),
    FOREIGN KEY (class_id)
        REFERENCES class (id)
);

CREATE TABLE student_in_waitlist (
	student_id INT(10) NOT NULL UNIQUE,
    class_id INT(10) NOT NULL UNIQUE,
    PRIMARY KEY (student_id, class_id),
    FOREIGN KEY (student_id)
        REFERENCES student (id),
    FOREIGN KEY (class_id)
        REFERENCES class (id)
);