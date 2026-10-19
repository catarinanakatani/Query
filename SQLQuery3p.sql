select * from Customers
select * from Customers where city= 'Sao Paulo'

select * from Products
select * from Products where unitprice >= '80' 
select * from Products where unitprice >= '50' and unitprice <= '80'

select * from Products where discontinued = '1'

select * from Customers where companyname like 'gourmet%'
select * from Customers where companyname like '%gourmet'
select * from Customers where companyname like '%gourmet%'