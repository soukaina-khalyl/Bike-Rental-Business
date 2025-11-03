WITH cte_y0_y1 AS (SELECT *
                   FROM bike_share_yr_0
                   UNION
                   SELECT *
                   FROM bike_share_yr_1)
SELECT      
	a.dteday, 
	a.season, 
	a.yr, 
	a.weekday, 
	a.hr, 
	a.rider_type, 
	a.riders, 
	b.price, 
	b.COGS, 
	cast(riders as float) * cast(price as float) as revenue,
	cast(riders as float) * cast(price as float) - cast(COGS as float) * cast(riders as float) as profit
FROM cte_y0_y1 a 
LEFT OUTER JOIN cost_table b 
ON a.yr = b.yr
