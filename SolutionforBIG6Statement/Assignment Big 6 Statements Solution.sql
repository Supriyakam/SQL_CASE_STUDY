
-- 1. 

select
first_name,
last_name,
email,
store_id
from staff;

-- 2. 
select
store_id,
count(inventory_id) as "count of inventory"
from inventory
group by store_id;

-- 3. 

select
store_id,
count(customer_id) as "Active customer count"
from customer
where active = 1
group by store_id;

-- 4. 

select
count(email) as "count of customer email address"
from customer;


-- 5.

 select store_id , 
 count(distinct(film_id)) as "UNIQUE FILMS COUNT"
  from inventory 
  group by store_id;
  
select 
count(distinct(category_id)) as "UNIQUE CATEGORIES COUNT"
from film_category;

-- 6 

select
max(replacement_cost) as most_expensive,
avg(replacement_cost) as average_expensive,
min(replacement_cost) as least_expensive
from film;

-- 7 

select
max(amount) as "maximum payment",
avg(amount) as "average payment"
from payment;

-- 8 

select  
customer_id,
count(rental_id)  as "Count of rentals per customer"
from rental 
group by customer_id 
order by count(rental_id) desc



