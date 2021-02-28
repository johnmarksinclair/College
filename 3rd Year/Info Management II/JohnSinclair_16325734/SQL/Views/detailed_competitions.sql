use GUI;

drop view if exists detailed_competitions;

create view detailed_competitions as
select 
    Province.Name as `Province`, Golf_Club.Name as `Club_Name`, 
    Competition.Name, Competition.Date, Golf_Club.Phone_Number

from Province
inner join Golf_Club 
    on Province.Province_ID = Golf_Club.Province_ID
inner join Competition
    on Golf_Club.Club_ID = Competition.Club_ID;

select * from detailed_competitions;