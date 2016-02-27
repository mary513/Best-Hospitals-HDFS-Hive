


CREATE EXTERNAL TABLE IF NOT EXISTS timelyhosp
(provId string, 
hosp string, address string, city string, state string, zip string, country string, phone string, condition string, measId string, measName string, score int, 
sample int, footnote string, startDate string,
endDate string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE 
LOCATION '/user/w205/hospcomp/timelyHosp';

CREATE EXTERNAL TABLE IF NOT EXISTS timelyState
(state string, 
cond string, measName string, measId string, score int, 
footnote string, startDate string, endDate string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE 
LOCATION '/user/w205/hospcomp/timelyState';


CREATE EXTERNAL TABLE IF NOT EXISTS readmit
(provId string, 
hosp string, address string, city string, state string, zip string, country string, phone string, measName string, measId string, compared string, denom int, score int, 
low int, high int, footnote string, startDate string, endDate string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE 
LOCATION '/user/w205/hospcomp/readmit';

CREATE EXTERNAL TABLE IF NOT EXISTS comp
(provId string, 
hosp string, address string, city string, state string, zip string, country string, phone string, measName string, measId string, compared string, denom int, score int, 
low int, high int, footnote string, startDate string, endDate string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE 
LOCATION '/user/w205/hospcomp/comp';

CREATE EXTERNAL TABLE IF NOT EXISTS infect
(provId string, 
hosp string, address string, city string, state string, zip string, country string, phone string, measName string, measId string, compared string, score int, footnote string, startDate string, endDate string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE 
LOCATION '/user/w205/hospcomp/infect';


CREATE EXTERNAL TABLE IF NOT EXISTS patSurv
(provId string, 
hosp string, address string, city string, state string, zip string, country string, phone string, measId string, question string, answer string, rating string, footnote string, percent string, percfootnote string, numSurvs string, numfootnote string, respRate string, respRateFootnote string, startDate string,
endDate string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE 
LOCATION '/user/w205/hospcomp/patsurv';



