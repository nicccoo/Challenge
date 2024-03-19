CREATE DATABASE PQS
GO
USE [PQS]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[Status] [int] NOT NULL,
	[OrderDescription] [nvarchar](255) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[AuthDate] [datetime] NULL,
 CONSTRAINT [PK_ORDER] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Items](
	[OrderItemId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ItemDescription] [nvarchar](255) NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [numeric](32, 2) NOT NULL
) ON [PRIMARY]
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vOrders_Info]
AS
SELECT        dbo.Orders.OrderId, dbo.Orders.Status, dbo.Orders.OrderDescription, dbo.Orders.CreatedOn, dbo.Order_Items.UnitPrice, SUM(dbo.Order_Items.UnitPrice * dbo.Order_Items.Quantity) AS Total, SUM(dbo.Order_Items.Quantity) 
                         AS QItems
FROM            dbo.Order_Items INNER JOIN
                         dbo.Orders ON dbo.Order_Items.OrderId = dbo.Orders.OrderId
GROUP BY dbo.Orders.OrderId, dbo.Orders.Status, dbo.Orders.OrderDescription, dbo.Orders.CreatedOn, dbo.Order_Items.UnitPrice
GO
SET IDENTITY_INSERT [dbo].[Order_Items] ON 
GO
INSERT [dbo].[Order_Items] ([OrderItemId], [OrderId], [ItemDescription], [Quantity], [UnitPrice]) VALUES (1, 1, N'Item Description 1', 10, CAST(200.00 AS Numeric(32, 2)))
GO
INSERT [dbo].[Order_Items] ([OrderItemId], [OrderId], [ItemDescription], [Quantity], [UnitPrice]) VALUES (11, 1, N'Item Description 11', 160, CAST(20.00 AS Numeric(32, 2)))
GO
INSERT [dbo].[Order_Items] ([OrderItemId], [OrderId], [ItemDescription], [Quantity], [UnitPrice]) VALUES (15, 1, N'Item Description 15', 20, CAST(1000.00 AS Numeric(32, 2)))
GO
INSERT [dbo].[Order_Items] ([OrderItemId], [OrderId], [ItemDescription], [Quantity], [UnitPrice]) VALUES (2, 2, N'Item Description 2', 24, CAST(450.00 AS Numeric(32, 2)))
GO
INSERT [dbo].[Order_Items] ([OrderItemId], [OrderId], [ItemDescription], [Quantity], [UnitPrice]) VALUES (6, 2, N'Item Description 6', 150, CAST(300.00 AS Numeric(32, 2)))
GO
INSERT [dbo].[Order_Items] ([OrderItemId], [OrderId], [ItemDescription], [Quantity], [UnitPrice]) VALUES (16, 2, N'Item Description 16', 5, CAST(2400.00 AS Numeric(32, 2)))
GO
INSERT [dbo].[Order_Items] ([OrderItemId], [OrderId], [ItemDescription], [Quantity], [UnitPrice]) VALUES (3, 3, N'Item Description 3', 30, CAST(100.00 AS Numeric(32, 2)))
GO
INSERT [dbo].[Order_Items] ([OrderItemId], [OrderId], [ItemDescription], [Quantity], [UnitPrice]) VALUES (5, 3, N'Item Description 5', 100, CAST(200.00 AS Numeric(32, 2)))
GO
INSERT [dbo].[Order_Items] ([OrderItemId], [OrderId], [ItemDescription], [Quantity], [UnitPrice]) VALUES (17, 3, N'Item Description 17', 10, CAST(3000.00 AS Numeric(32, 2)))
GO
INSERT [dbo].[Order_Items] ([OrderItemId], [OrderId], [ItemDescription], [Quantity], [UnitPrice]) VALUES (4, 4, N'Item Description 4', 15, CAST(150.00 AS Numeric(32, 2)))
GO
INSERT [dbo].[Order_Items] ([OrderItemId], [OrderId], [ItemDescription], [Quantity], [UnitPrice]) VALUES (8, 4, N'Item Description 8', 70, CAST(140.00 AS Numeric(32, 2)))
GO
INSERT [dbo].[Order_Items] ([OrderItemId], [OrderId], [ItemDescription], [Quantity], [UnitPrice]) VALUES (7, 5, N'Item Description 7', 5, CAST(900.00 AS Numeric(32, 2)))
GO
INSERT [dbo].[Order_Items] ([OrderItemId], [OrderId], [ItemDescription], [Quantity], [UnitPrice]) VALUES (9, 6, N'Item Description 9', 120, CAST(50.00 AS Numeric(32, 2)))
GO
INSERT [dbo].[Order_Items] ([OrderItemId], [OrderId], [ItemDescription], [Quantity], [UnitPrice]) VALUES (20, 6, N'Item Description 20', 170, CAST(1500.00 AS Numeric(32, 2)))
GO
INSERT [dbo].[Order_Items] ([OrderItemId], [OrderId], [ItemDescription], [Quantity], [UnitPrice]) VALUES (10, 7, N'Item Description 10', 80, CAST(1500.00 AS Numeric(32, 2)))
GO
INSERT [dbo].[Order_Items] ([OrderItemId], [OrderId], [ItemDescription], [Quantity], [UnitPrice]) VALUES (12, 8, N'Item Description 12', 450, CAST(15.00 AS Numeric(32, 2)))
GO
INSERT [dbo].[Order_Items] ([OrderItemId], [OrderId], [ItemDescription], [Quantity], [UnitPrice]) VALUES (14, 8, N'Item Description 14', 130, CAST(400.00 AS Numeric(32, 2)))
GO
INSERT [dbo].[Order_Items] ([OrderItemId], [OrderId], [ItemDescription], [Quantity], [UnitPrice]) VALUES (13, 9, N'Item Description 13', 200, CAST(600.00 AS Numeric(32, 2)))
GO
INSERT [dbo].[Order_Items] ([OrderItemId], [OrderId], [ItemDescription], [Quantity], [UnitPrice]) VALUES (19, 9, N'Item Description 19', 25, CAST(200.00 AS Numeric(32, 2)))
GO
INSERT [dbo].[Order_Items] ([OrderItemId], [OrderId], [ItemDescription], [Quantity], [UnitPrice]) VALUES (18, 10, N'Item Description 18', 32, CAST(14.00 AS Numeric(32, 2)))
GO
SET IDENTITY_INSERT [dbo].[Order_Items] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([OrderId], [Status], [OrderDescription], [CreatedOn], [AuthDate]) VALUES (1, 1, N'Order Description 1', CAST(N'2024-03-10T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Status], [OrderDescription], [CreatedOn], [AuthDate]) VALUES (2, -1, N'Order Description 2', CAST(N'2024-03-10T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Status], [OrderDescription], [CreatedOn], [AuthDate]) VALUES (3, 1, N'Order Description 3', CAST(N'2024-03-11T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Status], [OrderDescription], [CreatedOn], [AuthDate]) VALUES (4, -1, N'Order Description 4', CAST(N'2024-03-11T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Status], [OrderDescription], [CreatedOn], [AuthDate]) VALUES (5, 0, N'Order Description 5', CAST(N'2024-03-16T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Status], [OrderDescription], [CreatedOn], [AuthDate]) VALUES (6, 1, N'Order Description 6', CAST(N'2024-03-20T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Status], [OrderDescription], [CreatedOn], [AuthDate]) VALUES (7, -1, N'Order Description 7', CAST(N'2024-03-11T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Status], [OrderDescription], [CreatedOn], [AuthDate]) VALUES (8, 0, N'Order Description 8', CAST(N'2024-03-15T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Status], [OrderDescription], [CreatedOn], [AuthDate]) VALUES (9, 1, N'Order Description 9', CAST(N'2024-03-16T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [Status], [OrderDescription], [CreatedOn], [AuthDate]) VALUES (10, 1, N'Order Description 10', CAST(N'2024-03-12T00:00:00.000' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
ALTER TABLE [dbo].[Order_Items] ADD  CONSTRAINT [PK_ORDER_ITEMS] PRIMARY KEY NONCLUSTERED 
(
	[OrderItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_ORDER_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Order_Items]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_ITEMS_ORDERS] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[Order_Items] CHECK CONSTRAINT [FK_ORDER_ITEMS_ORDERS]
GO
CREATE INDEX IX_ORDER_Status ON [dbo].[Orders] (Status);
GO
CREATE CLUSTERED INDEX IX_ORDER_ITEMS_OrderId  ON [dbo].[Order_Items] (OrderId);
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Order_Items"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 227
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Orders"
            Begin Extent = 
               Top = 6
               Left = 265
               Bottom = 136
               Right = 460
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vOrders_Info'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vOrders_Info'
GO
