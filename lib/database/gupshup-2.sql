SET DATEFORMAT ymd
-- File name: C:\Users\DELL\Documents\gupshup-2.sql\n-- Created by MSSQL Library http://www.dbconvert.com\n

---- Table structure for table `users` 
----

CREATE TABLE [users] ([id] BIGINT IDENTITY(1,1)  ,[name] VARCHAR(255) NOT NULL  ,[email] VARCHAR(255) NOT NULL  ,[usertype] VARCHAR(255) NOT NULL  DEFAULT 'user' ,[phone] VARCHAR(255) NULL  ,[address] VARCHAR(255) NULL  ,[email_verified_at] DATETIME NULL  ,[password] VARCHAR(255) NOT NULL  ,[two_factor_secret] NTEXT NULL  ,[two_factor_recovery_codes] NTEXT NULL  ,[two_factor_confirmed_at] DATETIME NULL  ,[remember_token] VARCHAR(100) NULL  ,[current_team_id] BIGINT NULL  ,[profile_photo_path] VARCHAR(2048) NULL  ,[created_at] DATETIME NULL  ,[updated_at] DATETIME NULL  ,CONSTRAINT [users_users_PRIMARY]  PRIMARY KEY  NONCLUSTERED  ([id])); 
 CREATE  UNIQUE  NONCLUSTERED  INDEX [users_users_email_unique] ON [users] ([email]);

---- Table structure for table `area` 
----

CREATE TABLE [area] ([areaId] BIGINT IDENTITY(1,1)  ,[areaTitle] VARCHAR(255) NOT NULL  ,[uId] BIGINT NOT NULL  ,[created_at] DATETIME NULL  ,[updated_at] DATETIME NULL  ,CONSTRAINT [area_area_PRIMARY]  PRIMARY KEY  NONCLUSTERED  ([areaId]), CONSTRAINT [area_area_uid_foreign] FOREIGN KEY ("uId") REFERENCES "users" ( "id" ) ON UPDATE NO ACTION ON DELETE NO ACTION); 
 CREATE  NONCLUSTERED  INDEX [area_area_uid_foreign] ON [area] ([uId]);
ALTER TABLE [area] CHECK CONSTRAINT [area_area_uid_foreign];

---- Table structure for table `currency` 
----

CREATE TABLE [currency] ([currencyId] BIGINT IDENTITY(1,1)  ,[currencyTitle] VARCHAR(255) NOT NULL  ,[uId] BIGINT NOT NULL  ,[created_at] DATETIME NULL  ,[updated_at] DATETIME NULL  ,CONSTRAINT [currency_currency_PRIMARY]  PRIMARY KEY  NONCLUSTERED  ([currencyId]), CONSTRAINT [currency_currency_uid_foreign] FOREIGN KEY ("uId") REFERENCES "users" ( "id" ) ON UPDATE NO ACTION ON DELETE NO ACTION); 
 CREATE  NONCLUSTERED  INDEX [currency_currency_uid_foreign] ON [currency] ([uId]);
ALTER TABLE [currency] CHECK CONSTRAINT [currency_currency_uid_foreign];

---- Table structure for table `acctype` 
----

CREATE TABLE [acctype] ([accTypeId] BIGINT IDENTITY(1,1)  ,[accTypeTitle] VARCHAR(255) NOT NULL  ,[uId] BIGINT NOT NULL  ,[created_at] DATETIME NULL  ,[updated_at] DATETIME NULL  ,CONSTRAINT [acctype_acctype_PRIMARY]  PRIMARY KEY  NONCLUSTERED  ([accTypeId]), CONSTRAINT [acctype_acctype_uid_foreign] FOREIGN KEY ("uId") REFERENCES "users" ( "id" ) ON UPDATE NO ACTION ON DELETE NO ACTION); 
 CREATE  NONCLUSTERED  INDEX [acctype_acctype_uid_foreign] ON [acctype] ([uId]);
ALTER TABLE [acctype] NOCHECK CONSTRAINT [acctype_acctype_uid_foreign];

