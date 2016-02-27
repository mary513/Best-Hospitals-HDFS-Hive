

SELECT state,  sum(topMeasSt.intscore) totScore, sum(topMeasSt.intscore)/15 as avgScore, MAX(intscore)-MIN(intscore) as varScore
FROM topMeasSt
GROUP BY
state
ORDER BY
avgscore DESC
limit 10;


