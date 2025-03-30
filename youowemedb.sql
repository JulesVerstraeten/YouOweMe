DROP TABLE IF EXISTS dbo.[User]
DROP TABLE IF EXISTS dbo.[Contact]
DROP TABLE IF EXISTS dbo.[Transaction]

CREATE TABLE dbo.[User] (
	id int identity(1,1) primary key,
	first_name nvarchar(40) not null,
	last_name nvarchar(60) not null,
	email nvarchar(100) not null,
	created_at datetime2 not null
);

ALTER TABLE dbo.[User] ADD CONSTRAINT UQ_USER_EMAIL UNIQUE (email);
ALTER TABLE dbo.[User] ADD CONSTRAINT DF_USER_CREATED_AT DEFAULT SYSDATETIME() FOR created_at;

CREATE TABLE dbo.[Contact] (
	id int identity(1,1) primary key,
	contact_name nvarchar(100) not null,
	user_id int not null
);

ALTER TABLE dbo.[Contact] ADD CONSTRAINT FK_CONTACT_USER FOREIGN KEY (user_id) REFERENCES dbo.[User](id);

CREATE TABLE dbo.[Transaction] (
	id int identity(1,1) primary key,
	amount float not null,
	title nvarchar(20) not null,
	description nvarchar(300),
	contact_id int not null,
	user_id int not null,
	created_at datetime2 not null ,
	payement_date datetime2,
	transaction_status nvarchar(20) not null
);

ALTER TABLE dbo.[Transaction] ADD CONSTRAINT DF_TRANSACTION_CREATED_AT DEFAULT SYSDATETIME() FOR created_at;
ALTER TABLE dbo.[Transaction] ADD CONSTRAINT FK_TRANSACTION_CONTACT FOREIGN KEY (contact_id) REFERENCES dbo.[Contact](id);
ALTER TABLE dbo.[Transaction] ADD CONSTRAINT FK_TRANSACTION_USER FOREIGN KEY (user_id) REFERENCES dbo.[User](id);

CREATE TABLE dbo.[Payement] (
	id int identity(1,1) primary key,
	amount float not null,
	created_at datetime2 not null,
	transaction_id int not null
);

ALTER TABLE dbo.[Payement] ADD CONSTRAINT DF_PAYEMENT_CREATED_AT DEFAULT SYSDATETIME() FOR created_at;
ALTER TABLE dbo.[Payement] ADD CONSTRAINT FK_PAYEMENT_TRANSACTION FOREIGN KEY (transaction_id) REFERENCES dbo.[Transaction](id);