---- Table structure for table `books` 
----

CREATE TABLE [books] ([id] BIGINT IDENTITY(1,1)  ,[phone] VARCHAR(255) NOT NULL  ,[guest] VARCHAR(255) NOT NULL  ,[time] VARCHAR(255) NOT NULL  ,[date] VARCHAR(255) NOT NULL  ,[note] VARCHAR(255) NOT NULL  ,[status] VARCHAR(255) NOT NULL  DEFAULT 'Pending' ,[created_at] DATETIME NULL  ,[updated_at] DATETIME NULL  ,CONSTRAINT [books_books_PRIMARY]  PRIMARY KEY  NONCLUSTERED  ([id])); 

---- Table structure for table `cache` 
----

CREATE TABLE [cache] ([key] VARCHAR(255) NOT NULL  ,[value] NTEXT NOT NULL  ,[expiration] INT NOT NULL  ,CONSTRAINT [cache_cache_PRIMARY]  PRIMARY KEY  NONCLUSTERED  ([key])); 

---- Table structure for table `cache_locks` 
----

CREATE TABLE [cache_locks] ([key] VARCHAR(255) NOT NULL  ,[owner] VARCHAR(255) NOT NULL  ,[expiration] INT NOT NULL  ,CONSTRAINT [cache_locks_cache_locks_PRIMARY]  PRIMARY KEY  NONCLUSTERED  ([key])); 

---- Table structure for table `carts` 
----

CREATE TABLE [carts] ([id] BIGINT IDENTITY(1,1)  ,[title] VARCHAR(255) NULL  ,[detail] NTEXT NULL  ,[image] VARCHAR(255) NULL  ,[price] FLOAT NOT NULL  DEFAULT 0 ,[userid] VARCHAR(255) NULL  ,[qty] FLOAT NOT NULL  DEFAULT 0 ,[created_at] DATETIME NULL  ,[updated_at] DATETIME NULL  ,CONSTRAINT [carts_carts_PRIMARY]  PRIMARY KEY  NONCLUSTERED  ([id])); 

---- Table structure for table `accparent` 
----

CREATE TABLE [accparent] ([parentId] BIGINT IDENTITY(1,1)  ,[accParentTitle] VARCHAR(255) NOT NULL  ,[accTypeId] BIGINT NOT NULL  ,[uId] BIGINT NOT NULL  ,[created_at] DATETIME NULL  ,[updated_at] DATETIME NULL  ,CONSTRAINT [accparent_accparent_PRIMARY]  PRIMARY KEY  NONCLUSTERED  ([parentId]), CONSTRAINT [accparent_accparent_acctypeid_foreign] FOREIGN KEY ("accTypeId") REFERENCES "acctype" ( "accTypeId" ) ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT [accparent_accparent_uid_foreign] FOREIGN KEY ("uId") REFERENCES "users" ( "id" ) ON UPDATE NO ACTION ON DELETE NO ACTION); 
 CREATE  NONCLUSTERED  INDEX [accparent_accparent_acctypeid_foreign] ON [accparent] ([accTypeId]);
 CREATE  NONCLUSTERED  INDEX [accparent_accparent_uid_foreign] ON [accparent] ([uId]);
ALTER TABLE [accparent] NOCHECK CONSTRAINT [accparent_accparent_acctypeid_foreign];
ALTER TABLE [accparent] NOCHECK CONSTRAINT [accparent_accparent_uid_foreign];

---- Table structure for table `failed_jobs` 
----

CREATE TABLE [failed_jobs] ([id] BIGINT IDENTITY(1,1)  ,[uuid] VARCHAR(255) NOT NULL  ,[connection] NTEXT NOT NULL  ,[queue] NTEXT NOT NULL  ,[payload] NTEXT NOT NULL  ,[exception] NTEXT NOT NULL  ,[failed_at] DATETIME NOT NULL  ,CONSTRAINT [failed_jobs_failed_jobs_PRIMARY]  PRIMARY KEY  NONCLUSTERED  ([id])); 
 CREATE  UNIQUE  NONCLUSTERED  INDEX [failed_jobs_failed_jobs_uuid_unique] ON [failed_jobs] ([uuid]);

