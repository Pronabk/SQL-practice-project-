use walmart_sales;
select * from walmartsales;
-- CREATING CLEANED TABLE
create table cleaned_walmartdata as 
select `Invoice ID`, Branch, City, `Customer type`, Gender, `Product line`,
 cast(`Unit price` AS DECIMAL(10,2)) AS Unit_price, Quantity, 
 cast(`Tax 5%` AS DECIMAL(10,2)) AS `Tax_5%`, 
 cast(Total AS DECIMAL(10,2)) AS Total, 
 str_to_date(`Date`, '%d-%m-%Y') as sale_date, 
 monthname(str_to_date(`Date`, '%d-%m-%Y')) as Months, 
 cast(`Time` as time) as sale_time, Payment, 
 cast(Cogs as decimal(10,2)) as Cogs, 
 cast(`gross margin percentage` as decimal(10,2)) as gross_margin_percentage, 
 cast(`gross income` as decimal(10,2)) as gross_income, 
 cast(Rating as decimal(10,2)) as Rating, 
 `Customer ID` FROM walmartsales;
SELECT * FROM cleaned_walmartdata;


-- CHEKING FOR NULL VALUES
select * from cleaned_walmartdata where 
`Invoice ID` is null or Branch is null or City is null or
 `Unit_price` is null or Quantity is null;

-- CHECKING FOR DUPLICATE VALUES IN INVOICE ID
select `Invoice ID`, count(*) from cleaned_walmartdata
 group by `Invoice ID` HAVING count(*)>1; 
 
 
 -- TRIMING TEXT COLUMNS
update cleaned_walmartdata set
`Invoice ID`=trim(`Invoice ID`),
Branch= trim(Branch),
City= trim(City),
`Customer type`= trim(`Customer type`),
Gender= trim(Gender),
`Product line`= trim(`Product line`),
Months= trim(Months),
Payment= trim(Payment);

 