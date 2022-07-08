-- First step is to see the data that are present in your tables and 
-- understand their relation with each other.


-- List down table;

show tables;

-- actor
-- actor_award
-- actor_info
-- address
-- advisor
-- category
-- city
-- country
-- customer
-- customer_list
-- film
-- film_actor
-- film_category
-- film_list
-- film_text
-- inventory
-- investor
-- language
-- payment
-- rental
-- sales_by_film_category
-- sales_by_store
-- staff
-- staff_list
-- store


/*
In our database we have 16 related tables, which contains information about :
1. Customer (name, address etc.)
	All data corresponding to customer  4 tables
		a. customer
        b. address
        c. city
        d. country
        
2. Business (Staff, Rentals etc.) 4 tables + 2 table
		a. staff
        b. store
        c. payment
        d. rental
        
        advisor
        investor
	
3. Inventory (Films, Categories etc.) 8 tables +1 table
		a. inventory
		b1. film
        b2. film_text
        c. film_category
        d. category
		e. langauge
        f. actor
        g. film_actor
        
        actor_award
        
*/


-- 1. Pull list of first name, last name and email of all our customers.
	-- First thing is locate in which table you can find relevant data.
    -- What all information has been asked for.
    
select 
	first_name,
    last_name,
    email
    from customer;

-- Error no. 1 Adding , to last selected column

select 
	first_name,
    last_name,
    email, -- error because of this
    from customer;
/*    
-- Error Code: 1064. You have an error in your SQL syntax; 
check the manual that corresponds to your MySQL server version for the right syntax to use near 'from customer' at line 5
*/

select 
	first_name,
    last_name,
    email, -- error because of this
    address_id
    from customer;
    
-- Error no. 2  not closing previous sql statement correctly    
select 
	first_name,
    last_name,
    email
    from customer;
    
/*
Error Code: 1064. You have an error in your SQL syntax; 
check the manual that corresponds to your MySQL server version for the right syntax 
to use near 'select   first_name,     last_name,     email     from customer' at line 9
*/
    
    -- 2. Pull the first name , last name , store they are working in and email of all our staff.
    -- First identify in which table your data is present.
    -- what column you need to provide.
    
    select 
		first_name,
        last_name,
        store_id,
        email
        from staff;
        

-- 2. Distinct  

-- Find out how types of ratings we have in our inventory for films. 
-- list down all the available ratings.

select distinct
	rating
    from film;
    
    -- 5 unique ratings are available for the films in our invetory.
    -- PG , G, NC-17, PG-13, R
    
-- Find out the no. of unique staff who are renting out movies.

select distinct
	staff_id
    from rental;

-- Question
-- can you pull up the records of our films and see if there are any other rental duration apart from 6,5,7,3 days.

select distinct
	rental_duration
    from film;

-- We are making rental for 5 different durations and they are  3,4,5,6,7 days.


-- Where operator.
-- where clause can filter out records based on any logical conditions.

-- = Equals
-- <> Does not equal to
-- or != Does not equal to
-- > Greater than
-- < Less than
-- >= Greater than equal to
-- <= Les sthan equal to
-- Between  - a range of values
-- like - matching a pattern like this
-- in() - matches across multiple value


-- Question.
-- Find out how many transactions/payment made where value is 0.99$
-- pull up records of customer_id, rental_id, amount, payment_date.

select 
	customer_id,
    rental_id,
    amount,
    payment_date
    from payment
		where amount = 0.99 ;

-- there are 2979 records where payment was made for 0.99$.

select 
	customer_id,
    rental_id,
    amount,
    payment_date
    from payment
		where amount != 0.99 ;

select 
	customer_id,
    rental_id,
    amount,
    payment_date
    from payment
		where amount <> 0.99 ;

-- Question 
-- Pull up the same records as above of transcation made after 1st of january 2006.
-- 


select 
	customer_id,
    rental_id,
    amount,
    payment_date
    from payment
    
    where payment_date > '2006-01-01';
    
    
-- Common error where should always be placed after the from clause

-- select 
-- 	customer_id,
--     rental_id,
--     amount,
--     payment_date
--     where payment_date > '2006-01-01'
-- 	from payment;
    
-- Question
-- I'd like to look at payment records of our long-term customers to learn about their purchase patterns.
-- Could you pull all payments from our first 100 customers (based on customer Id) ?

select 
	customer_id,
    rental_id,
    amount,
    payment_date
    from payment
    where customer_id between 1 and 100;
    
select 
	customer_id,
    rental_id,
    amount,
    payment_date
    from payment
    where customer_id <= 100;
    
 select 
	customer_id,
    rental_id,
    amount,
    payment_date
    from payment
    where customer_id < 101;
    
