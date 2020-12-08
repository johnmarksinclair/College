use GUI;

drop view if exists detailed_players;

create view detailed_players as
select 
    Province.Name as `Province`, Golf_Club.Name as `Club_Name`,
    Player.First_Name, Player.Last_Name, Player.DOB, Player.OWGR, Player.Handicap

from Province
inner join Golf_Club 
    on Province.Province_ID = Golf_Club.Province_ID
inner join Player
    on Golf_Club.Club_ID = Player.Club_ID;

select * from detailed_players;