---- Table structure for table `food` 
----

CREATE TABLE [food] ([id] BIGINT IDENTITY(1,1)  ,[title] VARCHAR(255) NULL  ,[detail] NTEXT NULL  ,[price] FLOAT NOT NULL  DEFAULT 0 ,[image] VARCHAR(255) NULL  ,[created_at] DATETIME NULL  ,[updated_at] DATETIME NULL  ,CONSTRAINT [food_food_PRIMARY]  PRIMARY KEY  NONCLUSTERED  ([id])); 

---- Table structure for table `job_batches` 
----

CREATE TABLE [job_batches] ([id] VARCHAR(255) NOT NULL  ,[name] VARCHAR(255) NOT NULL  ,[total_jobs] INT NOT NULL  ,[pending_jobs] INT NOT NULL  ,[failed_jobs] INT NOT NULL  ,[failed_job_ids] NTEXT NOT NULL  ,[options] NTEXT NULL  ,[cancelled_at] INT NULL  ,[created_at] INT NOT NULL  ,[finished_at] INT NULL  ,CONSTRAINT [job_batches_job_batches_PRIMARY]  PRIMARY KEY  NONCLUSTERED  ([id])); 

---- Table structure for table `jobs` 
----

CREATE TABLE [jobs] ([id] BIGINT IDENTITY(1,1)  ,[queue] VARCHAR(255) NOT NULL  ,[payload] NTEXT NOT NULL  ,[attempts] SMALLINT NOT NULL  ,[reserved_at] BIGINT NULL  ,[available_at] BIGINT NOT NULL  ,[created_at] BIGINT NOT NULL  ,CONSTRAINT [jobs_jobs_PRIMARY]  PRIMARY KEY  NONCLUSTERED  ([id])); 
 CREATE  NONCLUSTERED  INDEX [jobs_jobs_queue_index] ON [jobs] ([queue]);

---- Table structure for table `migrations` 
----

CREATE TABLE [migrations] ([id] BIGINT IDENTITY(1,1)  ,[migration] VARCHAR(255) NOT NULL  ,[batch] INT NOT NULL  ,CONSTRAINT [migrations_migrations_PRIMARY]  PRIMARY KEY  NONCLUSTERED  ([id])); 

---- Table structure for table `orders` 
----

CREATE TABLE [orders] ([id] BIGINT IDENTITY(1,1)  ,[name] VARCHAR(255) NULL  ,[email] VARCHAR(255) NULL  ,[address] VARCHAR(255) NULL  ,[phone] VARCHAR(255) NULL  ,[title] VARCHAR(255) NULL  ,[qty] VARCHAR(255) NULL  ,[price] VARCHAR(255) NULL  ,[image] VARCHAR(255) NULL  ,[delivery_status] VARCHAR(255) NOT NULL  DEFAULT 'In Progress' ,[created_at] DATETIME NULL  ,[updated_at] DATETIME NULL  ,CONSTRAINT [orders_orders_PRIMARY]  PRIMARY KEY  NONCLUSTERED  ([id])); 

---- Table structure for table `password_reset_tokens` 
----

CREATE TABLE [password_reset_tokens] ([email] VARCHAR(255) NOT NULL  ,[token] VARCHAR(255) NOT NULL  ,[created_at] DATETIME NULL  ,CONSTRAINT [password_reset_tokens_password_reset_tokens_PRIMARY]  PRIMARY KEY  NONCLUSTERED  ([email])); 

---- Table structure for table `personal_access_tokens` 
----

