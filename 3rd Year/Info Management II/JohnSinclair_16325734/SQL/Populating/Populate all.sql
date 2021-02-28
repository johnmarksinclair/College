use GUI;

insert into Province ( Name, Phone_Number, Email) 
values ('GUI National Headquarters','+353 (0)1 5054000','information@gui.ie'),
('Connacht Golf','+353 (0)94 9028141','info@connacht.gui.ie'),
('Leinster Golf','+353 (0)1 6016842','info@leinster.gui.ie'),
('Munster Golf','+353 (0)22 21026','info@munster.gui.ie'),
('Ulster Golf','+44 (0)28 9049 1891','info@connacht.gui.ie');

insert into Golf_Club (Name, Address, Phone_Number,Province_ID)
values ('Carton House Golf Club','Carton House, Carton Demesne, Maynooth, Co. Kildare','(01) 651 7715',3),
('The K Club','The K Club, Straffan, Co. Kildare','(01) 601 7200',3),
('Adare Manor Golf Club','Limerick Road, Adare, Co. Limerick','(061) 396 204',4),
('Ballyliffin Golf Club','Ballyliffin, Co. Donegal','(074) 937 6119',5),
('Carne Golf Links','Carne, Belmullet, Co. Mayo','(097) 82292',2);

insert into Employee (First_name, Last_Name, Role, Salary, DOB, Club_ID,Province_ID)
values ('Kenny','Fahy','Head Professional',35000,'1984-03-14',NULL,1),
('Callum','Slater','Assistant Professional',21000,'1995-06-02',NULL,1),
('David','Smith','Head Professional',25000,'1983-06-02',1,NULL),
('Harry','OBrien','Assistant Professional',18000,'1993-06-02',1,NULL),
('David','Lonergan','Head Professional',28000,'1977-03-12',2,NULL),
('Jason','Duggan','Head Professional',31000,'1989-11-09',3,NULL),
('Adam','Patrick','Head Professional',29700,'1987-03-17',4,NULL),
('Connor','Matthews','Head Professional',27500,'1978-01-27',5,NULL);

insert into Competition (Name,Date,Club_ID)
values ('Captains Prize','2021-06-12',1),
('Scratch Cup','2020-08-12',1),
('Monthly Medal','2021-01-07',1),
('Ryder Cup','2027-09-28',3),
('Captains Prize','2021-06-12',2),
('Monthly Medal','2021-01-07',2);

insert into Player (First_Name,Last_Name,DOB,OWGR,Handicap,Club_ID)
values ('John','Sinclair','1998-03-16',NULL,13.4,1),
('Marc','Boucher','1997-08-02',1907,-5.5,1),
('Gavin','Sinclair','2001-11-27',NULL,19.2,1),
('Cathal','MacCanna','2001-03-16',NULL,0.4,1),
('Eoin','Sullivan','2000-12-11',NULL,-4.1,1),
('David','Gahan','1997-01-23',NULL,22.0,1),
('Ronan','ONeill','1998-03-26',NULL,23.1,2);

insert into Round (Gross_Score,Net_Score,Date,Club_ID,Player_ID)
values (89,72,'2020-10-18',1,1),
(87,70,'2020-10-11',1,1),
(90,73,'2020-10-03',1,1),
(87,70,'2020-09-29',1,1),
(89,72,'2020-09-22',1,1),
(86,69,'2020-09-20',1,1),
(99,74,'2020-10-18',2,7);

insert into Competition_Entry (Player_ID,Competition_ID)
values (1,1),
(1,3),
(7,5),
(3,3),
(4,3),
(6,3);

select * from competition;
select * from competition_entry;
select * from employee;
select * from golf_club;
select * from player;
select * from province;
select * from round; 