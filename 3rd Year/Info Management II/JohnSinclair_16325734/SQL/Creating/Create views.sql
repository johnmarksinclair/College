use GUI;

drop view if exists detailed_comp_entries;
drop view if exists detailed_competitions;
drop view if exists detailed_players;
drop view if exists detailed_rounds;
drop view if exists club_directory;

create view detailed_comp_entries as
select
	Competition_Entry.Timestamp as `Entry_Made`,
    Player.Player_ID, Player.First_Name, Player.Last_Name, 
    Competition.Name as `Competition`, Golf_Club.Name as `Club_Name`
from Competition_Entry
inner join Competition
    on Competition.Competition_ID = Competition_Entry.Competition_ID
inner join Player
    on Competition_Entry.Player_ID = Player.Player_ID 
inner join Golf_Club 
    on Competition.Club_ID = Golf_Club.Club_ID
order by Competition_Entry.Timestamp DESC;

create view detailed_competitions as
select 
    Province.Name as `Province`, Golf_Club.Name as `Club_Name`, 
    Competition.Name, Competition.Date, Golf_Club.Phone_Number
from Province
inner join Golf_Club 
    on Province.Province_ID = Golf_Club.Province_ID
inner join Competition
    on Golf_Club.Club_ID = Competition.Club_ID
order by Province.Province_ID, Golf_Club.Club_ID, Competition.Date ASC;

create view detailed_players as
select 
    Province.Name as `Province`, Golf_Club.Name as `Club_Name`,
    Player.Player_ID, Player.First_Name, Player.Last_Name, Player.DOB, Player.OWGR, Player.Handicap
from Province
inner join Golf_Club 
    on Province.Province_ID = Golf_Club.Province_ID
inner join Player
    on Golf_Club.Club_ID = Player.Club_ID
order by Province.Name, Golf_Club.Name, Player.Handicap ASC;

create view detailed_rounds as
select 
    Province.Name as `Province`, Golf_Club.Name as `Club_Name`, Round.Date,
    Player.Player_ID, Player.First_Name, Player.Last_Name, 
    Round.Gross_Score, Round.Net_Score
from Player
inner join Round 
    on Player.Player_ID = Round.Player_ID
inner join Golf_Club
    on Round.Club_ID = Golf_Club.Club_ID
inner join Province
    on Province.Province_ID = Golf_Club.Province_ID
order by Province.Name, Golf_Club.Name, Player.Player_ID ASC, Round.Date DESC;

create view club_directory as
select 
    Province.Name as `Province`, Golf_Club.Name as `Club_Name`, Golf_Club.Phone_Number
from Province
inner join Golf_Club 
    on Province.Province_ID = Golf_Club.Province_ID
order by Province.Name, Golf_Club.Name;

select * from detailed_comp_entries;
select * from detailed_competitions;
select * from detailed_players;
select * from detailed_rounds;
select * from club_directory;