-- Question 
-- Pull all records where payment amount was of 0.99$ and payment date is after '2006-01-01'.

-- Logical operator 
-- AND / OR.

 select 
	customer_id,
    rental_id,
    amount,
    payment_date
from payment
	where amount = 0.99 
		and payment_date > '2006-01-01';


-- Question:
-- The payment data you pulled up for first 100 customer was great-- 
-- Now I would like to see just those payment amount made over 5$ and after 1st jauary ,2006.

 select 
	customer_id,
    rental_id,
    amount,
    payment_date
from payment
	where customer_id <= 100
		and amount > 5
        and payment_date > '2006-01-01';
        

-- Question 
-- pull up records of customer_id, rental_id, amount, payment_date.
-- Pull up the record for customer_id 5, 11, 29 ;

select 
	customer_id,
    rental_id,
    amount,
    payment_date
from payment
	where customer_id = 5
		or customer_id = 11
        or customer_id = 29;
        
select 
	customer_id,
    rental_id,
    amount,
    payment_date
from payment
	where customer_id  in (5,11,29);
    
    
-- Question
-- The data you shared previous payment amount over 5$ , but this time only for customer 42,53,60,and 75.

select 
	customer_id,
    rental_id,
    amount,
    payment_date
from payment
	where amount > 5
		and customer_id in (42,53,60,75);
        
select 
	customer_id,
    rental_id,
    amount,
    payment_date
from payment
	where amount > 5
		and 
        ( customer_id = 42
         or customer_id = 53
         or customer_id = 60
         or customer_id = 75);

-- Like operator 
-- Allows you to use pattern matching in your logical operators (instead of exact matching)

-- like '%patternToLookFor%'

-- % and _ --> wildcards in sql

-- 1. Condition where you have a specific start but not sure about ending
-- where name like 'Denise%'
-- Denise Foller
-- Denise Gray
-- Denise Menice
-- Denise Jackson

-- 2. Condition where you don't have a begining but you know the end.
-- where name like '%Johnson'

-- Graham Johnson
-- Johnson Johnson
-- Elizabeth Johnson

-- 3. Condition where you don't have a begining or end you know something in between.

-- where name like '%mi%' 
-- Ami
-- Amit
-- mit

-- 4. if you just one character check before and after _ .
-- where name like '_erry'
-- Jerry
-- Terry
-- Ferry


-- Question
-- Pull up the list of all films whre decription contains Dentist. 

select
	title,
    description
from film
	where description like '%Dentist%';
    
    
-- Question
-- We need to understand the special features in our films.
-- Could you pull a list of title and description  which includes special feature as a 'Behind the Scenes'.

select 
	title,
    description,
    special_features
from film
	where special_features like '%Behind the Scene%';
    
    
-- Question is pull up all the records where descripton contain shark.
	
select
	title,
    description
from film
	where description like '%shark%';
    
-- Question find out all those movies starts with SU

select
	title,
    description
from film
	where title like 'SU%';
    
-- Question find out all hose movies ending with ES

select 
	title,
    description
from film
	where title like '%ES';
    

select 
	title,
    description
from film
	where title like '_UN%';

-- Count -- if you want to find number of observation you can use count(*)
	
select 
	count(*)
from film
	where title like '_UN%';
    
    
## The Group by clause
# specify how to group the data in your result
## group by columnName , otherColumnName


## where
## group by 
## having / order by 

## Groupby is great for performaing comparison in different segments of your data.
## group by allows us to perform segment analysis on our data  at various level of granularity.

## Question :
## Find out the count of all films with different rating available in our inventory and rank then in decreasing order.

select 
	rating, -- at least one categorical column (aggregator)
    count(film_id) -- at least one numerical value to aggregate value (aggregated)
from film
	group by  rating; -- (all aggregator)
 
-- to verify
select 
		*
from film
    where rating = 'PG';

## Aliases in SQL
select 
	rating , -- at least one categorical column (aggregator)
    count(film_id)  -- at least one numerical value to aggregate value (aggregated)
from film
	group by  rating -- (all aggregator)
	order by count(film_id) desc;
    
select 
	rating as Rating, -- at least one categorical column (aggregator)
    count(film_id) as Count -- at least one numerical value to aggregate value (aggregated)
from film
	group by  rating -- (all aggregator)
	order by Count desc;
    
select 
	rating  Rating, -- at least one categorical column (aggregator)
    count(film_id)  Count -- at least one numerical value to aggregate value (aggregated)
from film
	group by  rating -- (all aggregator)
	order by Count desc;
    
