use GUI;

drop view if exists detailed_comp_entries;

create view detailed_comp_entries as
select
    Player.Player_ID, Player.First_Name, Player.Last_Name, 
    Competition.Name as `Competition`, Golf_Club.Name as `Club_Name`

from Competition_Entry
inner join Competition
    on Competition.Competition_ID = Competition_Entry.Competition_ID
inner join Player
    on Competition_Entry.Player_ID = Player.Player_ID 
inner join Golf_Club 
    on Competition.Club_ID = Golf_Club.Club_ID;

select * from detailed_comp_entries;