CREATE TABLE [personal_access_tokens] ([id] BIGINT IDENTITY(1,1)  ,[tokenable_type] VARCHAR(255) NOT NULL  ,[tokenable_id] BIGINT NOT NULL  ,[name] VARCHAR(255) NOT NULL  ,[token] VARCHAR(64) NOT NULL  ,[abilities] NTEXT NULL  ,[last_used_at] DATETIME NULL  ,[expires_at] DATETIME NULL  ,[created_at] DATETIME NULL  ,[updated_at] DATETIME NULL  ,CONSTRAINT [personal_access_tokens_personal_access_tokens_PRIMARY]  PRIMARY KEY  NONCLUSTERED  ([id])); 
 CREATE  UNIQUE  NONCLUSTERED  INDEX [personal_access_tokens_personal_access_tokens_token_unique] ON [personal_access_tokens] ([token]);
 CREATE  NONCLUSTERED  INDEX [personal_access_tokens_personal_access_tokens_tokenable_type_tokenable_id_index] ON [personal_access_tokens] ([tokenable_type],[tokenable_id]);

---- Table structure for table `sessions` 
----

CREATE TABLE [sessions] ([id] VARCHAR(255) NOT NULL  ,[user_id] BIGINT NULL  ,[ip_address] VARCHAR(45) NULL  ,[user_agent] NTEXT NULL  ,[payload] NTEXT NOT NULL  ,[last_activity] INT NOT NULL  ,CONSTRAINT [sessions_sessions_PRIMARY]  PRIMARY KEY  NONCLUSTERED  ([id])); 
 CREATE  NONCLUSTERED  INDEX [sessions_sessions_user_id_index] ON [sessions] ([user_id]);
 CREATE  NONCLUSTERED  INDEX [sessions_sessions_last_activity_index] ON [sessions] ([last_activity]);

---- Table structure for table `accounts` 
----

CREATE TABLE [accounts] ([acId] BIGINT IDENTITY(1,1)  ,[acTitle] VARCHAR(255) NOT NULL  ,[email] VARCHAR(255) NULL  ,[mobile] VARCHAR(255) NULL  ,[openingBal] FLOAT NOT NULL  DEFAULT 0 ,[CurrentBal] FLOAT NOT NULL  DEFAULT 0 ,[uId] BIGINT NOT NULL  ,[currencyId] BIGINT NOT NULL  ,[accTypeId] BIGINT NOT NULL  ,[parentId] BIGINT NOT NULL  ,[areaId] BIGINT NULL  ,[created_at] DATETIME NULL  ,[updated_at] DATETIME NULL  ,CONSTRAINT [accounts_accounts_PRIMARY]  PRIMARY KEY  NONCLUSTERED  ([acId]), CONSTRAINT [accounts_accounts_acctypeid_foreign] FOREIGN KEY ("accTypeId") REFERENCES "acctype" ( "accTypeId" ) ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT [accounts_accounts_areaid_foreign] FOREIGN KEY ("areaId") REFERENCES "area" ( "areaId" ) ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT [accounts_accounts_currencyid_foreign] FOREIGN KEY ("currencyId") REFERENCES "currency" ( "currencyId" ) ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT [accounts_accounts_parentid_foreign] FOREIGN KEY ("parentId") REFERENCES "accparent" ( "parentId" ) ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT [accounts_accounts_uid_foreign] FOREIGN KEY ("uId") REFERENCES "users" ( "id" ) ON UPDATE NO ACTION ON DELETE NO ACTION); 
 CREATE  NONCLUSTERED  INDEX [accounts_accounts_uid_foreign] ON [accounts] ([uId]);
 CREATE  NONCLUSTERED  INDEX [accounts_accounts_currencyid_foreign] ON [accounts] ([currencyId]);
 CREATE  NONCLUSTERED  INDEX [accounts_accounts_acctypeid_foreign] ON [accounts] ([accTypeId]);
 CREATE  NONCLUSTERED  INDEX [accounts_accounts_parentid_foreign] ON [accounts] ([parentId]);
 CREATE  NONCLUSTERED  INDEX [accounts_accounts_areaid_foreign] ON [accounts] ([areaId]);
