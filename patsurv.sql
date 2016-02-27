




select tophosp.provid, hosp, state, totscore, avgscore, varscore
FROM tophosp
INNER JOIN top100Surv
ON tophosp.provid=top100Surv.provid
order by avgscore DESC;



SELECT tophosp.provid, hosp, state, totscore, avgscore, varScore
FROM tophosp
LEFT JOIN worseReadmitRef
ON (tophosp.provid=worseReadmitRef.provid and worseReadmitRef.provid is null)
LEFT JOIN worseCompRef
ON (tophosp.provid=worseCompRef.provid and worseCompRef.provid is null)
LEFT JOIN worseInfectRef
ON (tophosp.provid=worseInfectRef.provid and worseInfectRef.provid is null)
INNER JOIN top100Surv
ON tophosp.provid=top100Surv.provid
order by avgscore DESC
limit 10;














