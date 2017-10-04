/* 1
Aggregation:
Find the total number of players whose age is more than 28.
*/
Select count(distinct "id")
From player
Where age > 28

/*
​​​​​​2. Group by clause:
Find the position and total number of players whose id is greater than 8
*/
Select position, count(distinct id)
From player
Group by position
Having count(distinct id) > 8

/* 3
Nested:
Find the player whose position is SF and experience of 10
*/
Select distinct "id"
From player
Where "position" = 'SF'
AND "id" in (select "id" from player where experience = 10);
  
/* 4
More than one relation
Find the owner’s name of team warriors.  
*/
Select owner_name
From player, team
Where team_name = 'Warriors' AND owner_name = 'Carlo Gillman'


/* 5. Primary key constraint */
insert into game values('Warriors', ‘none’,'Quinton Lanza');

/* 6. Foreign key constraint */
insert into game values('Warriors', 0, ‘AAAA’);