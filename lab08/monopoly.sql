--
-- This SQL script builds a monopoly database, deleting any pre-existing version.
--
-- @author kvlinden
-- @version Summer, 2015
--

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS PlayerList;
DROP TABLE IF EXISTS GameInProgress;
DROP TABLE IF EXISTS PropertyList;
DROP TABLE IF EXISTS PlayerGame;
DROP TABLE IF EXISTS Property;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Player;

-- Create the schema.
CREATE TABLE Game (
	ID integer PRIMARY KEY, 
	time timestamp
	);

CREATE TABLE Player (
	ID integer PRIMARY KEY, 
	emailAddress varchar(50) NOT NULL,
	name varchar(50)
	);

CREATE TABLE PlayerGame (
	gameID integer REFERENCES Game(ID), 
	playerID integer REFERENCES Player(ID),
	score integer
	);

CREATE TABLE Property(
	ID integer PRIMARY KEY,
	name varchar(50),
	location integer
	);

CREATE TABLE PropertyList(
	ID integer PRIMARY KEY,
	playerID integer REFERENCES Player(ID),
	propertyID integer REFERENCES Property(ID), 
	gameID integer REFERENCES Game(ID)
	);
	

CREATE TABLE PlayerList(
	ID integer PRIMARY KEY,
	playerID integer REFERENCES Player(ID),
	cash integer, 
	propertyListID integer REFERENCES PropertyList(ID),
	houses integer, 
	hotels integer,
	location integer
	);

CREATE TABLE GameInProgress(
	ID integer PRIMARY KEY,
	gameID integer REFERENCES Game(ID),
	playerListID integer REFERENCES PlayerList(ID),
	time timestamp
	);
	

-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON PlayerGame TO PUBLIC;
GRANT SELECT ON Property TO PUBLIC;
GRANT SELECT ON PropertyList TO PUBLIC;
GRANT SELECT ON GameInProgress TO PUBLIC;
GRANT SELECT ON PlayerList TO PUBLIC;


-- Add sample records.
INSERT INTO Game VALUES (1, '2006-06-27 08:00:00');
INSERT INTO Game VALUES (2, '2006-06-28 13:20:00');
INSERT INTO Game VALUES (3, '2006-06-29 18:41:00');
-- test data for lab
INSERT INTO Game VALUES (4, '2019-10-18 16:21:45');

INSERT INTO Player(ID, emailAddress) VALUES (1, 'me@calvin.edu');
INSERT INTO Player VALUES (2, 'king@gmail.edu', 'The King');
INSERT INTO Player VALUES (3, 'dog@gmail.edu', 'Dogbreath');
-- test data for lab
INSERT INTO Player VALUES (4, 'test1@gmail.com', 'Test 1');

INSERT INTO PlayerGame VALUES (1, 1, 0.00);
INSERT INTO PlayerGame VALUES (1, 2, 0.00);
INSERT INTO PlayerGame VALUES (1, 3, 2350.00);
INSERT INTO PlayerGame VALUES (2, 1, 1000.00);
INSERT INTO PlayerGame VALUES (2, 2, 0.00);
INSERT INTO PlayerGame VALUES (2, 3, 500.00);
INSERT INTO PlayerGame VALUES (3, 2, 0.00);
INSERT INTO PlayerGame VALUES (3, 3, 5500.00);
-- test data for lab
INSERT INTO Property VALUES(1, 'Boardwalk', 20);

INSERT INTO PropertyList VALUES(1, 4, 1, 4);

INSERT INTO PlayerList VALUES(1, 4, 30, 1, 3, 2, 26);

INSERT INTO GameInProgress VALUES(1, 4, 1, '2019-10-18 16:21:45');

--Lab 8 queries

--SELECT *
--FROM Game
--ORDER BY time DESC;

--SELECT *
--FROM Game
--WHERE time BETWEEN
--NOW()::DATE-EXTRACT(DOW FROM NOW())::INTEGER-7
--AND NOW()::DATE-EXTRACT(DOW FROM NOW())::INTEGER;

--SELECT *
--FROM Player
--WHERE name IS NOT NULL;

--SELECT PlayerID
--FROM PlayerGame
--WHERE score > 2000;

--SELECT *
--FROM Player
--WHERE emailAddress LIKE '%gmail%';

--SELECT score
--FROM Player, PlayerGame
--WHERE Player.ID = PlayerGame.playerID
--AND Player.name = 'The King'
--ORDER BY score DESC;

--SELECT name
--FROM Player, PlayerGame, Game
--WHERE Player.ID = PlayerGame.playerID
--AND Game.ID = PlayerGame.gameID
--AND Game.time = '2006-06-28 13:20:00'
--ORDER BY score DESC
--LIMIT 1;

--c)	P1.ID < P2.ID makes sure that the query doesn't return
--	the same person (P1 and P2 could be pointing to the 
--	same person).

--d)	If you want to compare things in the same table, or 
--	especially in regard to another table that they both 
--	reference.  Without doing this, you'd have to think
--	of some work arounds.  This makes it easier to compare
--	them. 