--Business Quetion: ค่าส่งในแต่ละประเทศส่งผลต่อกำไรอย่างไร
SELECT 
	Country,
	sum(Profit) as totalprofit,
	sum(Shipping_Cost) as totalshipping
from global_ecommerce_sales
group by Country
order by totalprofit desc
