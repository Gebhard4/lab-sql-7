use sakila;

#Q1
#In the table actor, which are the actors whose last names are not repeated? 
#For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. 
#These three actors have the same last name. So we do not want to include this last name in our output. 
#Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.

select * from actor
group by last_name
having count(last_name) = 1;

#Q2
#Which last names appear more than once? We would use the same logic as in the previous question 
#but this time we want to include the last names of the actors where the last name was present more than once

select *, count(last_name) as num_of_names from actor
group by last_name
having count(last_name) > 1;

#Q3
#Using the rental table, find out how many rentals were processed by each employee.

select count(rental_id), staff_id from rental
group by staff_id
order by staff_id;

#Q4
#Using the film table, find out how many films were released each year.

select release_year, count(film_id) as film from film
group by release_year;

#Q5
#Using the film table, find out for each rating how many films were there.

select rating, count(film_id) as film from film
group by rating;

#Q6
#What is the mean length of the film for each rating type. Round off the average lengths to two decimal places

select round(avg(length), 2) as mean_length, rating from film
group by rating;

#Q7
#Which kind of movies (rating) have a mean duration of more than two hours?

select rating, avg(length) from film
group by rating
having avg(length) > 120;