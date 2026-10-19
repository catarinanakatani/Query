select * from Suppliers 

select * from Customers

select * from categories

select * from products

select * from Employees

select EmployeeID,FirstName,ReportsTo from Employees


select * from [order details]

select *,UnitPrice*Quantity as 'subtotal'  
					from [order details]

--mostrar os clientes da frança
select * from Customers where country='france' 

--mostrar os fornecedores da japan
select * from Suppliers where country='japan' 
--mostrar os produtos que são bebidas
select * from products where CategoryID='1' 
--mostrar os produtos com preco maior ou igual a 80
select * from products where UnitPrice>=80

--mostrar os produtos que são bebidas
select * from products 
		where CategoryID='1'  or CategoryID='8'

		
--mostrar os produtos com preço maior 50 e menor que 80
select * from products 
		where UnitPrice>50  and  UnitPrice<80

--mostre os itens vendidos no pedido 10250
select * from [order details] where orderid=10250

--pedidos com a data de hoje
select * from  orders where orderdate= '20260811' 
select * from  orders where orderdate= '11/08/2026' 


select sum(unitprice*Quantity) 
	from  orders as o INNER JOIN [Order Details] as od
				ON o.orderid=od.OrderID
		where orderdate>= '01/07/2026' 
						and orderdate<= '31/07/2026' 


---**************************************

--mostrar os produtos com preço maior 50 e menor que 80
select * from products 
		where UnitPrice>50  and  UnitPrice<80


select * from products 
		where UnitPrice between 50 and 80



select * from  orders 
	where orderdate between '01/07/2026' 
						and  '31/07/2026'

--mostrar os clientes da frança,portugal, espanha e alemanha
select * from Customers where 
		country='france' or 
		country='portugal' or 
		country='spain' or 
		country='germany' 

select * from Customers where 
		country in('france','portugal',
		'spain','germany') 


---- CLAUSULA --  LIKE
--pequisou o cliente com apenas o inicio do nome
select * from customers
		where companyname  like 'alfreds%'

--clientes que iniciam com a letra A
select * from customers
		where companyname  like 'a%'

-- empresa que o nome inicia com GOURMET
select * from customers
		where companyname  like 'gourmet%'		
-- empresa que o nome ternina com GOURMET
select * from customers
		where companyname  like '%gourmet'

-- empresa que tenha  GOURMET no nome
select * from customers
		where companyname  like '%gourmet%'
		

select * from customers
		where contactname  like '[d-l]%'



--Unir as tabelas de PRODUTOS e CATEGORIAS
select * from  products  INNER JOIN categories 				
		ON products.categoryid=categories.categoryid


select * from  products as p INNER JOIN categories as c				
		ON p.categoryid=c.categoryid
		
--Unir as tabelas de PRODUCTS e SUPPLIERS
select * from  products as p INNER JOIN Suppliers  as s				
		ON p.SupplierID =s.SupplierID 

--Unir as tabelas de ORDERS e CUSTOMERS

select * from  orders as o INNER JOIN Customers as c				
		ON o.CustomerID=c.CustomerID 

		





--Unir as tabelas de ORDERS e SHIPPERS

select * from  orders as o INNER JOIN Shippers as s			
		ON o.shipvia =s.ShipperID		

select * from  orders  INNER JOIN Shippers 			
		ON shipvia = ShipperID



--Unir as tabelas de PRODUCTS e SUPPLIERS
select * from  products as p INNER JOIN Suppliers  as s				
		ON p.SupplierID =s.SupplierID 
							INNER JOIN categories as c
							ON p.CategoryID=c.CategoryID




--Unir as tabelas de ORDERS e CUSTOMERS

select distinct companyname, categoryname
		from  orders as o INNER JOIN Customers as c				
							ON o.CustomerID=c.CustomerID 
						  INNER JOIN [Order Details] as od
						    ON o.Orderid=od.OrderID
						INNER JOIN products as p 
						    ON p.ProductID= od.productid
						INNER JOIN Categories as ca
						    On ca.CategoryID = p.CategoryID 

--Unir as 4 tabelas de REGION,TERRITORIES, EMPLOYEETERRITORIES 
--						e EMPLOYEES	
select * from region as r  INNER JOIN territories as t
						ON  t.RegionID = r.RegionID
					INNER JOIN EmployeeTerritories as et
					ON  t.TerritoryID= et.TerritoryID
					INNER JOIN Employees e
					ON et.EmployeeID = e.EmployeeID 

--Mostrar qual Região cada um dos funcionários atende 
select distinct r.*,FirstName from region as r  INNER JOIN territories as t
						ON  t.RegionID = r.RegionID
					INNER JOIN EmployeeTerritories as et
					ON  t.TerritoryID= et.TerritoryID
					INNER JOIN Employees e
					ON et.EmployeeID = e.EmployeeID 
					
---***************************
---***************************
--FUNÇÕES DE AGREGAÇÃO

---***************************
---***************************
/*
COUNT - Contar a quantidade de registros
SUM   - Somar uma coluna
AVG   - Média de uma coluna
MAX   - Maior valor de uma coluna
MIN   - Menor valor de uma coluna
*/

select  max (unitprice) from products


select  min (unitprice) from products
select * from products where unitprice=2.5



select * from products 
	where unitprice=(select  min (unitprice) from products)



	----COUNT

select count(*) from products

--qual a quantidade de produtos são bebidas
select count(*) from products where CategoryID=1

-- qual a quantidade de clientes da frança (france)
select count(*) from Customers where country='france'

--qual a quantidade de pedidos do funcionario de código 2
select count(*) from orders where EmployeeID='2'

-----AVG
--media do preço de todos os produtos
select avg(unitprice) from Products

--media do preço dos  produtos que são bebidas 
select avg(unitprice) from Products where categoryid=1

--média do frete (freight) dos pedidos 
select avg(freight) from orders  



--Unir as tabelas de ORDERS e CUSTOMERS
select avg(freight) from  orders as o INNER JOIN Customers as c				
		ON o.CustomerID=c.CustomerID 
		where country='brazil'

--------SUM
--soma do frete (freight) dos pedidos 
select sum(freight) from orders  

--soma do frete (freight) dos pedidos, 
--que os clientes seja do BRAZIL
select sum(freight) from  orders as o INNER JOIN Customers as c				
		ON o.CustomerID=c.CustomerID 
		where country='brazil'




