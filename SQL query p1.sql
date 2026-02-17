SELECT * FROM project_sql.retail_sales;
select count(*) from retail_sales;
select * from retail_sales
where transactions_id is null
or
sale_date is null
or sale_time is null
or gender is null
or age is null
or category is null
or quantiy is null
or price_per_unit is null
or cogs is null
or total_sale is null;
delete from retail_sales
where transactions_id is null
or
sale_date is null
or sale_time is null
or gender is null
or age is null
or category is null
or quantiy is null
or price_per_unit is null
or cogs is null
or total_sale is null;
select count(*) as total_sale from retail_sales;
select count(distinct customer_id) from retail_sales;
select count(distinct category) from retail_sales;
select * from retail_sales where sale_date = '2022-11-05';
select * from retail_sales;
where category = 'Clothing'
and date_format(sale_date, '%Y-%m') = '2022-11'
and	quantiy >=4;
select category,
sum(total_sale) as net_sale,
count(*) as total_orders from retail_sales group by category;
select round(avg(age),2) as Avg_age from retail_sales where category ='Beauty';
select category, gender,
count(*) as total_trans
from retail_sales
group by category, gender
order by category, gender;
SELECT year, month, avg_sale 
FROM (
    SELECT 
        EXTRACT(YEAR FROM sale_date) AS year, 
        EXTRACT(MONTH FROM sale_date) AS month, 
        AVG(total_sale) AS avg_sale, 
        RANK() OVER(PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC) AS `rank`
    FROM retail_sales 
    GROUP BY year, month
) AS t1 
WHERE `rank` = 1;
select customer_id,
sum(total_sale) as total_sales  from retail_sales
group by customer_id
order by total_sales desc
limit 5;
select category, count(distinct customer_id) as unique_cus
from retail_sales
group by category;
with hourly_sale as
(
select *,
case
when extract(Hour from sale_time) < 12 then 'Morning'	
when extract(Hour from sale_time) between 12 and 17 then 'Afternoon'
else 'Evening'
end as shift
from retail_sales
)
select shift,
count(*) as total_orders from hourly_sale
group by shift;
select * from retail_sales;

