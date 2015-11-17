-- Table definitions for the tournament project.
--

CREATE DATABASE tournament;
-- Slash C is for connecting the database--
\c tournament;
-- Each table must have a primary key.--
CREATE TABLE Players ( id serial primary key, name text, club varchar(100));
CREATE TABLE Matches( id serial primary key,
         winner integer references Players(id), loser integer references Players(id));

-- Slash i is for importing the content of this file.--
\i tournament.sql

--View defines the query of the database--
CREATE VIEW Ranking AS -- AS=aliases are used to temporarily rename a table or a column heading.-- 
    SELECT Players.id --column_name,column_name--
    FROM Players, Matches --table_name--
    WHERE Players.id = Matches.winner ORDER BY Players.id DESC;  --column_name operator value--

-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.


