--Business Question: ลูกค้าซื้อซ้ำในแต่ละ Segment มีจำนวนเท่าไร
WITH repeat_customers AS (
    SELECT 
        Customer_Name,
        Customer_Segment,
        COUNT(Order_ID) AS order_count
    FROM global_ecommerce_sales
    GROUP BY Customer_Name, Customer_Segment
    HAVING COUNT(Order_ID) > 1
)
SELECT 
    Customer_Segment,
    COUNT(DISTINCT Customer_Name) AS repeat_customer
FROM repeat_customers
GROUP BY Customer_Segment
ORDER BY repeat_customer DESC;
