drop database if exists GUI;

CREATE DATABASE GUI;

USE GUI;

drop table if exists Province;
drop table if exists Golf_Club;
drop table if exists Employee;
drop table if exists Competition;
drop table if exists Player;
drop table if exists Round;
drop table if exists Competition_Entry;

CREATE TABLE Province
(
  Province_ID INT NOT NULL AUTO_INCREMENT,

  Name VARCHAR(30) NOT NULL,
  Phone_Number VARCHAR(30) NOT NULL,
  Email VARCHAR(50) NOT NULL,

  PRIMARY KEY (Province_ID)
);

CREATE TABLE Golf_Club
(
  Club_ID INT NOT NULL AUTO_INCREMENT,

  Name VARCHAR(50) NOT NULL,
  Address VARCHAR(100) NOT NULL,
  Phone_Number VARCHAR(30) NOT NULL,
  Province_ID INT NOT NULL,

  constraint no_national_clubs
  check (
    (Province_ID != 1)
  ),

  PRIMARY KEY (Club_ID),
  FOREIGN KEY (Province_ID) REFERENCES Province(Province_ID)
);

CREATE TABLE Employee
(
  Employee_ID INT NOT NULL AUTO_INCREMENT,

  First_Name VARCHAR(50) NOT NULL,
  Last_Name VARCHAR(50) NOT NULL,
  Role VARCHAR(50) NOT NULL,
  Salary INT NOT NULL,
  DOB DATE NOT NULL,
  Club_ID INT,
  Province_ID INT,

  constraint employed_at_only_one_location
  check(
    (Club_ID is NULL and Province_ID is NOT NULL)
    or (Club_ID is NOT NULL and Province_ID is NULL)
  ),

  PRIMARY KEY (Employee_ID),
  FOREIGN KEY (Club_ID) REFERENCES Golf_Club(Club_ID),
  FOREIGN KEY (Province_ID) REFERENCES Province(Province_ID)
);

CREATE TABLE Competition
(
  Competition_ID INT NOT NULL AUTO_INCREMENT,

  Name VARCHAR(50) NOT NULL,
  Date DATE NOT NULL,
  Club_ID INT NOT NULL,

  PRIMARY KEY (Competition_ID),
  FOREIGN KEY (Club_ID) REFERENCES Golf_Club(Club_ID)
);

CREATE TABLE Player
(
  Player_ID INT NOT NULL AUTO_INCREMENT,

  First_Name VARCHAR(50) NOT NULL,
  Last_Name VARCHAR(50) NOT NULL,
  DOB DATE NOT NULL,
  OWGR INT,
  Handicap FLOAT NOT NULL,
  Club_ID INT NOT NULL,

  constraint max_handicap
  check(
    (Handicap <= 54.0)
  ),

  PRIMARY KEY (Player_ID),
  FOREIGN KEY (Club_ID) REFERENCES Golf_Club(Club_ID)
);

CREATE TABLE Round
(
  Round_ID INT NOT NULL AUTO_INCREMENT,

  Gross_Score INT NOT NULL,
  Net_Score INT NOT NULL,
  Date DATE NOT NULL,
  Club_ID INT NOT NULL,
  Player_ID INT NOT NULL,

  PRIMARY KEY (Round_ID),
  FOREIGN KEY (Club_ID) REFERENCES Golf_Club(Club_ID),
  FOREIGN KEY (Player_ID) REFERENCES Player(Player_ID)
);

CREATE TABLE Competition_Entry
(
  Player_ID INT NOT NULL,
  Competition_ID INT NOT NULL,
  Timestamp DATETIME DEFAULT now(),
  
  FOREIGN KEY (Player_ID) REFERENCES Player(Player_ID),
  FOREIGN KEY (Competition_ID) REFERENCES Competition(Competition_ID)
);

select * from competition;
select * from competition_entry;
select * from employee;
select * from golf_club;
select * from player;
select * from province;
select * from round; 