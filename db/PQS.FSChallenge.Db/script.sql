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