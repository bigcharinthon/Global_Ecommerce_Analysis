--business quetion:  ในแต่ละ Region สินค้าตัวไหนขายดีที่สุด 3 อันดับ
with rank_region as (
	SELECT
		region,
		Product_Category,
		sum(Total_Sales) as totalsale,
		rank() over(PARTITION by Region order by sum(Total_Sales) DESC) as rank
	from global_ecommerce_sales
	GROUP By region,Product_Category
)
SELECT
	Region,
	Product_Category,
	totalsale
FROM rank_region
where rank <=3
