
Select measId, measName, (MAX(intscore)-MIN(intscore)) as measVar
from timelyHospRe
inner join largeHospRef
on (largeHospRef.provid = timelyhospre.provid
and intscore is not null 
and footnote=''
and intscore !=0
and sample > 100
and (
measId != 'ED_1b' AND
measId != 'ED_2b' AND
measId != 'EDV' AND
measId != 'OP_1' AND
measId != 'OP_18b' AND
measId != 'OP_20' AND
measId != 'OP_21' AND
measId != 'OP_22' AND
measId != 'OP_3b' AND
measId != 'OP_5' AND
measId != 'PC_01' AND
measId != 'VTE_6' 
))
group by measId, measName
order by measVar DESC
Limit 10;

