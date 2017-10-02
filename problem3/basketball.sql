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
  primary key("date"),
  foreign key(player_id) references player
);

CREATE TABLE reports_to(
  reporter_id int,
  reported_to_id int,
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
);