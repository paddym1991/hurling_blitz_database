





/*Create groups table*/
CREATE TABLE h_groups 
(
	group_no 	NUMBER(1) NOT NULL,
	no_of_teams NUMBER(1) NOT NULL,
CONSTRAINT h_groups_grp_no_pk PRIMARY KEY (group_no)
);

/*Create teams table*/
CREATE TABLE h_teams 
(
	team_id 	NUMBER(3) NOT NULL,
	group_no 	NUMBER(1) NOT NULL,
	name 		VARCHAR2(30) NOT NULL,
	coach 		VARCHAR2(30) NOT NULL,
	colour 		VARCHAR2(30),
CONSTRAINT h_teams_tm_id_pk PRIMARY KEY (team_id),
CONSTRAINT h_teams_grp_no_fk FOREIGN KEY (group_no) REFERENCES h_groups(group_no) ON DELETE SET NULL
);

/*Create platers table*/
CREATE TABLE h_players
(
	player_id 	NUMBER(3) NOT NULL,
	team_id 	NUMBER(3) NOT NULL,
	first_name 	VARCHAR2(30) NOT NULL,
	last_name 	VARCHAR2(30) NOT NULL,
	position 	VARCHAR2(30),
CONSTRAINT h_players_plr_id_pk PRIMARY KEY (player_id),
CONSTRAINT h_players_tm_id_fk FOREIGN KEY (team_id) REFERENCES h_teams(team_id) ON DELETE SET NULL
);

/*initially had incorrect data type (NUMBER(3)) in h_players first_name column. had to alter it*/
ALTER TABLE h_players
MODIFY first_name VARCHAR2(30);

/*Create fixture_stages table*/
CREATE TABLE h_fixture_stages 
(
	stage_id 	NUMBER(3) NOT NULL,
	stage_name 	VARCHAR2(20) NOT NULL,
CONSTRAINT h_fix_stgs_st_id_pk PRIMARY KEY (stage_id)
);

/*Create fixtures table*/
CREATE TABLE h_fixtures 
(
	fixture_id 		NUMBER(3) NOT NULL,
	stage_id 		NUMBER(3) NOT NULL,
	team_1 			VARCHAR2(30) NOT NULL,
	team_2 			VARCHAR2(30) NOT NULL,
	fixture_date 	DATE NOT NULL,
CONSTRAINT h_fix_fix_id_pk PRIMARY KEY (fixture_id),
CONSTRAINT h_fix_st_id_fk FOREIGN KEY (stage_id) REFERENCES h_fixture_stages(stage_id) ON DELETE SET NULL
);

/*Create fixture_teams table*/
CREATE TABLE h_fixture_teams
(
    fixture_team_id NUMBER(3) NOT NULL,
	team_id 		NUMBER(3) NOT NULL,
	fixture_id		NUMBER(3) NOT NULL,
	result 			CHAR(1) NOT NULL,
	score 			VARCHER(5) NOT NULL,
CONSTRAINT h_fix_tms_fix_tm_id_pk PRIMARY KEY (fixture_team_id),
CONSTRAINT h_fix_tms_tm_id_fk FOREIGN KEY (team_id) REFERENCES h_teams(team_id) ON DELETE SET NULL,
CONSTRAINT h_fix_tms_fix_id_fk FOREIGN KEY (fixture_id) REFERENCES h_fixtures(fixture_id) ON DELETE SET NULL
);


/*added check to h_fixture_teams*/
ALTER TABLE h_fixture_teams
ADD CHECK (result='w' OR result='l');

/*Create fixture_players table*/
CREATE TABLE h_fixture_players 
(
	fixture_player_id 	NUMBER(3) NOT NULL,
	player_id 			NUMBER(3) NOT NULL,
	fixture_id 			NUMBER(3) NOT NULL,
CONSTRAINT h_fix_plrs_fix_plr_id_pk PRIMARY KEY (fixture_player_id),
CONSTRAINT h_fix_plrs_plr_id_fk FOREIGN KEY (player_id) REFERENCES h_players(player_id) ON DELETE SET NULL,
CONSTRAINT h_fix_plrs_fix_id_fk FOREIGN KEY (fixture_id) REFERENCES h_fixtures(fixture_id) ON DELETE SET NULL
);


/*Create scores table*/
CREATE TABLE h_scores
(
	score_id 		NUMBER(5) NOT NULL,
	player_id 		NUMBER(3) NOT NULL,
	fixture_id 		NUMBER(3) NOT NULL,
	scorer_name 	VARCHAR2(30) NOT NULL,
	score_time 		NUMBER(4,2),
	no_of_points 	NUMBER(1) NOT NULL CHECK ((no_of_points = 1) || (no_of_points = 3)),
CONSTRAINT h_scores_scr_id_pk PRIMARY KEY (score_id),
CONSTRAINT h_scores_plr_id_fk FOREIGN KEY (player_id) REFERENCES h_players(player_id) ON DELETE SET NULL,
CONSTRAINT h_scores_fix_id_fk FOREIGN KEY (fixture_id) REFERENCES h_fixtures(fixture_id) ON DELETE SET NULL
);

/*added check to h_scores*/
ALTER TABLE h_scores
ADD CHECK (no_of_points=1 OR no_of_points=3);

