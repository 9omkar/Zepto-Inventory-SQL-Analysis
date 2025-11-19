drop table if exists zepto 

DROP TABLE IF EXISTS zepto;

CREATE TABLE zepto(
    sku_id SERIAL PRIMARY KEY,
    category VARCHAR(150),
    name VARCHAR(120) NOT NULL,
    mrp NUMERIC(8,2),
    discountPercent NUMERIC(5,2),
    availableQuantity INTEGER,
    discountSellingPrice NUMERIC(8,2),
    wightInGMS INTEGER,
    outOfStock BOOLEAN,
    quantity INTEGER
);

--count of rows 
select count(*) from zepto

--sample data]
select * from zepto
limit 10;

--different product category names
select distinct category from zepto
order by category;

--product in stock vs out of stock
select outofstock,count(sku_id)
from zepto
group by outofstock;

--product names multyiple times 
select name,count(sku_id) as "number of sku"
from zepto
group by name 
having count(sku_id)>1
order by count(sku_id) asc

--data cleaning 

--product with price=0
select * from zepto
where mrp= 0 or discountsellingprice=0;

delete from zepto where mrp=0

--convert paise to ruppes
update zepto
set mrp=mrp/100.0,
discountsellingprice=discountsellingprice/100.0;

select mrp,discountsellingprice from zepto

--Q1) find the top-10 best-value products based on discount percentage
select distinct name,discountpercent from zepto 
order by discountpercent desc limit 10

--Q2)what are the product with highest mrp but out of stock
select distinct name,mrp,outofstock as not_available from zepto
where outofstock='true' and mrp>300
order by mrp desc

--Q3)calculate estimate revenue for each category
select category,
sum(discountsellingprice * availablequantity) as total_revenue
from zepto
group by category
order by total_revenue

--Q4)find all the products where mrp is grater than 500 and discount is less than 10%
select * from zepto

select name,mrp,discountpercent from zepto 
where mrp >500 and discountpercent<10
order by discountpercent

--Q5) identify top 5 categories offering  the highest average discount percentage 
select category,round (avg(discountpercent),2) as average_discount from zepto
group by category
order by average_discount desc
limit 5

--Q6)find the price per gram from products above 100g and sort by best value
select distinct name,wightingms,discountsellingprice,
round(discountsellingprice/wightingms,2) AS PRICE_PER_GRAM from zepto 
where wightingms>100
order by PRICE_PER_GRAM;

--Q7) group the product into categories like low,medium,bulk 
select  distinct name ,wightingms,
case 
	when wightingms<1000 then 'low'
	when wightingms<5000 then 'medium'
	else
	'bulk'
	end as weight_category
from zepto;

--Q8)what is the total inventory weight per category 
select category,
sum(wightingms*availablequantity) as total_weight
from zepto
group by category
order by total_weight;



