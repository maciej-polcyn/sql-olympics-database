CREATE DATABASE IF NOT EXISTS olympics;
USE olympics;

DROP TABLE IF EXISTS athletic_events;
CREATE TABLE athletic_events
(
	id INT,
    full_name VARCHAR(255),
    sex VARCHAR(45),
    age VARCHAR(45),
    height VARCHAR(45),
    weight VARCHAR(45),
    team VARCHAR(45),
    noc VARCHAR(45),
    ganes VARCHAR(255),
    year VARCHAR(45),
    season VARCHAR(45),
    city VARCHAR(45),
    sport VARCHAR(45),
    event_name VARCHAR(45),
    medal VARCHAR(45)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/athlete_events_dolar.csv'
INTO TABLE athletic_events
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"' 
-- ESCAPED BY ''
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

SHOW VARIABLES LIKE 'secure_file_priv';
show variables like "local_infile";
set global local_infile = 1;