ALTER TABLE [accounts] NOCHECK CONSTRAINT [accounts_accounts_acctypeid_foreign];
ALTER TABLE [accounts] NOCHECK CONSTRAINT [accounts_accounts_areaid_foreign];
ALTER TABLE [accounts] CHECK CONSTRAINT [accounts_accounts_currencyid_foreign];
ALTER TABLE [accounts] NOCHECK CONSTRAINT [accounts_accounts_parentid_foreign];
ALTER TABLE [accounts] NOCHECK CONSTRAINT [accounts_accounts_uid_foreign];

---- Table structure for table `vouchers` 
----

CREATE TABLE [vouchers] ([voucherId] BIGINT IDENTITY(1,1)  ,[voucherDate] DATETIME NOT NULL  ,[voucherPrefix] VARCHAR(255) NOT NULL  ,[remarks] NTEXT NULL  ,[drAcId] BIGINT NULL  ,[crAcId] BIGINT NULL  ,[debit] FLOAT NOT NULL  DEFAULT 0 ,[credit] FLOAT NOT NULL  DEFAULT 0 ,[debitSR] FLOAT NOT NULL  DEFAULT 0 ,[creditSR] FLOAT NOT NULL  DEFAULT 0 ,[uId] BIGINT NOT NULL  ,[created_at] DATETIME NULL  ,[updated_at] DATETIME NULL  ,CONSTRAINT [vouchers_vouchers_PRIMARY]  PRIMARY KEY  NONCLUSTERED  ([voucherId]), CONSTRAINT [vouchers_vouchers_cracid_foreign] FOREIGN KEY ("crAcId") REFERENCES "accounts" ( "acId" ) ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT [vouchers_vouchers_dracid_foreign] FOREIGN KEY ("drAcId") REFERENCES "accounts" ( "acId" ) ON UPDATE NO ACTION ON DELETE NO ACTION, CONSTRAINT [vouchers_vouchers_uid_foreign] FOREIGN KEY ("uId") REFERENCES "users" ( "id" ) ON UPDATE NO ACTION ON DELETE NO ACTION); 
 CREATE  NONCLUSTERED  INDEX [vouchers_vouchers_dracid_foreign] ON [vouchers] ([drAcId]);
 CREATE  NONCLUSTERED  INDEX [vouchers_vouchers_cracid_foreign] ON [vouchers] ([crAcId]);
 CREATE  NONCLUSTERED  INDEX [vouchers_vouchers_uid_foreign] ON [vouchers] ([uId]);
ALTER TABLE [vouchers] CHECK CONSTRAINT [vouchers_vouchers_cracid_foreign];
ALTER TABLE [vouchers] CHECK CONSTRAINT [vouchers_vouchers_dracid_foreign];
ALTER TABLE [vouchers] NOCHECK CONSTRAINT [vouchers_vouchers_uid_foreign];

---- Dumping data for table `users`
---- 


 SET IDENTITY_INSERT [users] ON 
 GO

INSERT INTO [users] ([id],[name],[email],[usertype],[phone],[address],[email_verified_at],[password],[two_factor_secret],[two_factor_recovery_codes],[two_factor_confirmed_at],[remember_token],[current_team_id],[profile_photo_path],[created_at],[updated_at])( select 1,N'admin',N'admin@gmail.com',N'admin',N'+923346013608',N'Moza Wan Chattah',NULL,N'$2y$12$7W1r0rwebfloKOYJvtzZdObM9EdhF96wMRhzmL1Ra.L7m9UQHMUq2',NULL,NULL,NULL,N'MbzSEHEfgv8VjH1O1B1GI8DRXXLbSG066ogTsU60V75oq12D3U3lMBfj7OOt',NULL,NULL,N'2024-11-12 06:40:13',N'2024-11-12 06:40:13') union all ( select 2,N'user1',N'user1@gmail.com',N'user',N'+923346013608',N'Moza Wan Chattah',NULL,N'$2y$12$lIdweM8XLVfIlY3106WoZ.p8cXPLhiLRTCPxA8a1n36x04/WBt1pK',NULL,NULL,NULL,NULL,NULL,NULL,N'2024-11-13 06:26:33',N'2024-11-13 06:26:33')

 SET IDENTITY_INSERT [users] OFF 
 GO


