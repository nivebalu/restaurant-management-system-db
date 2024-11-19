-- 1. select all columns in the tables in Restaurant Management database --
select * from USER;
select * from RESTAURANT;
select * from OWNER;
select * from BILL;
select * from MENU_BILL;
select * from CUSTOMER;
select * from MANAGER;
select * from WAITER;
select * from CASHIER;
select * from COOK;
select * from HOME_DELIVERY;
select * from DELIVERY_BOY;
select * from DELIVERY_BOY_2;
select * from MENU;
select * from SALE_DETAIL;
select * from SUPPLIER;
select * from TABLES;
select * from BOOKING;
select * from INGREDIENT;

-- 2. Alter table owner, add age--
alter table owner
add column age int;

-- 3. drop column age in owner table--
alter table owner
drop column age;

-- 4. Use where clause and list type= Non veg in menu table --
select * from menu
where type="Non-veg";

-- 5. query 5 datas from menu table using limit and offset--
select * from MENU
where type="Non-veg"
order by price
limit 5
offset 5;

-- 6. Use 'And' operator and list items in menu table --
select * from menu
where category="SeaFood" and name like "King prawn%";

-- 7. Use 'Or' operator and list items in menu table --
select * from menu
where category="SeaFood" or name like "King prawn%";

-- 8. Use 'Not between' operator and list items in menu table --
select * from menu
where menu_id not between 20 and 30;

-- 9. Update table user. set firstname, Lastname for Id=4 --
update user
set Fname="Kapil", Lname="Dev", password="KapilD"
where user_id=4;
select * from user;

-- 10. count number of items in menu table --
select count(*) as menu_count from menu;

-- 11. Get sum of price in menu table having category as Seafood --
select sum(price) from menu
where Category="SeaFood";

-- 12.  Get Average of price in menu table having category as Seafood --
select avg(price) from menu
where Category="Starters";

-- 13. join column booking id, table number, Firstname and Last name from tables booking and customer. --
select booking.booking_id, booking.table_num, customer.fname, customer.lname from booking 
inner join customer on
booking.cust_id = customer.customer_id;

-- 14. Left join column booking id, table number, Firstname and Last name from tables booking and customer.
select booking.booking_id, booking.table_num, customer.fname, customer.lname from booking 
left join customer on
booking.cust_id = customer.customer_id;

-- 15. Right join column booking id, table number, Firstname and Last name from tables booking and customer.
select booking.booking_id, booking.table_num, customer.fname, customer.lname from booking 
right join customer on
booking.cust_id = customer.customer_id;

-- 16. Cross Join tables - supplier and tables. --
select * from TABLES cross join SUPPLIER;

-- 17. Count menu table grouping them by category --
select count(type), category from menu
group by category;

-- 18. Use like operator to select item name "Tikka" --
select * from menu
where name like "%Tikka";

-- 19. Use Union operator to join cashier and supplier table --
select lname, contact from cashier
union
select lname , contact from supplier;

-- 20. Join booking id, table number, First name 3 tables customer, tables and booking --
select booking.booking_id, booking.table_num, customer.fname, tables.details from booking 
right join customer on
booking.cust_id = customer.customer_id
join tables on tables.table_number = booking.table_num;

-- 21. Get count of type in menu table having category as Seafood where count does not exceeds 10 --
select count(type), category from menu
group by category
having count(type)>=10
order by category desc;

-- 22. Create Index for menu table having Name and category columns--
create index menuIndex on menu(Name, Category);

-- 23. create View for menu table and view them --
select * from Menu_view;

-- 24. Update name in menu view --
update Menu_view
set Name="Tandoori chicken" 
where Name="Prawn Cocktail";

-- 25. Create stored procedure for name and category in menu table --
call MenuId("Tandoori chicken", "SeaFood");
