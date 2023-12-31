CREATE DATABASE [Banking]

USE [Banking]
GO

CREATE TABLE [dbo].[Accounts](
	[Account_Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountNumber] [varchar](50) NOT NULL,
	[MoneyInAccount] [decimal](10, 2) NULL,
	[OwnerName] [varchar](50) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[CustomerId] [int] NULL,
	[AccountOpenDate] [datetime] NOT NULL,
	[Locked] [bit] NULL,
	[TransactionPassword] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Account_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[AccountNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Address](
	[AddressId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[State] [varchar](50) NOT NULL,
	[ZipCode] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
GO
CREATE TABLE [dbo].[Admin](
	[AdminId] [int] NOT NULL,
	[Username] [varchar](20) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[FullName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Phone] [varchar](20) NOT NULL,
	[Role] [varchar](20) NOT NULL,
	[Permission] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AdminId] ASC

GO
CREATE TABLE [dbo].[ChequeRequests](
	[RequestId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[ChequeRequestType] [varchar](50) NOT NULL,
	[ChequeRequestDate] [datetime] NOT NULL,
	[ChequeRequestStatus] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RequestId] ASC

CREATE TABLE [dbo].[Customers](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](12) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[ConfirmPassword] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[FullName] [varchar](50) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[CitizenId] [varchar](12) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
GO

CREATE TABLE [dbo].[Login](
	[LoginId] [int] NOT NULL,
	[CustomerId] [int] NULL,
	[LoginDate] [datetime] NOT NULL,
	[IsSuccessful] [bit] NOT NULL,
	[LoginAttempts] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LoginId] ASC
 
GO
CREATE TABLE [dbo].[Reports](
	[ReportId] [int] NOT NULL,
	[AccountId] [int] NOT NULL,
	[ReportType] [varchar](50) NOT NULL,
	[ReportData] [text] NOT NULL,
	[ReportDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ReportId] ASC

CREATE TABLE [dbo].[StopPayment](
	[StopPaymentId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[ChequeNumber] [varchar](50) NOT NULL,
	[StopPaymentRequestDate] [datetime] NOT NULL,
	[StopPaymentStatus] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StopPaymentId] ASC

CREATE TABLE [dbo].[SupportRequest](
	[SupportRequestId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[SupportRequestType] [varchar](50) NOT NULL,
	[SupportRequestDate] [datetime] NOT NULL,
	[SupportStatus] [varchar](50) NOT NULL,
	[Description] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SupportRequestId] ASC

GO
CREATE TABLE [dbo].[SupportResponse](
	[SupportResponseId] [int] NOT NULL,
	[SupportRequestId] [int] NOT NULL,
	[ResponseDate] [datetime] NOT NULL,
	[ResponseContent] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SupportResponseId] ASC
GO
CREATE TABLE [dbo].[Transactions](
	[TransactionId] [int] NOT NULL,
	[SenderAccountId] [int] NOT NULL,
	[ReceiverAccountId] [int] NOT NULL,
	[Amount] [decimal](10, 2) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[TypeTransaction] [varchar](50) NOT NULL,
	[BeneficiaryBank] [varchar](50) NOT NULL,
	[TransactionFee] [decimal](10, 2) NOT NULL,
	[TransactionDescription] [varchar](255) NOT NULL,
	[AccountId] [int] NOT NULL,
	[TransactionStatus] [varchar](10) NULL,
	[TransactionMessage] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC

GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerId])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Customers]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerId])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Customer]
GO
ALTER TABLE [dbo].[ChequeRequests]  WITH CHECK ADD  CONSTRAINT [FK_ChequeRequests_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerId])
GO
ALTER TABLE [dbo].[ChequeRequests] CHECK CONSTRAINT [FK_ChequeRequests_Customer]
GO
ALTER TABLE [dbo].[Reports]  WITH CHECK ADD  CONSTRAINT [FK_Reports_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([Account_Id])
GO
ALTER TABLE [dbo].[Reports] CHECK CONSTRAINT [FK_Reports_Accounts]
GO
ALTER TABLE [dbo].[StopPayment]  WITH CHECK ADD  CONSTRAINT [FK_StopPayment_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerId])
GO
ALTER TABLE [dbo].[StopPayment] CHECK CONSTRAINT [FK_StopPayment_Customer]
GO
ALTER TABLE [dbo].[SupportRequest]  WITH CHECK ADD  CONSTRAINT [FK_SupportRequest_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerId])
GO
ALTER TABLE [dbo].[SupportRequest] CHECK CONSTRAINT [FK_SupportRequest_Customer]
GO
ALTER TABLE [dbo].[SupportResponse]  WITH CHECK ADD  CONSTRAINT [FK_SupportResponse_SupportRequest] FOREIGN KEY([SupportRequestId])
REFERENCES [dbo].[SupportRequest] ([SupportRequestId])
GO
ALTER TABLE [dbo].[SupportResponse] CHECK CONSTRAINT [FK_SupportResponse_SupportRequest]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([Account_Id])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Accounts]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Accounts_Receiver] FOREIGN KEY([ReceiverAccountId])
REFERENCES [dbo].[Accounts] ([Account_Id])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Accounts_Receiver]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Accounts_Sender] FOREIGN KEY([SenderAccountId])
REFERENCES [dbo].[Accounts] ([Account_Id])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Accounts_Sender]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [CK_TransactionPassword_Column] CHECK  (([TransactionPassword]>=(1000) AND [TransactionPassword]<=(999999)))
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [CK_TransactionPassword_Column]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD CHECK  (([TransactionStatus]='Fail' OR [TransactionStatus]='Success'))