---- Dumping data for table `area`
---- 


 SET IDENTITY_INSERT [area] ON 
 GO

INSERT INTO [area] ([areaId],[areaTitle],[uId],[created_at],[updated_at])( select 1,N'MULTAN',1,N'2024-11-12 06:41:13',N'2024-11-12 06:41:13') union all ( select 2,N'LAHORE',1,N'2024-11-14 06:44:38',N'2024-11-14 06:44:38') union all ( select 3,N'ISLAMABAD',1,N'2024-11-14 06:44:43',N'2024-11-14 06:44:43') union all ( select 4,N'KARACHI',1,N'2024-11-14 06:44:47',N'2024-11-14 06:44:47') union all ( select 5,N'RAWALPINDI 2',1,N'2024-11-14 06:44:53',N'2024-11-16 07:16:21') union all ( select 6,N'RAWALPINDI',1,N'2024-11-16 07:16:33',N'2024-11-16 07:16:33')

 SET IDENTITY_INSERT [area] OFF 
 GO


---- Dumping data for table `currency`
---- 


 SET IDENTITY_INSERT [currency] ON 
 GO

INSERT INTO [currency] ([currencyId],[currencyTitle],[uId],[created_at],[updated_at])( select 1,N'PKR',1,N'2024-11-12 06:40:44',N'2024-11-12 06:40:44') union all ( select 2,N'SAR',1,N'2024-11-14 06:40:55',N'2024-11-14 06:40:55') union all ( select 3,N'USD',1,N'2024-11-14 06:40:58',N'2024-11-14 06:40:58') union all ( select 4,N'UAE',1,N'2024-11-14 06:41:02',N'2024-11-14 06:41:02')

 SET IDENTITY_INSERT [currency] OFF 
 GO


---- Dumping data for table `acctype`
---- 


 SET IDENTITY_INSERT [acctype] ON 
 GO

INSERT INTO [acctype] ([accTypeId],[accTypeTitle],[uId],[created_at],[updated_at])( select 1,N'BANK',1,N'2024-11-12 06:41:45',N'2024-11-16 06:47:09') union all ( select 2,N'CUSTOMER',1,N'2024-11-14 06:41:26',N'2024-11-14 06:41:31') union all ( select 3,N'SUPPLIER',1,N'2024-11-14 06:41:38',N'2024-11-14 06:41:38') union all ( select 4,N'CAPITAL',1,N'2024-11-14 06:42:10',N'2024-11-14 06:42:10') union all ( select 5,N'REVENUE',1,N'2024-11-14 06:42:16',N'2024-11-14 06:42:16') union all ( select 6,N'EXPENSE',1,N'2024-11-14 06:42:19',N'2024-11-14 06:42:19') union all ( select 9,N'Admin Expense',1,N'2024-11-16 07:09:12',N'2024-11-16 07:09:27')

 SET IDENTITY_INSERT [acctype] OFF 
 GO


---- Dumping data for table `cache`
---- 

INSERT INTO [cache] ([key],[value],[expiration])( select N'c525a5357e97fef8d3db25841c86da1a',N'i:1;',1732087340) union all ( select N'c525a5357e97fef8d3db25841c86da1a:timer',N'i:1732087340;',1732087340) union all ( select N'e10fd735ad88f21f45ee9e47870c152d',N'i:1;',1731479321) union all ( select N'e10fd735ad88f21f45ee9e47870c152d:timer',N'i:1731479321;',1731479321)

---- Dumping data for table `accparent`
---- 


 SET IDENTITY_INSERT [accparent] ON 
 GO

