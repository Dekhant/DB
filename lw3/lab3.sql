--1.1
INSERT INTO inventory
VALUES('ski', '100', 'Fischer')


INSERT INTO inventory
VALUES('snowboard', '101', 'Fischer')


INSERT INTO inventory
VALUES('skii', '102', 'Puma')


INSERT INTO rental
VALUES('2020-07-07', '2020-07-09', 200, 'pasport')


INSERT INTO rental
VALUES('2020-08-07', '2020-08-09', 220, 'drive')


INSERT INTO rental
VALUES('2020-08-13', '2020-08-15', 420, 'pasport')


INSERT INTO rental
VALUES('2020-08-07', '2020-08-09', 180, 'drive')


INSERT INTO stuff
values('cashier', 'Joe', 1, '3228', '12345667', '1')


insert into client
values('Joe', '111', 0, 'none')


insert into client
values('Jim', '112', 0, '1 ski')


INSERT INTO customers_orders
valueS(1, 1,'doing')


INSERT INTO customers_orders
valueS(2, 2,'doing')


INSERT INTO stuff
values('cashier', 'Alex', 0, '1234', '14545667', '2')


--1.2
INSERT INTO stuff (position, name, experience, phonenumber, bank_account, id_rental)
values('cashier', 'Anna', 4, '9876', '98766543', '3')


--1.3
INSERT INTO inventory_in_rental (id_inventory) SELECT (id_inventory) FROM inventory;


--2.1
DELETE FROM inventory_in_rental


--2.2
DELETE FROM inventory 
WHERE  manufacturer = 'Fischer'


--2.3
truncate table stuff


--3.1
update inventory 
SET manufacturer = 'Puma'


--3.2
update inventory 
SET name = 'ski' where name = 'skii' 


--3.3
update inventory
SET manufacturer = 'Demix', name = 'ski' where manufacturer = 'Puma'


--4.1
select  name, number, manufacturer
from inventory


--4.2
select * 
from inventory


--4.3
select * 
from inventory
where manufacturer = 'Demix'


--5.1
select top(3) position, name, phonenumber
from stuff
order by phonenumber ASC


--5.2
select * 
from inventory
order by name DESC


--5.3
select top(2) name, number, manufacturer
from inventory
order by name ASC, manufacturer ASC


--5.4
select name, number, manufacturer
from inventory
order by name


--6.1
select *
from rental
where date_of_issue > '2020-08-10'


--6.2
select year(term)
from rental
where cost < 400


--7.1
select pledge, min(cost) as min_cost
from rental
group by pledge
order by pledge


--7.2
select pledge, max(cost) as max_cost
from rental
group by pledge
order by pledge


--7.3
select pledge, avg(cost) as avg_cost
from rental
group by pledge
order by pledge


--7.4
select pledge, sum(cost) as sum_cost
from rental
group by pledge
order by pledge


--7.5
select pledge, count(pledge) as pledge_counter
from rental
group by pledge
order by pledge


--8.1
select pledge, count(cost) as cost_counter, max(cost) as max_cost
from rental
group by pledge
having count(cost) > 1
order by pledge

select pledge, avg(cost) as avg_cost
from rental
group by pledge
having avg(cost) > 250
order by pledge 

select pledge, sum(cost) as sum_cost
from rental
group by pledge
having sum(cost) < 610
order by pledge


--9.1
select cost, name
from rental
left join inventory
on inventory.id_inventory = rental.id_rental;


--9.2
select position, name, phonenumber
from rental
right join stuff
on rental.id_rental = stuff.id_rental


--9.3
select client.name, customers_orders.status, rental.pledge
FROM
customers_orders left join client
on client.id_client = customers_orders.id_client
left join rental
on customers_orders.id_rental = rental.id_rental
where client.decency = 0 and active_orders = 'none'


--10.1
select client.name, customers_orders.status
from client
full outer join customers_orders on client.id_client = customers_orders.id_client
order by client.name


--10.2
select *
from client
where id_client in (select id_client from customers_orders group by id_client)