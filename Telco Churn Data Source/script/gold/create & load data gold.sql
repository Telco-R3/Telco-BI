if OBJECT_ID ('gold.DimCustomer','v') is not null
drop table gold.DimCustomer;
GO
CREATE TABLE gold.DimCustomer (
    CustomerKey      INT IDENTITY PRIMARY KEY,
    CustomerID       VARCHAR(50),         -- من Bronze/Silver
    Gender           VARCHAR(10),
    SeniorCitizen    VARCHAR(10),
    Partner          VARCHAR(10),
    Dependents       VARCHAR(10),
    City             VARCHAR(100),
    State            VARCHAR(50),
);
--===================================================

if OBJECT_ID ('gold.DimContract','v') is not null
drop table gold.DimContract;
GO
CREATE TABLE gold.DimContract (
    ContractKey   INT IDENTITY PRIMARY KEY,
    ContractType  VARCHAR(50) UNIQUE  -- Month-to-month / One year / Two year
);
--===================================================

if OBJECT_ID ('gold.DimPaymentMethod','v') is not null
drop table gold.DimPaymentMethod;
GO
CREATE TABLE gold.DimPaymentMethod (
    PaymentMethodKey INT IDENTITY PRIMARY KEY,
    PaymentMethod    VARCHAR(100) UNIQUE
);
--===================================================

if OBJECT_ID ('gold.DimChurnReason','v') is not null
drop table gold.DimChurnReason;
GO
CREATE TABLE gold.DimChurnReason (
    ChurnReasonKey INT IDENTITY PRIMARY KEY,
    ChurnReason    VARCHAR(200) UNIQUE
);

--===================================================
if OBJECT_ID ('gold.DimServices','v') is not null
drop table gold.DimServices;
GO
CREATE TABLE gold.DimServices (
    ServiceKey INT IDENTITY(1,1) PRIMARY KEY,
    PhoneService     NVARCHAR(50),
    MultipleLines    NVARCHAR(50),
    InternetService  NVARCHAR(50),
    OnlineSecurity   NVARCHAR(50),
    OnlineBackup     NVARCHAR(50),
    DeviceProtection NVARCHAR(50),
    TechSupport      NVARCHAR(50),
    StreamingTV      NVARCHAR(50),
    StreamingMovies  NVARCHAR(50)
);

--===================================================

if OBJECT_ID ('gold.FactCustomerChurn','v') is not null
drop table gold.FactCustomerChurn;
GO
CREATE TABLE gold.FactCustomerChurn (
    FactKey          BIGINT IDENTITY PRIMARY KEY,
    CustomerKey      int NOT NULL REFERENCES gold.DimCustomer(CustomerKey),
    ContractKey      INT NULL REFERENCES gold.DimContract(ContractKey),
    PaymentMethodKey INT NULL REFERENCES gold.DimPaymentMethod(PaymentMethodKey),
    ChurnReasonKey   INT NULL REFERENCES gold.DimChurnReason(ChurnReasonKey),

    TenureMonths     INT,
    MonthlyCharges   DECIMAL(10,2),
    TotalCharges     DECIMAL(12,2),
    ChurnFlag        NVARCHAR(10),                -- 0 = Active, 1 = Churned
    CLTV             DECIMAL(12,2),
    ChurnScore       DECIMAL(5,2)
);
ALTER TABLE gold.FactCustomerChurn
ADD ServiceKey INT;

--===================================================

-- Contracts
truncate table gold.DimContract 

INSERT INTO     gold.DimContract(ContractType)
SELECT DISTINCT [contract_type] 
FROM            [silver].[churn_raw]
WHERE           [contract_type] IS NOT NULL;

--===================================================

-- Payment Methods
truncate table gold.DimPaymentMethod 

INSERT INTO     gold.DimPaymentMethod(PaymentMethod)
SELECT DISTINCT payment_method 
FROM            [silver].[churn_raw]
WHERE           payment_method IS NOT NULL;

--===================================================

-- Churn Reasons
truncate table gold.DimChurnReason 

INSERT INTO      gold.DimChurnReason(ChurnReason)
SELECT DISTINCT  ISNULL(churn_reason,'n/a') 
FROM             [silver].[churn_raw];

--===================================================
--Customer
truncate table gold.DimCustomer 

INSERT INTO     gold.DimCustomer (CustomerID, Gender, SeniorCitizen, Partner, Dependents, City, State)
SELECT DISTINCT [customer_key], gender,
                [is_senior_citizen],
                [has_partner],
                [has_dependents],
                city, state
FROM            [silver].[churn_raw];
--===================================================
INSERT INTO gold.DimServices
(
   PhoneService,MultipleLines, InternetService, OnlineSecurity, OnlineBackup, 
  DeviceProtection, TechSupport, StreamingTV, StreamingMovies
)
SELECT DISTINCT
    s.has_phone_service,
    s.[has_multiple_lines],
    s.internet_service_type,
    s.[has_online_security],
    s.[has_online_backup],
    s.[has_device_protection],
    s.[has_tech_support],
    s.[has_streaming_tv],
    s.[has_streaming_movies]
FROM silver.churn_raw s;

--===================================================

-- CustomerChurn
TRUNCATE TABLE gold.FactCustomerChurn;

INSERT INTO gold.FactCustomerChurn (
    CustomerKey, ContractKey, PaymentMethodKey, ChurnReasonKey, ServiceKey,
    TenureMonths, MonthlyCharges, TotalCharges, ChurnFlag, CLTV, ChurnScore
)
SELECT
    c.CustomerKey,
    ct.ContractKey,
    pm.PaymentMethodKey,
    cr.ChurnReasonKey,
    sv.ServiceKey,
    TRY_CONVERT(INT, s.[tenure_in_months]) AS TenureMonths,
    TRY_CONVERT(DECIMAL(10,2), s.[monthly_charges_amount]) AS MonthlyCharges,
    TRY_CONVERT(DECIMAL(12,2), s.[total_charges_amount]) AS TotalCharges,
    CASE 
      WHEN s.[churn_label] IN ('1','1.0','Yes','Y','True','true') THEN 1 
      WHEN s.[churn_label] IN ('0','No','N','False','false') THEN 0
      ELSE NULL
    END AS ChurnFlag,
    TRY_CONVERT(DECIMAL(12,2), s.[cltv]) AS CLTV,
    TRY_CONVERT(DECIMAL(5,2), s.[churn_score]) AS ChurnScore
FROM [silver].[churn_raw] s
JOIN gold.DimCustomer c 
    ON c.[CustomerID] = s.[customer_key]    
LEFT JOIN gold.DimContract ct 
    ON ct.[ContractType] = s.[contract_type]
LEFT JOIN gold.DimPaymentMethod pm 
    ON pm.[PaymentMethod] = s.[payment_method]
LEFT JOIN gold.DimChurnReason cr 
    ON cr.[ChurnReason] = ISNULL(s.[churn_reason], 'n/a')
LEFT JOIN gold.DimServices sv
    ON sv.PhoneService     = s.[has_phone_service]
   AND sv.MultipleLines    = s.[has_multiple_lines]
   AND sv.InternetService  = s.[internet_service_type]
   AND sv.OnlineSecurity   = s.[has_online_security]
   AND sv.OnlineBackup     = s.[has_online_backup]
   AND sv.DeviceProtection = s.[has_device_protection]
   AND sv.TechSupport      = s.[has_tech_support]
   AND sv.StreamingTV      = s.[has_streaming_tv]
   AND sv.StreamingMovies  = s.[has_streaming_movies];