INSERT INTO [accparent] ([parentId],[accParentTitle],[accTypeId],[uId],[created_at],[updated_at])( select 1,N'CASH & BANKS',1,1,N'2024-11-12 06:42:07',N'2024-11-14 06:42:46') union all ( select 2,N'PARTIES',2,1,N'2024-11-14 06:42:53',N'2024-11-14 06:42:53') union all ( select 3,N'VENDORS',3,1,N'2024-11-14 06:43:01',N'2024-11-14 06:43:01') union all ( select 4,N'CAPITAL & DRAWINGS',4,1,N'2024-11-14 06:43:16',N'2024-11-14 06:43:16') union all ( select 5,N'SALES & CGS',5,1,N'2024-11-14 06:43:41',N'2024-11-14 06:43:41') union all ( select 6,N'ADMIN EXPENSES',6,1,N'2024-11-14 06:43:50',N'2024-11-14 06:43:50')

 SET IDENTITY_INSERT [accparent] OFF 
 GO


---- Dumping data for table `migrations`
---- 


 SET IDENTITY_INSERT [migrations] ON 
 GO

INSERT INTO [migrations] ([id],[migration],[batch])( select 1,N'0001_01_01_000000_create_users_table',1) union all ( select 2,N'0001_01_01_000001_create_cache_table',1) union all ( select 3,N'0001_01_01_000002_create_jobs_table',1) union all ( select 4,N'2024_09_24_070807_create_personal_access_tokens_table',1) union all ( select 5,N'2024_09_26_064606_create_currency_table',1) union all ( select 6,N'2024_09_26_064623_create_area_table',1) union all ( select 7,N'2024_09_26_064655_create_accType_table',1) union all ( select 8,N'2024_09_26_064659_create_accParent_table',1) union all ( select 9,N'2024_09_26_064710_create_accounts_table',1) union all ( select 10,N'2024_09_26_064726_create_vouchers_table',1) union all ( select 11,N'2024_10_09_160153_add_two_factor_columns_to_users_table',1) union all ( select 12,N'2024_10_10_153823_create_food_table',1) union all ( select 13,N'2024_10_16_171949_create_carts_table',1) union all ( select 14,N'2024_10_16_181215_add_userid_field_to_carts',1) union all ( select 15,N'2024_10_18_154219_create_orders_table',1) union all ( select 16,N'2024_10_25_031747_create_books_table',1)

 SET IDENTITY_INSERT [migrations] OFF 
 GO


---- Dumping data for table `personal_access_tokens`
---- 


 SET IDENTITY_INSERT [personal_access_tokens] ON 
 GO

INSERT INTO [personal_access_tokens] ([id],[tokenable_type],[tokenable_id],[name],[token],[abilities],[last_used_at],[expires_at],[created_at],[updated_at])( select 2,N'App\\Models\\User',2,N'API Token',N'8c6cdda9f1ed34009a3dfd9ba3ef28ab4db024d3adfbeda57391b231f42cb0c6',N'["*"]',NULL,NULL,N'2024-11-16 06:42:49',N'2024-11-16 06:42:49') union all ( select 3,N'App\\Models\\User',1,N'API Token',N'7866cf43595e973978eb7c49a0cd64dbf94004dadba25b3a31c1891bea6a34f8',N'["*"]',N'2024-11-16 09:04:44',NULL,N'2024-11-16 06:43:29',N'2024-11-16 09:04:44')

 SET IDENTITY_INSERT [personal_access_tokens] OFF 
 GO


---- Dumping data for table `accounts`
---- 


 SET IDENTITY_INSERT [accounts] ON 
 GO

