/*return full player name for given last name*/
SELECT 
	first_name AS "First Name",
	last_name AS "Last Name"
FROM h_players
WHERE last_name = 'Mason';

/*return teams in group 3*/
SELECT *
FROM h_teams
WHERE group_no = 3;

/*return players who have scored more than 1 point*/
SELECT 
	first_name AS "First Name",
	last_name AS "Last Name",
	position AS "Position"
FROM h_players
CROSS JOIN h_scores
WHERE h_players.player_id = h_scores.player_id
AND h_scores.no_of_points > 1;

/*return players who have scored at least 1 point*/
SELECT 
	first_name AS "First Name",
	last_name AS "Last Name",
	position AS "Position"
FROM h_players
CROSS JOIN h_scores
WHERE h_players.player_id = h_scores.player_id
AND h_scores.no_of_points > 0; 

/*return players and team info for players who play for Slieverue*/
SELECT *
FROM h_players
CROSS JOIN h_teams
WHERE h_players.team_id = h_teams.team_id
AND h_teams.name = 'Slieverue';                                                                                                                                                                                                                                         =

/*return team 1 and team 2 in semi-finals*/
SELECT 
	team_1,
	team_2
FROM h_fixtures
CROSS JOIN h_fixture_stages
WHERE h_fixtures.stage_id = h_fixture_stages.stage_id
AND h_fixture_stages.stage_name = 'semi-finals';

/*return all fixture details on given date*/
SELECT *
FROM h_fixtures
WHERE h_fixtures.fixture_date = '07/11/2017';

/*return fixture from specific stage; format-1 (this example is 'final')*/
SELECT 
	fixture_date AS "Date",
	h_fixtures.team_1||' -v- '||h_fixtures.team_2 AS "Fixture",
	stage_name AS "Stage"		
FROM h_fixtures 
CROSS JOIN h_fixture_stages 
WHERE h_fixtures.stage_id = h_fixture_stages.stage_id
AND h_fixture_stages.stage_name = 'final';

/*return fixtures from specific stage; format-2 (this example is 'group stage')*/
SELECT 
	fixture_date AS "Date",
	team_1 AS "Team 1",
	team_2 AS "Team 2",
    stage_name AS "Stage"
FROM h_fixtures
CROSS JOIN h_fixture_stages
WHERE h_fixtures.stage_id = h_fixture_stages.stage_id
AND h_fixture_stages.stage_name = 'group stage';

/*return fixture result scores in following format - (team1 xx-xx | xx-xx team2)*/
/*code is not working fully as both teams are getting the same score, solution may be to create a second h_fixture_teams table. One for team 1 and one for team 2*/
SELECT 
	fixture_date AS "Date",
	h_fixtures.team_1||' '||h_fixture_teams.score||' | '||h_fixture_teams.score||' '||h_fixtures.team_2 AS "RESULT",
	stage_name AS "Stage"		
FROM h_fixtures, h_fixture_teams, h_fixture_stages, h_teams  
WHERE h_fixtures.stage_id = h_fixture_stages.stage_id
AND h_fixtures.fixture_id = h_fixture_teams.fixture_id
AND h_teams.team_id = h_fixture_teams.team_id;

/*return fixtures scores for specific team*/
SELECT 
	fixture_date AS "Date",
	h_fixtures.team_1||' '||h_fixture_teams.score||' | '||h_fixture_teams.score||' '||h_fixtures.team_2 AS "RESULT",
	stage_name AS "Stage"		
FROM h_fixtures, h_fixture_teams, h_fixture_stages, h_teams  
WHERE h_fixtures.stage_id = h_fixture_stages.stage_id
AND h_fixtures.fixture_id = h_fixture_teams.fixture_id
AND h_teams.team_id = h_fixture_teams.team_id
AND (h_fixtures.team_1 = 'Glenmore' OR h_fixtures.team_2 = 'Glenmore');

/*
SELECT *
FROM h_players
CROSS JOIN h_fixtures
ON h_players.player_id = h_fixtures.fixture_id
INNER JOIN h_scores
ON h_players.player_id = h_scores.player_id
WHERE h_scores.no_of_points > 0
AND h_fixtures.team_1 = 'Slieverue';
*/

/*
SELECT 
	h_fixtures.team_1 AS "Team 1",
        h_fixture_teams.score AS "Score",
	h_fixtures.team_2 AS "Team 2"	
FROM h_fixtures
CROSS JOIN h_fixture_teams
WHERE h_fixtures.fixture_id = h_fixture_teams.fixture_id
AND h_fixtures.team_1 = 'Glenmore'
OR h_fixtures.team_2 = 'Glenmore';

SELECT 
	h_fixtures.team_1 AS "Team 1",
        h_fixture_teams.score AS "Score",
	h_fixtures.team_2 AS "Team 2"	
FROM h_fixtures
CROSS JOIN h_fixture_teams
WHERE h_fixtures.fixture_id = h_fixture_teams.fixture_id
AND (h_fixtures.team_1 = 'Glenmore' OR h_fixtures.team_2 = 'Glenmore');

SELECT 
	h_fixtures.team_1||' '|| h_fixture_teams.score AS "Team 1 Score",
	h_fixtures.team_2||' '|| h_fixture_teams.score AS "Team 2 Score"	
FROM h_fixtures
CROSS JOIN h_fixture_teams
WHERE h_fixtures.fixture_id = h_fixture_teams.fixture_id
AND (h_fixtures.team_1 = 'Glenmore' OR h_fixtures.team_2 = 'Glenmore');

SELECT 
	h_fixtures.team_1 AS "Team 1",
        h_fixture_teams.score AS "Score1",
        h_fixture_teams.score AS "Score2",
	h_fixtures.team_2 AS "Team 2"	
FROM h_fixtures, h_teams, h_fixture_teams

WHERE h_fixtures.fixture_id = h_fixture_teams.fixture_id AND h_fixtures.team_1 = h_teams.name;
SELECT 
*/