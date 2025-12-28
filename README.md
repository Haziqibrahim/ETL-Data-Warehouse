# ETL-Data-Warehouse
Overview
This project is an end-to-end Data Warehouse implementation built using Pentaho Data Integration (PDI / Spoon) and Microsoft SQL Server. The project focuses on transforming raw transaction data from multiple sources into a structured Data Warehouse that can be used for analytical reporting.

The main purpose of this project is to practice real Data Engineering workflows, including ETL development, data modeling, data cleansing, and analytical reporting using stored procedures.

Architecture
Source systems:
-SQL Server operational tables
-CSV files
-Excel files

ETL tool:
-Pentaho Data Integration (Spoon)

Target system:
-SQL Server Data Warehouse

The Data Warehouse is designed using a star schema to support efficient analytical queries.

Data Warehouse Design
Dimension tables:
-DimCustomer: stores customer master data
-DimAccount: stores account information and balances
-DimBranch: stores branch information

Fact table:
-FactTransaction: stores transaction records and connects all dimensions

ETL Process

Extract
Data is extracted from SQL tables, CSV files, and Excel files.

Transform
-Standardizing data types (date, numeric, string)
-Handling different date formats from multiple sources
-Removing duplicate records
-Applying business rules for transaction types

Load
-Table Output is used for initial loads
-Insert / Update is used for incremental loads
-Primary key constraints are handled to avoid duplicate data