select 
	rating , -- at least one categorical column (aggregator)
    count(film_id) as Count -- at least one numerical value to aggregate value (aggregated)
from film
	group by  rating -- (all aggregator)
	order by Count desc;

-- Alternative representation

select 
	rating , -- 1 at least one categorical column (aggregator)
    count(film_id) Count -- 2 at least one numerical value to aggregate value (aggregated)
from film
	group by  1 -- (all aggregator)
	order by 2 desc;
    
    
select 
	rating , -- 1 at least one categorical column (aggregator)
    rental_duration, -- 2
    count(film_id) Count -- 3 at least one numerical value to aggregate value (aggregated)
from film
	group by  1, 2 -- (all aggregator)
	order by 3 desc;
    
select 
	rating , -- 1 at least one categorical column (aggregator)
    rental_duration, -- 2
    count(film_id) as Count -- 3 at least one numerical value to aggregate value (aggregated)
from film
	group by  rating, rental_duration -- (all aggregator)
	order by Count desc;


## Question 
-- I need to get a quick overview of how long our movies tend to be rented out for
-- Could you please pull a count of title sliced by rental duration.
-- Order them in decreasing fashion.

select
	rental_duration, -- categorical value or aggregator column
    count(film_id) -- numerical like value or aggregated value
from film
	group by rental_duration
    order by count(film_id) desc;

## Multiple Group by
## Find out how many film with 'PG' rating are rented for 6 days.
select 
	rating , -- 1 at least one categorical column (aggregator)
    rental_duration, -- 2
    count(film_id) as Count -- 3 at least one numerical value to aggregate value (aggregated)
from film
	group by  rating, rental_duration -- (all aggregator)
	order by Count desc;

-- Mutiple groupby requires all aggregator coumn to be specified in the group by clause.
-- If any aggregator are left out they would participate in grouping and give you wrong result.
select 
	rating , -- 1 at least one categorical column (aggregator)
    rental_duration, -- 2
    count(film_id) as Count -- 3 at least one numerical value to aggregate value (aggregated)
from film
	group by  rating-- (all aggregator)
	order by Count desc;

select 
	count(*)
from film
where rating ='PG'
	and rental_duration = 6 ;


# Aggregated Function
-- count()
-- count distinct()
-- min()
-- max()
-- avg()
-- sum()


## Question
## For different rating ,
-- what is the count of films 
-- what is minimum duration of film with a given rating.
-- what is the maximum duration of film with a given rating.
-- what is the average duration of film with that rating.
-- what is the average rental duration for that rating.

select
	rating, -- aggregator
    count(film_id) as count_of_films,
    min(length) as shortest_film,
    max(length) as longest_film,
    avg(length) as average_length_of_film,
    sum(length) as total_minutes,
    avg(rental_duration) as average_rental_duration
from film
	group by  rating ;-- provide aggregator column;
    
## Question
## I'm wondering if we charge more for a rental when the cost is higher.
-- can you help me  pull a count of films , along with the average ,
-- min and maximum rental rate , grouped by replacement cost?

select 
	replacement_cost,
    count(film_id) as number_of_films,
    avg(rental_rate) as average_rental,
    min(rental_rate) as cheapest_rental,
    max(rental_rate) as most_expensive_rental    
from film
	group by  replacement_cost
    order by replacement_cost desc;
    
-- Having clause
-- optional / purpose of having is to filter groupby results.

# having logical condition;

 select 
	replacement_cost,
    count(film_id) as number_of_films,
    avg(rental_rate) as average_rental,
    min(rental_rate) as cheapest_rental,
    max(rental_rate) as most_expensive_rental    
from film
	group by  replacement_cost
    having average_rental > 3
    order by replacement_cost desc;
    
## Question 
## I want to find out all those customers who have rented more 30 times from our stores.
-- 134 customers who have rented out movies mopre than 30 times.

select
	customer_id, -- aggregator
    count(rental_id) as rental_count -- aggregated value
from rental
	group by customer_id
    having rental_count > 30
    order by rental_count desc;
    

select
	customer_id, -- aggregator
    count(rental_id) as rental_count -- aggregated value
from rental
	group by customer_id
    having rental_count > 30
    order by rental_count desc limit 10;
    
## Question
## I'd like to talk to customers that have not rented much from us to understand if there is something we could be doing better.
-- Could you pull a list of customer_ids with less than 15 rentals in all-time?

select
	customer_id, -- aggregator
    count(rental_id) as rental_count -- aggregated value
from rental
	group by customer_id -- all aggregators need to be specified here.
    having rental_count < 15
    order by rental_count;
    

	




    

    

 
















        
        
        
        
        
        
    