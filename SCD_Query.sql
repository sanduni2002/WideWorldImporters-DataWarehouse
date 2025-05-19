
select * from WideWorldImporters_DataWarehouse.dbo.DimCustomer
where AlternateCustomerID = 841

select * from WideWorldImporters_Staging.dbo.stg_Customers
where CustomerID = 841

update WideWorldImporters_Staging.dbo.stg_Customers
set DeliveryAddressLine1 = 'Shop 11 '