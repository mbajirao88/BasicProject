create database projectDB;

create table RoleMaster
(
  RoleId int identity(1001,1) primary key,
  RoleDescription varchar(30),
  IsActive bit default 1,
  CreatedOn datetime default getdate(),
  CreatedBy varchar(50) default 'System'
)

insert into RoleMaster(RoleDescription)values('Admin'),('User')
select * from RoleMaster

create table UserMaster
(
  Uid int identity primary key,
  FirstName varchar(20),
  LastName varchar(20),
  DOB datetime,
  Gender varchar(1),
  Username varchar(50) UNIQUE,
  Password varchar(50),
  IsActive bit default 0,
  IsAdminApprovalDone bit default 0,
  CreatedOn datetime default getdate(),
  CreatedBy varchar(50) default 'System',
  Role int references RoleMaster(RoleId)
)

insert into UserMaster
(FirstName,LastName,DOB,Gender,Username,Password,IsActive,IsAdminApprovalDone
,Role)
values
('Sample','Admin','2000-05-10','M','admin','123456',1,1,1001),
('Sample','User','2000-02-10','M','user','123456',1,1,1002)
select * from UserMaster