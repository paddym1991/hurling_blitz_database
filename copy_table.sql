CREATE TABLE copy_players
	AS (SELECT * FROM players);

CREATE TABLE copy_fixture_players
	AS (SELECT * FROM fixture_players);

CREATE TABLE copy_fixtures
	AS (SELECT * FROM fixtures);

CREATE TABLE copy_fixture_teams
	AS (SELECT * FROM fixture_teams);

CREATE TABLE copy_teams
	AS (SELECT * FROM teams);

CREATE TABLE copy_fixture_stages
	AS (SELECT * FROM fixture_stages);

CREATE TABLE copy_scores
	AS (SELECT * FROM scores);

CREATE TABLE copy_groups
	AS (SELECT * FROM groups);