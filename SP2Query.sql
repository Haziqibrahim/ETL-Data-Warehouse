CREATE OR ALTER PROCEDURE BalancePerCustomer
    @name nvarchar(200)
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @name_trim nvarchar(200) = LTRIM(RTRIM(@name));
    SELECT
        dc.CustomerName,
        da.AccountType,
        da.Balance,
        da.Balance
        + COALESCE(
            SUM(
                CASE
                    WHEN ft.TransactionType = 'Deposit' THEN ft.Amount
                    ELSE -ft.Amount
                END
            ), 0
          ) AS CurrentBalance
    FROM DimCustomer dc
    JOIN DimAccount da
        ON da.CustomerID = dc.CustomerID
    LEFT JOIN dbo.FactTransaction ft
        ON ft.AccountID = da.AccountID
    WHERE da.Status = 'active'
      AND dc.CustomerName LIKE '%' + @name_trim + '%' COLLATE Latin1_General_CI_AI
    GROUP BY
        dc.CustomerName,
        da.AccountType,
        da.Balance
    ORDER BY
        dc.CustomerName,
        da.AccountType;
END;
GO

EXEC BalancePerCustomer @name = 'Shelly';