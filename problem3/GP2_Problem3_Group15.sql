/*
player(id, first_name, last_name, position, experience, age, team_name,  contract_amount, contract_length)
team(name, location, stadium_name, owner_name, owner_since, governed_by)
head_coach(name, years, hired_by)
assistant_coach(name, type, hired_by)
league(name, established_date, commissioner)

game_stat(player_id, date, stat)
reports_to(reporter_id, reported_to_id)
game(team_name, player_id, coach_name)
televised(team_name, player_name, coach_name, id)
televised_game(id, station, date, time)
*/

CREATE TABLE player(
  "id" int,
  first_name varchar(20),
  last_name varchar(20),
  "position" varchar(20),
  experience int,
  age int,
  team_name varchar(20),
  contract_amount int,
  contract_length int,
  primary key("id")
);

CREATE TABLE team(
  "name" varchar(20),
  "location" varchar(20),
  stadium_name varchar(20),
  owner_name varchar(20),
  owner_since int,
  governed_by varchar(20),
  primary key("name")
);

CREATE TABLE head_coach(
  "name" varchar(20),
  "years" int,
  hired_by varchar(20),
  primary key("name")
);

CREATE TABLE assistant_coach(
  "name" varchar(20),
  "type" varchar(20),
  hired_by varchar(20),
  primary key("name")
);

CREATE TABLE league(
  "name" varchar(20),
  established_date date,
  commissioner varchar(20),
  primary key("name")
);

CREATE TABLE game_stat(
  player_id int,
  "date" date,
  stat varchar(20),
  primary key(player_id, "date"),
  foreign key(player_id) references player
);

CREATE TABLE reports_to(
  reporter_id varchar(20),
  reporter_to_id varchar(20),
  primary key(reporter_id),
  foreign key(reporter_to_id) references head_coach,
  foreign key(reporter_id) references head_coach
);

CREATE TABLE game(
  team_name varchar(20),
  player_id int,
  coach_name varchar(20),
  primary key(team_name, player_id, coach_name),
  foreign key (team_name) references team,
  foreign key (player_id) references player,
  foreign key (coach_name) references head_coach
);

CREATE TABLE televised(
  team_name varchar(20),
  player_id int,
  coach_name varchar(20),
  "id" int,
  primary key(team_name, player_id, coach_name, "id"),
  foreign key(team_name) references team,
  foreign key(player_id) references player,
  foreign key(coach_name) references head_coach
);

CREATE TABLE televised_game(
  "id" int,
  station varchar(20),
  "date" date,
  "time" int,
  primary key("id")
);insert into player values(0, 'Kevin',	'Durant',	'SF',	10,	28,	'Warriors',	22,	1);
insert into player values(1, 'James',	'Harden',	'PG',	8,	26,	'Rockets',	23,	2);
insert into player values(2, 'G.', 'Antetokounmpo',	'SF',	6,	24,	'Bucks', 18,	3);
insert into player values(3, 'Stephen',	'Curry',	'PG',	7,	26,	'Warriors',	19,	4);
insert into player values(4, 'Russell',	'Westbrook',	'PG',	9,	28,	'Thunder',	24,	5);
insert into player values(5, 'Karl-Anthony', 'Towns',	'C',	4,	23,	'Timberwolves',	17,	3);
insert into player values(6, 'Anthony',	'Davis',	'PF',	6,	25,	'Pelicians',	19,	2);
insert into player values(7, 'Kawhi',	'Leonard',	'SG',	6,	25,	'Spurs',	18,	3);
insert into player values(8, 'LeBron','James',	'SF',	15,	35,	'Cavs',	20,	1);
insert into player values(9, 'John',	'Wall',	'PG',	7,	27,	'Wizards',	21,	3);
insert into player values(10, 'Nikola',	'Jokic',	'PF',	4,	25,	'Nuggets',	17,	2);
insert into player values(11, 'DeMarcus',	'Cousins',	'PF',	7,	27,	'Pelicians',	18,	4);
insert into player values(12, 'Chris',	'Paul',	'PG',	12,	30,	'Rockets',	16,	2);
insert into player values(13, 'Jimmy',	'Butler',	'SG',	7,	29,	'Timberwolves',	19,	5);
insert into player values(14, 'Damian',	'Lillard',	'PG',	5,	27,	'TrailBlazers',	20,	4);
insert into player values(15, 'Rudy',	'Gobert',	'C',	4,	26,	'Jazz',	17,	2);
insert into player values(16, 'Kyrie',	'Irving',	'PG',	7,	27,	'Celtics',	22,	3);
insert into player values(17, 'Paul',	'George',	'SF',	10,	28,	'Thunder',	18,	1);
insert into player values(18, 'Draymond',	'Green',	'SF',	8,	26,	'Warriors',	17,	2);
  
