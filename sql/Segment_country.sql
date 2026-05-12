--Business Quetion: Segment ไหนทำกำไรสูงสุดในแต่ละประเทศ
with segment_rank as (
  select 
    Country,
    Customer_Segment,
    sum(Profit) as total_profit,
    rank() OVER(PARTITION by Country order by sum(Profit) desc)as rank
  FROM global_ecommerce_sales
  group by Country,Customer_Segment
)
select 
    Country,
    Customer_Segment,
    total_profit
from segment_rank
where rank = 1
