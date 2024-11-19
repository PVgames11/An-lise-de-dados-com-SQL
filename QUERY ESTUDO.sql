use AdventureWorksDW2022
--Quantidade de Clientes distintos
Select count ( distinct CustomerKey)
from FactInternetSales
--Total de vendas
select 
	SUM( SALESAMOUNT)
from FactInternetSales
--Média de vendas
select 
	AVG(salesamount)
from FactInternetSales



--Total de vendas que foram carregadas em 2013
select 
	SUM(salesamount) as vendas
from	
	FactInternetSales
inner join 
	DimDate on DimDate.DateKey = FactInternetSales.ShipDateKey
where 
	CalendarYear = '2013'


--País que mais vendeu em 2013 
select 
	SUM(salesamount) as vendas,
	DimSalesTerritory.SalesTerritoryCountry
from	
	FactInternetSales
inner join 
	DimDate on DimDate.DateKey = FactInternetSales.ShipDateKey
inner join  
	DimSalesTerritory on DimSalesTerritory.SalesTerritoryKey = FactInternetSales.SalesTerritoryKey
where 
	CalendarYear = '2013'
group by 
	SalesTerritoryCountry
order by 
	vendas desc

-- Produtos mais vendidos em 2013 nos EUA 
SELECT top 5
    SUM(OrderQuantity) AS TotalOrderQuantity,
	SUM(SalesAmount) AS VENDAS,
	DIMPRODUCT.ModelName,
	DimSalesTerritory.SalesTerritoryCountry
FROM    
    FactInternetSales
INNER JOIN 
    DIMPRODUCT ON DIMPRODUCT.ProductKey = FactInternetSales.ProductKey
inner join 
	DimDate on DimDate.DateKey = FactInternetSales.ShipDateKey
inner join  
	DimSalesTerritory on DimSalesTerritory.SalesTerritoryKey = FactInternetSales.SalesTerritoryKey
where 
	CalendarYear = '2013' and SalesTerritoryCountry = 'United States'
GROUP BY 
    DIMPRODUCT.ModelName,
	DimSalesTerritory.SalesTerritoryCountry
ORDER BY
    TotalOrderQuantity desc ;
--Produtos mais vendidos  em 2013
	SELECT top 5
    SUM(OrderQuantity) AS TotalOrderQuantity,
	SUM(SalesAmount) AS VENDAS,
    DIMPRODUCT.ModelName
FROM    
    FactInternetSales
INNER JOIN 
    DIMPRODUCT ON DIMPRODUCT.ProductKey = FactInternetSales.ProductKey
	inner join 
	DimDate on DimDate.DateKey = FactInternetSales.ShipDateKey
where 
	CalendarYear = '2013'
GROUP BY 
    DIMPRODUCT.ModelName	
ORDER BY
    TotalOrderQuantity desc ;

	--  TOP 5 Produtos mais vendidos
SELECT top 5
    SUM(OrderQuantity) AS TotalOrderQuantity,
    DIMPRODUCT.ModelName
FROM    
    FactInternetSales
INNER JOIN 
    DIMPRODUCT ON DIMPRODUCT.ProductKey = FactInternetSales.ProductKey
GROUP BY 
    DIMPRODUCT.ModelName
ORDER BY
    TotalOrderQuantity DESC;



--Top 5 clientes que mais gastaram		
SELECT TOP 5
	SUM (SALESAMOUNT) AS VENDAS,
	DimCustomer.FirstName,
	DIMCUSTOMER.LastName,
	DimCustomer.EnglishOccupation,
	DimCustomer.Gender,
	DimCustomer.MaritalStatus,
	DimCustomer.AddressLine1,
	DimCustomer.EnglishEducation,
	DimCustomer.EnglishOccupation,
	DimCustomer.HouseOwnerFlag,
	DimCustomer.NumberCarsOwned,
	DimCustomer.NumberChildrenAtHome
FROM	
	FactInternetSales
INNER JOIN 
	DimCustomer ON DimCustomer.CustomerKey = FactInternetSales.CustomerKey
INNER JOIN
	DimDate ON DimDate.DateKey = FactInternetSales.ShipDateKey
	WHERE CalendarYear = '2013'
GROUP BY
	FirstName,
	LASTNAME,
	EnglishOccupation,
	Gender,
	MaritalStatus,
	AddressLine1,
	DimCustomer.EnglishEducation,
	DimCustomer.EnglishOccupation,
	DimCustomer.HouseOwnerFlag,
	DimCustomer.NumberCarsOwned,
	DimCustomer.NumberChildrenAtHome
ORDER BY
	VENDAS DESC

	select
	*
	from DimCustomer
-- O ano com o maior valor total de vendas
select 
	SUM(salesamount) as vendas,
	dimdate.CalendarYear
from	
	FactInternetSales
inner join 
	DimDate on DimDate.DateKey = FactInternetSales.ShipDateKey
group by 
	CalendarYear
order by
	vendas desc

-- Total de frete pago em 2013
SELECT 
    SUM(FactInternetSales.Freight) AS Frete,
	DimSalesTerritory.SalesTerritoryCountry
FROM 
    FactInternetSales
INNER JOIN 
    DimDate ON DimDate.DateKey = FactInternetSales.ShipDateKey
INNER JOIN  
	DimSalesTerritory on DimSalesTerritory.SalesTerritoryKey = FactInternetSales.SalesTerritoryKey
WHERE 
    DimDate.CalendarYear = 2013
GROUP BY 
    DimDate.CalendarYear,
	DimSalesTerritory.SalesTerritoryCountry
ORDER BY 
    Frete DESC;

	


