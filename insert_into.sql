INSERT ALL
	INTO h_groups VALUES (1, 4)
	INTO h_groups VALUES (2, 4)
	INTO h_groups VALUES (3, 4)
	INTO h_groups VALUES (4, 4)
	INTO h_groups VALUES (5, 4)
	INTO h_groups VALUES (6, 4)
SELECT * FROM dual;

INSERT ALL
	INTO h_teams VALUES (101, 1, 'Slieverue', 'Jimmy Jones', 'black and amber')
	INTO h_teams VALUES (149, 3, 'Glenmore', 'Sally Fields', 'green and gold')
	INTO h_teams VALUES (056, 3, 'Kilmacow', 'Eoin Biggins', NULL)
	INTO h_teams VALUES (236, 1, 'Tullogher', 'Paul Potts', NULL)
	INTO h_teams VALUES (426, 6, 'Mullinavat', 'Gimby Polstop', 'black and white')
	INTO h_teams VALUES (075, 6, 'Mooncoin', 'Iggle Fliggle', 'green and white')
SELECT * FROM dual;

INSERT ALL
	INTO h_players VALUES (52, 101,'Billy', 'Mason', 'forward')
	INTO h_players VALUES (14, 149, 'John', 'Peabody', 'midfielder')
 	INTO h_players VALUES (4, 056, 'Derek', 'Langton', 'forward')
 	INTO h_players VALUES (104, 236, 'Timmy', 'Tubridy', 'goalkeeper')
 	INTO h_players VALUES (111, 426, 'Sean', 'Walsh', 'defender')
 	INTO h_players VALUES (87, 149, 'Barty', 'McCarthy', NULL)
SELECT * FROM dual;

INSERT ALL
	INTO h_fixture_stages VALUES (1, 'group stage')
	INTO h_fixture_stages VALUES (2, 'quarter-finals')
	INTO h_fixture_stages VALUES (3, 'semi-finals')
	INTO h_fixture_stages VALUES (4, 'final')
SELECT * FROM dual;

INSERT ALL
	INTO h_fixtures VALUES (12, 1, 'Slieverue', 'Tullogher', '07/11/2017')
	INTO h_fixtures VALUES (296, 1, 'Mullinavat', 'Mooncoin', '07/11/2017')
	INTO h_fixtures VALUES (426, 1, 'Glenmore', 'Kilmacow', '07/11/2017')
	INTO h_fixtures VALUES (75, 2, 'Slieverue', 'Glenmore', '07/12/2017')
	INTO h_fixtures VALUES (839, 3, 'Slieverue','Mullinavat', '07/12/2017')
	INTO h_fixtures VALUES (19, 4, 'Slieverue', 'Kilmacow', '07/12/2017')
SELECT * FROM dual;

INSERT ALL
	INTO h_fixture_teams VALUES (652, 101, 12, 'w', '2-14')
	INTO h_fixture_teams VALUES (123, 149, 426, 'w', '1-11')
	INTO h_fixture_teams VALUES (14, 056, 426, 'l', '0-12')
	INTO h_fixture_teams VALUES (36, 426, 296, 'w', '3-07')
	INTO h_fixture_teams VALUES (101, 101, 839, 'w', '2-16')
SELECT * FROM dual;

INSERT ALL
	INTO h_fixture_players VALUES (132, 52, 12)
	INTO h_fixture_players VALUES (145, 14, 426)
	INTO h_fixture_players VALUES (751, 04, 426)
	INTO h_fixture_players VALUES (23, 104, 12)
	INTO h_fixture_players VALUES (11, 111, 296)
SELECT * FROM dual;


INSERT ALL
	INTO h_scores VALUES (23, 52, 12, 'Mason', 12.36, 1)
	INTO h_scores VALUES (129, 52, 12, 'Mason', 15.15, 3)
	INTO h_scores VALUES (63, 14, 426, 'Peabody', NULL, 1)
	INTO h_scores VALUES (428, 4, 19, 'Langton', 21.21, 3)
	INTO h_scores VALUES (191, 104, 12, 'Tubridy', 5.18, 1)
SELECT * FROM dual;

