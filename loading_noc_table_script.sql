USE olympics;

DROP TABLE IF EXISTS noc;
CREATE TABLE IF NOT EXISTS noc
(
	noc 	VARCHAR(45),
    region 	VARCHAR(45),
    note	VARCHAR(255)
    );

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\noc_regions_single_quotes.csv'
INTO TABLE noc
FIELDS TERMINATED BY ","
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES