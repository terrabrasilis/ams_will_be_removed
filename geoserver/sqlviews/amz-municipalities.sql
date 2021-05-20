-- name: default - regex
-- classname: DS - \b[A-Z]{2}\b
-- startdate: 2021-01-01 - \d{4}-\d{2}-\d{2}
-- enddate: 2020-12-01 - \d{4}-\d{2}-\d{2}
-- limit: ALL - (ALL|\d+)

SELECT 
	su.suid, su.nm_municip, su.geometry, ri.classname, ri.date, COALESCE(ri.total, 0) AS percentage
FROM 
	public."amz_municipalities" su
LEFT JOIN (
	SELECT 
		suid, classname, MAX(date) AS date, SUM(percentage) AS total  
	FROM 
		public."amz_municipalities_risk_indicators" 
	GROUP BY 
	 	suid, classname
) AS ri
ON 
	su.suid = ri.suid 
	AND 
	ri.classname = '%classname%' 
	AND
	ri.date > '%enddate%'::date
	AND
	ri.date <= '%startdate%'::date
ORDER BY 
	percentage DESC
LIMIT
	%limit%