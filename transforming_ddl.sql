


CREATE TABLE timelyHospRe
AS SELECT *, cast(score as int) as intscore FROM timelyHosp;

CREATE TABLE timelyStateRe
AS SELECT *, cast(score as int) as intscore FROM timelyState;

CREATE TABLE largehospRef
AS SELECT provid, score FROM timelyHospRe
WHERE 
measid='EDV' and (score='Very High (60,000+ patients annually)' or score= 'High (40,000 - 59,999 patients annually)' OR score='Medium (20,000 - 39,999 patients annually)');

CREATE TABLE topMeas
AS SELECT * FROM timelyHospRe
WHERE 
footnote = ''
and sample > 100
and intscore is not NULL
and (
measId = 'IMM_3_FAC_ADHPCT' OR measId = 'OP_7' OR measId = 'OP_6' OR measId = 'HF_2' OR measId = 'SCIP_VTE_2' OR measId = 'SCIP_INF_1' OR measId = 'SCIP_INF_2' OR measId = 'SCIP_INF_3' OR measId = 'STK_10' OR measId = 'STK_1' OR measId = 'AMI_2' OR measId = 'AMI_10' OR measId = 'STK_2' OR measId = 'PN_6' OR measId = 'STK_5'
);

CREATE table finalists as SELECT finalProvs.provid
FROM 
(select provid, count(measid) as countMeas
FROM topMeas
Group by provid
having countMeas=15) finalProvs
inner join 
largehospRef
ON finalProvs.provid=largehospRef.provid;

Create table topHosp as SELECT topMeas.provid, hosp, state, sum(topMeas.intscore)/15 as avgScore, sum(topMeas.intscore) as totScore, max(topMeas.intscore)-min(topMeas.intscore) as varScore
FROM topMeas
inner join
finalists ON topMeas.provid=finalists.provid
GROUP BY 
topMeas.provid,hosp, state;

Create table worseReadmitRef as SELECT worse.provid, worse.countcompared
FROM
(select provid, count(compared) as countCompared
FROM readmit
where compared='Worse than the National Rate'
and footnote=''
group by provid
having countCompared >4) worse;

Create table worseCompRef as SELECT worse.provid, worse.countcompared
FROM
(select provid, count(compared) as countCompared
FROM comp
where compared='Worse than the National Rate'
and footnote=''
group by provid
having countCompared >2) worse;

Create table worseInfectRef as SELECT worse.provid, worse.countcompared
FROM
(select provid, count(compared) as countCompared
FROM infect
where compared='Worse than the National Rate'
and footnote=''
group by provid
having countCompared >12) worse;

CREATE TABLE topMeasSt
AS SELECT * FROM timelyStateRe
WHERE 
footnote = ''
and intscore is not NULL
and (
measId = 'IMM_3_FAC_ADHPCT' OR measId = 'OP_7' OR measId = 'OP_6' OR measId = 'HF_2' OR measId = 'SCIP_VTE_2' OR measId = 'SCIP_INF_1' OR measId = 'SCIP_INF_2' OR measId = 'SCIP_INF_3' OR measId = 'STK_10' OR measId = 'STK_1' OR measId = 'AMI_2' OR measId = 'AMI_10' OR measId = 'STK_2' OR measId = 'PN_6' OR measId = 'STK_5'
);

CREATE TABLE patSurvRe
AS SELECT *, cast(rating as int) as intRating FROM patSurv;

CREATE TABLE patSurvMain
AS SELECT * from patSurvRe
where numSurvs = '300 or more'
and intRating is not NULL
and (
answer = 'Summary star rating' OR
answer = 'Cleanliness - star rating' OR
answer = 'Nurse communication - star rating' OR
answer = 'Doctor communication - star rating' OR
answer = 'Staff responsiveness - star rating' OR
answer = 'Pain management - star rating' OR
answer = 'Communication about medicines - star rating' OR
answer = 'Discharge information - star rating' OR
answer = 'Care transition - star rating' OR
answer = 'Overall hospital rating - star rating' OR
answer = 'Quietness - star rating' OR
answer = 'Recommend hospital - star rating'
);

Create table top100Surv as select summary.provid, summary.rating
FROM 
(SELECT patSurvMain.provid, sum(intRating) as rating
from patSurvMain
INNER JOIN largehospref
on largehospref.provid=patSurvMain.provid
GROUP by patSurvMain.provid
ORDER by rating DESC
limit 100) summary;