insert into team values('Warriors',	'Oakland',	'Heirloom Ring',	'Carlo Gillman',	2001,	'NBA');
insert into team values('Rockets',	'Houston',	'Spectacle Bowl',	'Homer Delcambre',	1980,	'NBA');
insert into team values('Bucks',	'Milwaukee',	'Harmony Field',	'Reed Veillon',	1990,	'NBA');
insert into team values('Thunder',	'Oklahoma City',	'Arch Bowl',	'Odell Mossey',	2010,	'NBA');
insert into team values('Timberwolves',	'Minnesota',	'Fusion Arena',	'Norberto Karn',	2005,	'NBA');
insert into team values('Pelicians',	'New Orleans',	'Sapphire Arena',	'Ben Brackin',	2000,	'NBA');
insert into team values('Spurs',	'San Antonio',	'Eos Ring',	'Shon Kyger',	1970,	'NBA');
insert into team values('Cavs',	'Cleveland',	'Horizon Arena',	'Joesph Boger',	1985,	'NBA');
insert into team values('Wizards',	'Washington D.C.',	'Aegis Ring',	'Morton Haberman',	1999,	'NBA');
insert into team values('Nuggets',	'Denver',	'Oracle Park',	'Horacio Beverage',	2016,	'NBA');
insert into team values('Trailblazers',	'Portland',	'Griffon Ring',	'Shad Nye',	2014,	'NBA');
insert into team values('Jazz',	'Utah',	'Stratosphere Bowl',	'Phillip Albaugh',	1995,	'NBA');
insert into team values('Celetics',	'Boston',	'Visage Ring',	'Josue Tomasi',	1993,	'NBA');
  
insert into head_coach values('Quinton Lanza',3,'Carlo Gillman');
insert into head_coach values('Stevie Mcclean',7,'Homer Delcambre');
insert into head_coach values('Willis Glick',10,'Reed Veillon');
insert into head_coach values('Lazaro Northup',2,'Odell Mossey');
insert into head_coach values('Graham Blanks',5,'Norberto Karn');
insert into head_coach values('Kelly Dominy',7,'Ben Brackin');
insert into head_coach values('Leland Carmon',3,'Shon Kyger');
insert into head_coach values('Michale Kemmer',8,'Joesph Boger');
insert into head_coach values('Melvin Orsborn',5,'Morton Haberman');
insert into head_coach values('Tory Oshiro',13,'Horacio Beverage');
insert into head_coach values('Roosevelt Toman',1,'Shad Nye');
insert into head_coach values('Cedric Mui',3,'Phillip Albaugh');
insert into head_coach values('Kelley Shultis',4,'Josue Tomasi');

insert into assistant_coach values('Rafael Rosser','offense','Carlo Gillman');
insert into assistant_coach values('Johnny Duty','defense','Homer Delcambre');
insert into assistant_coach values('Sonny Riesgo','offense','Reed Veillon');
insert into assistant_coach values('Rolf Renfroe','offense','Odell Mossey');
insert into assistant_coach values('Miguel Macaluso','defense','Norberto Karn');
insert into assistant_coach values('Harry Sisco','offense','Ben Brackin');
insert into assistant_coach values('Robby Metzger','post','Shon Kyger');
insert into assistant_coach values('Ariel Mcmickle','wings','Joesph Boger');
insert into assistant_coach values('Horacio Kerfoot','guards','Morton Haberman');
insert into assistant_coach values('Shon Donadio','trainer','Horacio Beverage');
insert into assistant_coach values('Millard Burkart','scout','Shad Nye');
insert into assistant_coach values('Andres Fried','guards','Phillip Albaugh');
insert into assistant_coach values('Roman Guthridge','strength','Josue Tomasi');
insert into assistant_coach values('Scot Hazzard','health','Carlo Gillman');
insert into assistant_coach values('Sheldon Fanelli','trainer','Homer Delcambre');
insert into assistant_coach values('Jamey Gottfried','scout','Reed Veillon');
insert into assistant_coach values('Orlando Byrd','post','Odell Mossey');
insert into assistant_coach values('Fredric Dailey','offense','Norberto Karn');
insert into assistant_coach values('Richie Salomon','defense','Ben Brackin');
insert into assistant_coach values('Jarod Michelsen','offense','Shon Kyger');
  
insert into league values('NBA', TO_DATE('17/12/1904', 'DD/MM/YYYY'),'Adam Silver');
    
