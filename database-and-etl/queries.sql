-- ==========================================
-- ALM / Banking Data Aggregation Pipeline
-- Purpose: Extracting monthly balance sheet data for maturity gap analysis
-- ==========================================

SELECT 
    ReportingMonth,
    ProductCategory,
    Currency,
    SUM(PrincipalAmount) AS TotalPrincipal,
    AVG(InterestRate) AS WeightedAverageRate,
    CASE 
        WHEN RemainingMaturityDays <= 30 THEN '0-30 Days'
        WHEN RemainingMaturityDays <= 90 THEN '31-90 Days'
        WHEN RemainingMaturityDays <= 365 THEN '91-365 Days'
        ELSE '1 Year+'
    END AS MaturityBucket
FROM 
    dbo.BankPortfolioRaw
WHERE 
    IsActive = 1
GROUP BY 
    ReportingMonth, ProductCategory, Currency,
    CASE 
        WHEN RemainingMaturityDays <= 30 THEN '0-30 Days'
        WHEN RemainingMaturityDays <= 90 THEN '31-90 Days'
        WHEN RemainingMaturityDays <= 365 THEN '91-365 Days'
        ELSE '1 Year+'
    END
ORDER BY 
    ReportingMonth DESC, TotalPrincipal DESC;
