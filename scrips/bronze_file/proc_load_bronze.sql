CREATE OR ALTER PROCEDURE [bronze].[sp_load_source_data]
AS
BEGIN
BEGIN TRY
    PRINT '============================================================'
    PRINT 'Loading source data into Bronze layer tables...'
    PRINT 'Start Time: ' + CAST(GETDATE() AS VARCHAR(30))
    PRINT '============================================================'
    
    PRINT ''
    PRINT '------------------------------------------------------------'
    PRINT 'TABLE 1/6: Loading [bronze].[crm_cust_info]...'
    PRINT '------------------------------------------------------------'
    TRUNCATE TABLE [bronze].[crm_cust_info];
    BULK INSERT [bronze].[crm_cust_info]
    FROM 'C:\Users\jaidhev\Downloads\project_sql\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
    WITH (
        FIRSTROW = 2, 
        FIELDTERMINATOR = ',', 
        TABLOCK
    );
    PRINT 'SUCCESS: [bronze].[crm_cust_info] loaded.'
    
    PRINT ''
    PRINT '------------------------------------------------------------'
    PRINT 'TABLE 2/6: Loading [bronze].[crm_prd_info]...'
    PRINT '------------------------------------------------------------'
    TRUNCATE TABLE [bronze].[crm_prd_info];
    BULK INSERT [bronze].[crm_prd_info]
    FROM 'C:\Users\jaidhev\Downloads\project_sql\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',', 
        TABLOCK
    );
    PRINT 'SUCCESS: [bronze].[crm_prd_info] loaded.'
    
    PRINT ''
    PRINT '------------------------------------------------------------'
    PRINT 'TABLE 3/6: Loading [bronze].[crm_sales_details]...'
    PRINT '------------------------------------------------------------'
    TRUNCATE TABLE [bronze].[crm_sales_details];
    BULK INSERT [bronze].[crm_sales_details]
    FROM 'C:\Users\jaidhev\Downloads\project_sql\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
    WITH (
        FIRSTROW = 2, 
        FIELDTERMINATOR = ',', 
        TABLOCK
        );
    PRINT 'SUCCESS: [bronze].[crm_sales_details] loaded.'
    
    PRINT ''
    PRINT '------------------------------------------------------------'
    PRINT 'TABLE 4/6: Loading [bronze].[erp_a101]...'
    PRINT '------------------------------------------------------------'
    TRUNCATE TABLE [bronze].[erp_a101];
    BULK INSERT [bronze].[erp_a101]
    FROM 'C:\Users\jaidhev\Downloads\project_sql\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
          );
    PRINT 'SUCCESS: [bronze].[erp_a101] loaded.'
    
    PRINT ''
    PRINT '------------------------------------------------------------'
    PRINT 'TABLE 5/6: Loading [bronze].[erp_CUST_AZ12]...'
    PRINT '------------------------------------------------------------'
    TRUNCATE TABLE [bronze].[erp_CUST_AZ12];
    BULK INSERT [bronze].[erp_CUST_AZ12]
    FROM 'C:\Users\jaidhev\Downloads\project_sql\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
          );
    PRINT 'SUCCESS: [bronze].[erp_CUST_AZ12] loaded.'
    
    PRINT ''
    PRINT '------------------------------------------------------------'
    PRINT 'TABLE 6/6: Loading [bronze].[erp_px_cat_g1v2]...'
    PRINT '------------------------------------------------------------'
    TRUNCATE TABLE [bronze].[erp_px_cat_g1v2];
    BULK INSERT [bronze].[erp_px_cat_g1v2]
    FROM 'C:\Users\jaidhev\Downloads\project_sql\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
    WITH (
        FIRSTROW = 2, 
        FIELDTERMINATOR = ',', 
        TABLOCK);
    PRINT 'SUCCESS: [bronze].[erp_px_cat_g1v2] loaded.'
    
    PRINT ''
    PRINT '============================================================'
    PRINT 'Data loading completed successfully!'
    PRINT 'End Time: ' + CAST(GETDATE() AS VARCHAR(30))
    PRINT '============================================================'
END TRY
BEGIN CATCH
    PRINT '============================================================'
    PRINT 'ERROR: An error occurred while loading source data.'
    PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS VARCHAR(10))
    PRINT 'Error Message: ' + ERROR_MESSAGE()
    PRINT 'End Time: ' + CAST(GETDATE() AS VARCHAR(30))
    PRINT '============================================================'
END CATCH
END
