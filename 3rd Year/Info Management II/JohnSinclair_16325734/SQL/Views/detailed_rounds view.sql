use GUI;

drop view if exists detailed_rounds;

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
    on Province.Province_ID = Golf_Club.Province_ID;

select * from detailed_rounds;