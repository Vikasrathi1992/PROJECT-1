
### 1.Create a database called credit_card_classification.

create database IF NOT exists credit_card_classification;
use credit_card_classification;

### 2.Create a table credit_card_data with the same columns as given in the csv file. 
### Please make sure you use the correct data types for each of the columns.



create table credit_card_data 
(
Customer_Number int(10) not null,
Offer_Accepted  varchar(100) not null,
Reward_Type varchar(100) not null,
Mailer_Type varchar(100) not null ,
Income_Level varchar(100) not null ,
Bank_Accounts_Open int(10) not null,
Overdraft_Protection varchar(100) not null,
Credit_Rating varchar(100) not null,
Credit_Cards_Held int(10) not null,
Number_Of_Homes_Owned int(10) not null,
House_Hold_Size int(10) not null ,
House_Owned  varchar(100) not null,
Average_Balance float not null,
Q1 int,
Q2 int,
Q3 int,
Q4 int);

### 5.Use the alter table command to drop the column q4_balance from the database, as we would not use it in the analysis with SQL. 
### Select all the data from the table to verify if the command worked. Limit your returned results to 10.


alter table credit_card_data
drop column Q4;

select * from credit_card_data limit 10;


### 7.Now we will try to find the unique values in some of the categorical columns:
### What are the unique values in the column Offer_accepted?
### What are the unique values in the column Reward?
### What are the unique values in the column mailer_type?
### What are the unique values in the column credit_cards_held?
### What are the unique values in the column household_size?

select distinct(Offer_Accepted) from credit_card_data;

select distinct(Reward_Type) from credit_card_data;

select distinct(Mailer_Type) from credit_card_data;

select distinct(Credit_Cards_Held) from credit_card_data;

select distinct(House_Hold_Size) from credit_card_data;


### 8.Arrange the data in a decreasing order by the average_balance of the house. 
### Return only the customer_number of the top 10 customers with the highest average_balances in your data.

select Customer_Number , avg(Average_Balance) as Average from credit_card_data 
group by 1
order by avg(Average_Balance) desc
limit 10;


### 9.What is the average balance of all the customers in your data?
select sum(Average_Balance) as 'TOTAL' from credit_card_data ;
select avg(Average_Balance) as 'AVERAGE' from credit_card_data ; 
select Average_Balance from credit_card_data ; 

### 10.
### What is the average balance of the customers grouped by Income Level? 
### The returned result should have only two columns, income level and Average balance of the customers.
###  Use an alias to change the name of the second column.
select * from credit_card_data;

select Income_Level , avg(Average_Balance) as 'AVERAGE_Balance' from
credit_card_data 
group by 1;

### What is the average balance of the customers grouped by number_of_bank_accounts_open? 
###The returned result should have only two columns, number_of_bank_accounts_open and Average balance of the customers. 
### Use an alias to change the name of the second column.

select Bank_Accounts_Open , avg(Average_Balance) as 'AVERAGE_Balace' from credit_card_data 
group by 1;

### What is the average number of credit cards held by customers for each of the credit card ratings? 
### The returned result should have only two columns, rating and average number of credit cards held.
###  Use an alias to change the name of the second column.

select * from credit_card_data;

select Credit_Rating , avg(Credit_Cards_Held) as Average_Number_of_credit_cards from credit_card_data 
group by 1;

### Is there any correlation between the columns credit_cards_held and number_of_bank_accounts_open? 
### You can analyse this by grouping the data by one of the variables and then aggregating the results of the other column. 
### Visually check if there is a positive correlation or negative correlation or no correlation between the variables.

select Credit_Cards_Held , Count(Bank_Accounts_Open) as number_of_bank_accounts_opened from credit_card_data 
group by 1
order by 2 desc;

select Bank_Accounts_Open , count(Credit_Cards_Held) as number_of_credit_card_held from credit_card_data
group by 1
order by 2 desc;

/* 11.Your managers are only interested in the customers with the following properties:
Credit rating medium or high
Credit cards held 2 or less
Owns their own home
Household size 3 or more
For the rest of the things, they are not too concerned. Write a simple query to find what are the options available for them? 
Can you filter the customers who accepted the offers here? */

select * from credit_card_data
where Credit_Rating in ('High','Medium') and Credit_Cards_Held <= 2 and House_Owned = 'Yes' and House_Hold_Size >= 3 and Offer_Accepted = 'Yes';

### 12.Your managers want to find out the list of customers whose average balance is less than the average balance of all the customers in the database. 
### Write a query to show them the list of such customers.
###  You might need to use a subquery for this problem.

Select * from credit_card_data
where Average_Balance < (select avg(Average_Balance) from credit_card_data);


### 13.Since this is something that the senior management is regularly interested in, create a view of the same query.

CREATE VIEW customers_below_average AS
Select * from credit_card_data
where Average_Balance < (select avg(Average_Balance) from credit_card_data);


### 14.What is the number of people who accepted the offer vs number of people who did not?

select Offer_Accepted , count(Customer_Number) as Number_of_customer from credit_card_data
group by 1;

### 15.Your managers are more interested in customers with a credit rating of high or medium. 
### What is the difference in average balances of the customers with high credit card rating and low credit card rating?

select Credit_Rating , count(Customer_Number) as number_of_customers, avg(Average_Balance) as average_balance from credit_card_data
where Credit_Rating in ('High' , 'Low')
group by 1
order by 3;

### 16.In the database, which all types of communication (mailer_type) were used and with how many customers?

select Mailer_Type , count(Customer_Number) as Number_of_customers from credit_card_data
group by 1;

### 17.Provide the details of the customer that is the 11th least Q1_balance in your database.

Select * from credit_card_data 
order by Q1  
limit 10,1;

 

