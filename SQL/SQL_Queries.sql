-- Top Selling Product
select `Product Name`,
	   sum(Quantity) as Total_Quantity_Sold
from superstore
group by `Product Name`
order by Total_Quantity_Sold desc
limit 10;

-- Best Customers
select `Customer Name`,
       round(sum(Sales), 2) as Total_Spent
from superstore
group by `Customer Name`
order by Total_Spent desc
limit 10;

-- Best Performing Cities
select City,
	  round(sum(Sales), 2) as Total_Revenue
from superstore
group by City
order by Total_Revenue desc;

-- Monthly Revenue
select
     date_format(str_to_date (`Order Date`, '%m/%d/%Y'), '%Y-%m') as Month,
     round(sum(Sales), 2) as Monthly_Revenue
from superstore
group by Month
order by Month;
