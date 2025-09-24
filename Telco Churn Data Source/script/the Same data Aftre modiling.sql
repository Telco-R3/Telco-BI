select c.[CustomerID],c.[Gender],c.[SeniorCitizen],c.[Partner],c.[Dependents],c.[City],c.[State],s.[PhoneService],s.[MultipleLines],s.[InternetService],f.[TenureMonths],
	   p.[PaymentMethod],cc.[ContractType]
from [gold].[FactCustomerChurn] f
join [gold].[DimServices] s on s.[ServiceKey]=f.ServiceKey
join [gold].[DimPaymentMethod] p on p.PaymentMethodKey=f.PaymentMethodKey
join [gold].[DimCustomer] c on c.CustomerKey=f.CustomerKey
join [gold].[DimContract] cc on cc.ContractKey=f.ContractKey

where CustomerID ='0002-ORFBO' or CustomerID ='0003-MKNFE'


select *
from [silver].[churn_raw]
where customer_key='0002-ORFBO' or customer_key ='0003-MKNFE'
