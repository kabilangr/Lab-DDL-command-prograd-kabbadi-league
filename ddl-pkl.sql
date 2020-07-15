-- PROGRESSION - 1


-- 1. **Create table city**
CREATE TABLE city
(
id NUMBER(11),
name VARCHAR(50) NOT NULL,
CONSTRAINT city5_PK PRIMARY KEY(id)
);
-- 2. **Create table referee**
CREATE TABLE referee
(
id NUMBER(11),
name VARCHAR(50) NOT NULL,
CONSTRAINT referee0_PK PRIMARY KEY(id)
);
-- 3. **Create table innings**
CREATE TABLE innings
(
id NUMBER(11),
innings_number NUMBER(11) NOT NULL,
CONSTRAINT innings0_PK PRIMARY KEY(id)
);
-- 4. **Create table extra_type**
CREATE TABLE extra_type
(
id NUMBER(11),
name VARCHAR(50)NOT NULL,
CONSTRAINT extra0_type_PK PRIMARY KEY(id)
);
-- 5. **Create table skill**
CREATE TABLE skill
(
id NUMBER(11),
name VARCHAR(50) NOT NULL,
CONSTRAINT skill0_PK PRIMARY KEY(id)
);
-- 6. **Create table team**
CREATE TABLE team
(
id NUMBER(11),
name VARCHAR(50) NOT NULL,
coach VARCHAR(50) NOT NULL,
home_city NUMBER(11) NOT NULL,
captain NUMBER(11) NOT NULL,
CONSTRAINT team09_PK PRIMARY KEY(id),
CONSTRAINT team90_fK FOREIGN KEY(home_city) REFERENCES CITY(id)
);
-- 7. **Create table player**
CREATE TABLE player
(id NUMBER(11),
name VARCHAR(50) NOT NULL,
country VARCHAR(50) NOT NULL,
skill_id NUMBER(11) NOT NULL,
team_id NUMBER(11) NOT NULL,
CONSTRAINT player09_PK PRIMARY KEY(id),
CONSTRAINT player08_fk FOREIGN KEY(skill_id) REFERENCES skill(id),
CONSTRAINT player07_fk FOREIGN KEY(team_id) REFERENCES team(id)
);
-- 8. **Create table venue**
CREATE TABLE venue
(id NUMBER(11),
stadium_name VARCHAR(50) NOT NULL,
city_id NUMBER(11) NOT NULL,
CONSTRAINT venue09_PK PRIMARY KEY(id),
CONSTRAINT venue08_fk FOREIGN KEY(city_id) REFERENCES city(id)
);
-- 9. **Create table event**
CREATE TABLE event 
(
id NUMBER(11),
innings_id NUMBER(11) NOT NULL,
event_no NUMBER(11) NOT NULL,
raider_id NUMBER(11) NOT NULL,
raid_points NUMBER(11) NOT NULL,
defending_points NUMBER(11) NOT NULL,
clock_in_seconds NUMBER(11) NOT NULL,
team_one_score NUMBER(11) NOT NULL,
team_two_score NUMBER(11) NOT NULL,
CONSTRAINT event09_PK PRIMARY KEY(id),
CONSTRAINT event08_fk FOREIGN KEY(innings_id) REFERENCES innings(id),
CONSTRAINT event07_fk FOREIGN KEY(raider_id) REFERENCES player(id)
);
-- 10. **Create table extra_event**
CREATE TABLE extra_event
(
id NUMBER(11),
event_id NUMBER(11) NOT NULL,
extra_type_id NUMBER(11) NOT NULL,
points NUMBER(11) NOT NULL,
scoring_team_id NUMBER(11) NOT NULL,
CONSTRAINT extra09_event_PK PRIMARY KEY(id),
CONSTRAINT extra08_event_fk FOREIGN KEY(event_id) REFERENCES event(id),
CONSTRAINT extra07_event_fk FOREIGN KEY(raider_id) REFERENCES player(id)
);
-- 11. **Create table outcome**
CREATE TABLE outcome
(
id NUMBER(11),
status VARCHAR(100) NOT NULL,
winner_team_id NUMBER(11),
score NUMBER(11),
player_of_match NUMBER(11),
CONSTRAINT outcome09_pk PRIMARY KEY(id),
CONSTRAINT outcome08_fk FOREIGN KEY(winner_team_id) REFERENCES team(id),
CONSTRAINT outcome07_fk FOREIGN KEY(player_of_match) REFERENCES player(id)
);
-- 12. **Create table game**
CREATE TABLE game
(
id NUMBER(11),
game_date DATE NOT NULL,
team_id_1 NUMBER(11) NOT NULL,
team_id_2 NUMBER(11) NOT NULL,
venue_id NUMBER(11) NOT NULL,
outcome_id NUMBER(11) NOT NULL,
referee_id_1 NUMBER(11) NOT NULL,
referee_id_2 NUMBER(11) NOT NULL,
first_innings_id NUMBER(11) NOT NULL,
second_innings_id NUMBER(11) NOT NULL,
CONSTRAINT outcome09_pk PRIMARY KEY(id),
CONSTRAINT outcome09_fk FOREIGN KEY(team_id_1) REFERENCES team(id),
CONSTRAINT outcome07_fk FOREIGN KEY(team_id_2) REFERENCES team(id),
CONSTRAINT outcome06_fk FOREIGN KEY(venue_id) REFERENCES venue(id),
CONSTRAINT outcome05_fk FOREIGN KEY(outcome_id) REFERENCES outcome(id),
CONSTRAINT outcome04_fk FOREIGN KEY(referee_id_1) REFERENCES referee(id),
CONSTRAINT outcome03_fk FOREIGN KEY(referee_id_2) REFERENCES referee(id),
CONSTRAINT outcome02_fk FOREIGN KEY(first_innings_id) REFERENCES innings(id),
CONSTRAINT outcome01_fk FOREIGN KEY(second_innings_id) REFERENCES innings(id)
);
-- 13. **Drop table city**
DROP TABLE city;
-- 14. **Drop table innings**
DROP TABLE innings;
-- 15. **Drop table skill**
DROP TABLE skill;
-- 16. **Drop table extra_type**
DROP TABLE extra_type;
