
-- 1. 
select
	A.store_id,
    E.first_name as manager_first_name,
    E.last_name as manager_last_name,
    B.address,
    B.district,
    C.city,
    D.country
from store as A
	left join address as B
		on A.address_id = B.address_id
	left join city as C
		on B.city_id = C.city_id 
	left join country as D
		on C.country_id = D.country_id
	left join staff as E
        on A.manager_staff_id = E.staff_id;
        
-- 2.         
	select
    A.title,
	A.rating,
	A.rental_rate,
	A.replacement_cost,
	B.store_id,
    B.inventory_id
from film as A
	inner join inventory as B
    on A.film_id = B.film_id;
	
        
-- 3
select 
rating, 
store_id,
count(inventory_id)
from film as A 
inner join inventory as B on 
A.film_id = B.film_id
group by rating , store_id
order by count(inventory_id) desc;
      
-- 4       
select
store_id,
name as category,
count(A.film_id) as number_of_films,
avg(replacement_cost),
sum(replacement_cost) as total_replacement_cost 
from film as A
inner join inventory as B
on A.film_id = B.film_id
inner join film_category as c
on B.film_id = C.film_id
inner join category as D
on c.category_id = D.category_id
group by category ,store_id;

-- 5
select
A.first_name,
A.last_name,
B.address,
C.city,
D.country,
A.store_id, 
A.active 
from customer as A
	left join address as B
		on A.address_id = B.address_id
	left join city as C
		on B.city_id = C.city_id 
	left join country as D
		on C.country_id = D.country_id
group by store_id ,first_name,last_name;

-- 6
select
A.first_name,
A.last_name,
count(C.rental_id) as total_lifetime_rental,
sum(amount) as total_lifetime_value 
from customer as A
inner join rental as B
on A.customer_id = B.customer_id
inner join payment as C
on B.rental_id = C.rental_id
group by first_name
order by total_lifetime_value desc;

-- 7
select
concat(first_name, ' ' , last_name) as Names,
"investor" as "investor/Advisor",
company_name
from investor
union
select
concat(first_name, ' ' , last_name) as Names,
"advisor" as "investor/Advisor", null
from advisor;

-- 8
select 
concat(first_name, ' ' , last_name) as Actor_name,
actor_id,
 case
    when awards in ('emmy','oscar','tony') then '3 awards'
    when awards in ('emmy,oscar','emmy,tony','oscar,tony') then '2 awards'
   else '1 award'
    end 'no_of_award'
from actor_award 
group by Actor_name 
order by no_of_award desc;

select  awards, 
floor((count(awards)/157)*100) as percentage_of_actors
from actor_award
group by awards;