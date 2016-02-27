


SELECT  measId, COUNT(measId) AS measCount 
FROM timelyhospRe
where footnote = '' 
AND intscore is not NULL
AND sample >100
GROUP BY measId
ORDER BY measCount DESC;



SELECT tophosp.provid, hosp, state, totscore, avgscore, varScore
FROM tophosp
LEFT JOIN worseReadmitRef
ON (tophosp.provid=worseReadmitRef.provid and worseReadmitRef.provid is null)
LEFT JOIN worseCompRef
ON (tophosp.provid=worseCompRef.provid and worseCompRef.provid is null)
LEFT JOIN worseInfectRef
ON (tophosp.provid=worseInfectRef.provid and worseInfectRef.provid is null)
order by avgscore DESC
limit 10;






