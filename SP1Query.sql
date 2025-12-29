CREATE OR ALTER PROCEDURE dbo.DailyTransaction
    @start_date date,
    @end_date   date
AS
BEGIN
    SET NOCOUNT ON;
    SELECT
        CAST(ft.TransactionDate AS date) AS [Date],
        COUNT(1) AS TotalTransactions,
        SUM(ft.Amount) AS TotalAmount
    FROM dbo.FactTransaction ft
    WHERE ft.TransactionDate >= @start_date
      AND ft.TransactionDate < DATEADD(day, 1, @end_date)
    GROUP BY CAST(ft.TransactionDate AS date)
    ORDER BY [Date];
END;
GO
EXEC dbo.DailyTransaction
    @start_date = '2024-01-18',
    @end_date   = '2024-01-20';