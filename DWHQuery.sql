CREATE DATABASE DWH;
GO
USE DWH;
GO

CREATE TABLE DimAccount (
    AccountID      INT           NOT NULL,
    CustomerID     INT           NOT NULL,
    AccountType    VARCHAR(50)   NULL,
    Balance        DECIMAL(18,2) NULL,
    DateOpened     DATE          NULL,
    Status         VARCHAR(20)   NULL,
    CONSTRAINT PK_DimAccount PRIMARY KEY (AccountID)
);

CREATE TABLE DimBranch (
    BranchID        INT          NOT NULL,
    BranchName      VARCHAR(200) NULL,
    BranchLocation  VARCHAR(300) NULL,
    CONSTRAINT PK_DimBranch PRIMARY KEY (BranchID)
);

CREATE TABLE DimCustomer (
    CustomerID     INT          NOT NULL,
    CustomerName   VARCHAR(200) NULL,
    Address        VARCHAR(300) NULL,
    CityName       VARCHAR(200) NULL,
    StateName      VARCHAR(200) NULL,
    Age            INT          NULL,
    Gender         VARCHAR(20)  NULL,
    Email          VARCHAR(200) NULL,
    CONSTRAINT PK_DimCustomer PRIMARY KEY (CustomerID)
);

CREATE TABLE FactTransaction (
    TransactionID     INT            NOT NULL,
    AccountID         INT            NOT NULL,
    TransactionDate   DATETIME       NOT NULL,
    Amount            DECIMAL(18,2)  NOT NULL,
    TransactionType   VARCHAR(50)    NOT NULL,
    BranchID          INT            NOT NULL,
    CONSTRAINT PK_FactTransaction PRIMARY KEY (TransactionID),
    CONSTRAINT FK_FactTransaction_Account FOREIGN KEY (AccountID) REFERENCES DimAccount(AccountID),
    CONSTRAINT FK_FactTransaction_Branch  FOREIGN KEY (BranchID)  REFERENCES DimBranch(BranchID)
);