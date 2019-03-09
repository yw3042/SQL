select customer_id from payment
order by amount desc
limit 10;

select title from film
order by film_id asc
limit 5;

select amount,payment_date from payment
where payment_date between '2007-02-06' and '2007-02-15';

select customer_id, rental_id,return_date from rental
where customer_id  in (7,13,10)
order by return_date desc;

select * from payment
where amount in (7.99,8.99);


select first_name, last_name
from customer
where first_name like 'Jen%';

select first_name, last_name from customer 
where first_name ilike 'BAR%';

select count(amount) from payment
where amount>5;

select customer_id, sum(amount) from payment
where staff_id =2
group by customer_id
having sum(amount) >= 110;

select count(*) from film
where title like 'J%';

select first_name, last_name from customer
where address_id < 500
and first_name like 'E%'
order by address_id desc
limit 1;


select customer_id, sum(amount) as total_spent
from payment
group by customer_id;

select customer.customer_id, 
first_name,
last_name,
email,
amount,
payment,
payment_date
from customer
inner join payment
on payment.customer_id= customer.customer_id
where first_name like 'A%';

select * from staff
limit 5;

select payment_id, amount,first_name,last_name
from payment
inner join staff on payment.staff_id= staff.staff_id;

select title,count(title) as copies_at_store1 from inventory 
inner join film on inventory.film_id= film.film_id
where store_id =1
group by title
order by title;

select * from film
limit 2;

select * from language;

select title,language.name from film
inner join language 
on language.language_id = film.language_id;


select title, name from film
inner join language as lan
on lan.language_id = film.language_id;

select * from inventory;



select film.film_id, film.title, inventory_id
from film 
left outer join inventory on inventory.film_id = film.film_id
where inventory.film_id is null
order by film.film_id;

select film.film_id, film.title, inventory_id
from film 
left outer join inventory on inventory.film_id = film.film_id
where inventory_id is null;

/* time stap*/
select customer_id,extract(day from payment_date) as day from payment;

select sum(amount), extract (month from payment_date) as month
from payment
group by month
order by sum(amount) desc;

/* mathmatical function*/
select customer_id + rental_id as new_id from payment;

select rental_id/customer_id as new_id
from payment;

select round(avg(amount),2) from payment;

/* string function and operators*/

select first_name ||  ' ' || last_name as full_name from customer;

select first_name, char_length(first_name)
from customer;

select upper(first_name) from customer;

/* subquery*/
select avg(rental_rate) from film;
select title,rental_rate from film
where rental_rate >2.98;

/* a subquery is a query nested inside anothher query
to construct a subquery, we put the second query 
in brackets and use it in the where clause as an experession
*/

select film_id, title, rental_rate from film
where 
rental_rate> (select avg(rental_rate) from film);

select * from rental;
select * from inventory;

select inventory.film_id
from rental inner join inventory
on inventory.inventory_id = rental.inventory_id
where 
return_date between '2005-05-29' and '2005-05-30';

select film_id, title 
from film
where film_id IN
(select inventory.film_id
from rental inner join inventory
on inventory.inventory_id = rental.inventory_id
where 
return_date between '2005-05-29' and '2005-05-30');


/* 
self-join
To combine rows with other rows in the same table
Must use a table alias to help sql distinguish the left table from 
the right table of the same table
*/

select * from customer;

select a. customer_id, a.first_name,a.last_name, b.customer_id,b.first_name, b.last_name
from customer as a, customer as b
where a.first_name = b.last_name;

select a. customer_id, a.first_name,a.last_name, b.customer_id,b.first_name, b.last_name
from customer as a join customer as b
on a.first_name = b.last_name
order by a.customer_id;







