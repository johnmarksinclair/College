use GUI;

drop view if exists provinces_and_clubs;

create view provinces_and_clubs as
select 
    Province.Name as `Province`, Golf_Club.Name as `Club_Name`, Golf_Club.Phone_Number

from Province
inner join Golf_Club 
    on Province.Province_ID = Golf_Club.Province_ID;

select * from provinces_and_clubs;