insert into game_stat values(0,TO_DATE('11/5/2017','MM/DD/YYYY'),'20 pts 3 rbs');
insert into game_stat values(1,TO_DATE('10/10/2017','MM/DD/YYYY'),'10 pts 6 rbs');
insert into game_stat values(2,TO_DATE('12/2/2017','MM/DD/YYYY'),'1 pts 10 ast');
insert into game_stat values(3,TO_DATE('11/5/2017','MM/DD/YYYY'),'5 pts 20 ast 2 stls');
insert into game_stat values(4,TO_DATE('11/5/2017','MM/DD/YYYY'),'24 pts 9 rbs');
insert into game_stat values(5,TO_DATE('12/27/2017','MM/DD/YYYY'),'30 pts');
insert into game_stat values(6,TO_DATE('10/10/2017','MM/DD/YYYY'),'13 rbs 3 asts');
insert into game_stat values(7,TO_DATE('10/16/2017','MM/DD/YYYY'),'20 pts 3 rbs');
insert into game_stat values(8,TO_DATE('12/21/2017','MM/DD/YYYY'),'10 pts 6 rbs');
insert into game_stat values(9,TO_DATE('1/1/2018','MM/DD/YYYY'),'1 pts 10 ast');
insert into game_stat values(10,TO_DATE('10/26/2017','MM/DD/YYYY'),'5 pts 20 ast 2 stls');
insert into game_stat values(11,TO_DATE('10/10/2017','MM/DD/YYYY'),'24 pts 9 rbs');
insert into game_stat values(12,TO_DATE('10/10/2017','MM/DD/YYYY'),'30 pts');
insert into game_stat values(13,TO_DATE('1/17/2018','MM/DD/YYYY'),'13 rbs 3 asts');
insert into game_stat values(14,TO_DATE('12/11/2017','MM/DD/YYYY'),'20 pts 3 rbs');
insert into game_stat values(15,TO_DATE('12/14/2017','MM/DD/YYYY'),'10 pts 6 rbs');
insert into game_stat values(16,TO_DATE('12/1/2017','MM/DD/YYYY'),'1 pts 10 ast');
insert into game_stat values(17,TO_DATE('11/5/2017','MM/DD/YYYY'),'5 pts 20 ast 2 stls');
insert into game_stat values(18,TO_DATE('11/5/2017','MM/DD/YYYY'),'24 pts 9 rbs');

insert into game values('Warriors',0,'Quinton Lanza');
insert into game values('Rockets',1,'Stevie Mcclean');
insert into game values('Bucks',2,'Willis Glick');
insert into game values('Warriors',3,'Quinton Lanza');
insert into game values('Thunder',4,'Lazaro Northup');
insert into game values('Timberwolves',5,'Graham Blanks');
insert into game values('Pelicians',6,'Kelly Dominy');
insert into game values('Spurs',7,'Leland Carmon');
insert into game values('Cavs',8,'Michale Kemmer');
insert into game values('Wizards',9,'Melvin Orsborn');
insert into game values('Nuggets',10,'Tory Oshiro');
insert into game values('Pelicians',11,'Kelly Dominy');
insert into game values('Rockets',12,'Stevie Mcclean');
insert into game values('Timberwolves',13,'Graham Blanks');
insert into game values('Trailblazers',14,'Roosevelt Toman');
insert into game values('Jazz',15,'Cedric Mui');
insert into game values('Celetics',16,'Kelley Shultis');
insert into game values('Thunder',17,'Lazaro Northup');
insert into game values('Warriors',18,'Quinton Lanza');
  
insert into reports_to values('Quinton Lanza','Kelley Shultis');
insert into reports_to values('Stevie Mcclean','Cedric Mui');
insert into reports_to values('Willis Glick','Roosevelt Toman');
insert into reports_to values('Lazaro Northup','Tory Oshiro');
insert into reports_to values('Graham Blanks','Melvin Orsborn');
insert into reports_to values('Kelly Dominy','Michale Kemmer');
insert into reports_to values('Leland Carmon','Leland Carmon');
insert into reports_to values('Michale Kemmer','Kelly Dominy');
insert into reports_to values('Melvin Orsborn','Graham Blanks');
insert into reports_to values('Tory Oshiro','Lazaro Northup');
insert into reports_to values('Roosevelt Toman','Willis Glick');
insert into reports_to values('Cedric Mui','Stevie Mcclean');
insert into reports_to values('Kelley Shultis','Quinton Lanza');
    
insert into televised values('Warriors',0,'Quinton Lanza',0);
insert into televised values('Rockets',1,'Stevie Mcclean',1);
insert into televised values('Bucks',2,'Willis Glick',1);
insert into televised values('Warriors',3,'Quinton Lanza',0);
insert into televised values('Thunder',4,'Lazaro Northup',0);
insert into televised values('Cavs',8,'Michale Kemmer',2);
insert into televised values('Spurs',7,'Leland Carmon',2);
insert into televised values('Rockets',12,'Stevie Mcclean',1);
insert into televised values('Thunder',17,'Lazaro Northup',0);
insert into televised values('Warriors',18,'Quinton Lanza',0);
  
insert into televised_game values(0, 'TNT', TO_DATE('11/5/2017','DD/MM/YYYY'), 19);
insert into televised_game values(1, 'CBS', TO_DATE('10/10/2017','DD/MM/YYYY'), 19);
insert into televised_game values(2, 'ESPN', TO_DATE('11/10/2017','DD/MM/YYYY'), 19);/* 1
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