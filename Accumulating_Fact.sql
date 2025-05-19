UPDATE f
SET 
    f.accm_txn_complete_time = c.accm_txn_complete_time,
    f.txn_process_time_hours = CAST(DATEDIFF(MINUTE, f.accm_txn_create_time, c.accm_txn_complete_time) AS FLOAT) / 60.0
FROM [WideWorldImporters_DataWarehouse].[dbo].[FactSales] f
INNER JOIN [WideWorldImporters_Staging].[dbo].[CompletedSales] c
    ON f.SalesID = c.InvoiceID
WHERE c.accm_txn_complete_time IS NOT NULL;
