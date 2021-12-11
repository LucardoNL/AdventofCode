DROP TABLE IF EXISTS day2;
CREATE TABLE day2 (inputno INTEGER PRIMARY KEY AUTOINCREMENT,inputType varchar(10), instruction varchar(10), amount int);

INSERT INTO day2 (inputtype, instruction, amount) VALUES 
("example","forward", 5),
("example","down", 5),
("example","forward", 8),
("example","up", 3),
("example","down", 8),
("example","forward", 2);

CREATE TEMP TABLE i(instruc varchar(10), value int);
.mode csv
.import "D:\\Werk\\Coding\\AoC\\2021\\day2\\day2_input.csv" i
INSERT INTO day2(inputType, instruction, amount) SELECT "puzzle", instruc, value FROM i;
DROP TABLE i;