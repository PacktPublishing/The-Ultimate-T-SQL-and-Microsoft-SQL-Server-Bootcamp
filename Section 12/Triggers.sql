/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [HistoryID]
      ,[OrderID]
      ,[Action]
      ,[ActionDate]
      ,[CustomerName]
      ,[OrderDate]
      ,[TotalAmount]
  FROM [Demo].[dbo].[OrderHistory]