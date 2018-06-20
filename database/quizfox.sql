-- Database Creation
DROP DATABASE IF EXISTS quizfox;
CREATE DATABASE quizfox;
USE quizfox;

-- Creating User and granting Privilege
CREATE USER quizmasterfox@localhost identified by 'quiz';
GRANT ALL ON quizfox.* to 'quizmasterfox'@'localhost';
ALTER USER quizmasterfox@localhost IDENTIFIED WITH mysql_native_password BY 'quiz';

CREATE TABLE students(
	id INTEGER PRIMARY KEY,
	firstname VARCHAR(255) NOT NULL,
	lastname VARCHAR(255) NOT NULL,
	username VARCHAR(255) NOT NULL,
	password VARCHAR(255) NOT NULL
);


CREATE TABLE questions(
	id INTEGER PRIMARY KEY,
	category VARCHAR(255) NOT NULL,
	question VARCHAR(255) NOT NULL,
	answer VARCHAR(255) NOT NULL
);

INSERT INTO questions(id, category, question, answer)
VALUES
(100, "Health", "You need eight glasses of these everyday", "Water");

INSERT INTO students(id, firstname, lastname, username, password)
VALUES
(1000, "Edward", "Isles", "QuizFox", "foxquiz");

INSERT INTO students(id, firstname, lastname, username, password)
VALUES
(1001, "Louievic", "Sancon", "ls", "sn");

INSERT INTO students(id, firstname, lastname, username, password)
VALUES
(1002, "Heji", "Ewan", "hj", "ewan");

INSERT INTO students(id, firstname, lastname, username, password)
VALUES
(1003, "Marlon", "nakalimutan", "secret", "heapsort");

INSERT INTO students(id, firstname, lastname, username, password)
VALUES
(1004, "Bernie", "what", "bn", "okay");