INSERT INTO [accounts] ([acId],[acTitle],[email],[mobile],[openingBal],[CurrentBal],[uId],[currencyId],[accTypeId],[parentId],[areaId],[created_at],[updated_at])( select 1,N'Mustafa',NULL,NULL,0,0,1,1,1,1,1,N'2024-11-12 06:42:38',N'2024-11-12 06:42:38') union all ( select 2,N'Burhan',NULL,NULL,0,0,1,2,3,3,3,N'2024-11-14 06:45:21',N'2024-11-14 06:45:21') union all ( select 3,N'Farhand',NULL,NULL,0,0,1,4,2,2,4,N'2024-11-14 06:45:41',N'2024-11-14 06:45:41') union all ( select 4,N'Muzamil',NULL,NULL,0,0,1,4,3,3,2,N'2024-11-14 06:46:09',N'2024-11-14 06:46:09') union all ( select 5,N'Raees',NULL,NULL,0,0,1,3,5,5,5,N'2024-11-14 06:46:30',N'2024-11-14 06:46:30') union all ( select 6,N'Qaiser',NULL,NULL,0,0,1,3,4,4,1,N'2024-11-14 06:47:00',N'2024-11-14 06:47:00') union all ( select 7,N'Salaman BUTT',N'salamanbutt@gmail.com',N'+923346013608',0,0,1,2,9,1,6,N'2024-11-16 07:34:37',N'2024-11-16 07:34:37') union all ( select 8,N'Noor SB',N'noorsb@gmail.com',N'+923346013608',0,0,1,1,1,1,3,N'2024-11-16 07:37:52',N'2024-11-16 07:37:52')

 SET IDENTITY_INSERT [accounts] OFF 
 GO


---- Dumping data for table `vouchers`
---- 


 SET IDENTITY_INSERT [vouchers] ON 
 GO

INSERT INTO [vouchers] ([voucherId],[voucherDate],[voucherPrefix],[remarks],[drAcId],[crAcId],[debit],[credit],[debitSR],[creditSR],[uId],[created_at],[updated_at])( select 1,N'2024-11-14',N'CR',N'Cash Received.',NULL,6,0,1000,0,100,1,N'2024-11-12 06:43:32',N'2024-11-14 06:55:18') union all ( select 2,N'2024-11-14',N'CR',N'Cash Received.',NULL,4,0,2000,0,200,1,N'2024-11-12 06:45:26',N'2024-11-14 07:00:22') union all ( select 3,N'2024-11-14',N'CP',N'Cash Paid.',3,NULL,300,0,30,0,1,N'2024-11-12 06:48:38',N'2024-11-14 07:02:09') union all ( select 4,N'2024-11-14',N'CP',N'Cash Paid.',2,NULL,200,0,20,0,1,N'2024-11-14 07:00:47',N'2024-11-14 07:00:47') union all ( select 5,N'2024-11-14',N'JV',N'Amount Transfered.',5,6,400,400,40,40,1,N'2024-11-14 07:01:43',N'2024-11-14 07:01:43') union all ( select 6,N'2024-11-14',N'CP',N'Cash Paid.',1,NULL,400,0,40,0,1,N'2024-11-14 07:05:36',N'2024-11-14 07:05:51') union all ( select 7,N'2024-11-14',N'CR',N'Cash Received.',NULL,1,0,100,0,10,1,N'2024-11-14 07:07:14',N'2024-11-14 07:07:14') union all ( select 8,N'2024-11-14',N'JV',N'Amount Transfered.',2,1,200,200,20,20,1,N'2024-11-14 07:07:55',N'2024-11-14 07:07:55') union all ( select 9,N'2024-11-14',N'JV',N'Amount Transfered.',1,5,600,600,60,60,1,N'2024-11-14 07:08:14',N'2024-11-14 07:08:14') union all ( select 10,N'2024-11-16',N'CR',N'Cash Received.',NULL,1,0,50,0,5,1,N'2024-11-16 06:48:06',N'2024-11-16 06:48:06') union all ( select 11,N'2024-11-16',N'CP',N'Cash Paid.',6,NULL,40,0,4,0,1,N'2024-11-16 06:54:53',N'2024-11-16 06:54:53') union all ( select 12,N'2024-11-16',N'JV',N'Amount Transferred.',2,3,50,50,5,5,1,N'2024-11-16 07:03:35',N'2024-11-16 07:03:35')

 SET IDENTITY_INSERT [vouchers] OFF 
 GO

