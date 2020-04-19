use lab3
CREATE TABLE client
(  
 id_client int IDENTITY(1,1),  
 name varchar (50),  
 phonenumber varchar(12),  
 decency bit,
 active_orders varchar(30)
 PRIMARY KEY (id_client)
);  

CREATE TABLE stuff
(  
 id_stuff int IDENTITY(1,1),  
 position varchar(50),
 name varchar (50),  
 experience int,
 phonenumber varchar(12),  
 bank_account varchar(30),
 id_rental int
 PRIMARY KEY (id_stuff)
); 

CREATE TABLE rental
(  
 id_rental int IDENTITY(1,1),  
 date_of_issue date,  
 term date,  
 cost money,
 pledge varchar(20)
 PRIMARY KEY (id_rental)
); 

CREATE TABLE customers_orders
(  
 id_customers_orders int IDENTITY(1,1),  
 id_rental int, 
 id_client int,  
 status varchar(10)
 PRIMARY KEY (id_customers_orders)
);  

CREATE TABLE inventory_in_rental
(  
 id_inventory_in_rental int IDENTITY(1,1),  
 id_inventory int, 
 id_rental int, 
 PRIMARY KEY (id_inventory_in_rental)
);  


CREATE TABLE inventory
(  
 id_inventory int IDENTITY(1,1),  
 name varchar (50),  
 number varchar(20),
 manufacturer varchar(20),
 PRIMARY KEY (id_inventory)
); 