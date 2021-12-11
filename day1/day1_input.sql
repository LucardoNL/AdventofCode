DROP TABLE IF EXISTS day1;
CREATE TABLE day1 (inputno INTEGER PRIMARY KEY AUTOINCREMENT,inputType varchar(10), depth int);

INSERT INTO day1 (inputtype, depth) VALUES 
("example",199),
("example",200),
("example",208),
("example",210),
("example",200),
("example",207),
("example",240),
("example",269),
("example",260),
("example",263);

CREATE TEMP TABLE i(depth int);
.mode csv
.import "D:\\Werk\\Coding\\AoC\\2021\\day1_input.csv" i
INSERT INTO day1(inputType, depth) SELECT "puzzle", depth FROM i;
DROP TABLE i;