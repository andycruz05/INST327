#You're working as a database administrator for the NFL. 
#It's been a quite day until you receive an email from Roger Goodell, the NFL Commissioner. 
#At first, the message seems suspicious, so you show it to your supervisor. Surprisingly, they confirm it's legit.
#The message is urgent and baffling:
#"Please delete the 1969 Super Bowl from our database. No time to explain. It must be done today."
#Everyone on your tea is just as confused as you are. But it's your job, so you proceed.
#Under this question, write the DELETE statement to carry out the commissioner's request.

DROP DATABASE super_bowl_db;

#Earlier this year, the Eagles defeated the Chiefs 40-22 (though the score makes it look close, it really wasn't). 
#While reviewing the records, you notice that Super Bowl LIX is missing some key information: the MVP and the halftime performers.
#Your task is to update the database with the following information:
#MVP player: Jalen Hurts
#Halftime performers: Kendrick Lamar, SZA, Samuel L. Jackson
#More than 3 performers: yes (because Serena Williams was briefly shown dancing in the background)
#Under this question, submit the UPDATE statement you would write to add the missing information for Super Bowl LIX.

USE super_bowl_db;
UPDATE  Super_Bowl
SET mvp_player_first_name = 'Jalen',
	mvp_player_last_name = 'Hurts',
	performer_1 = 'Kendrick Lamar',
	performer_2 = 'SZA',
	performer_3 = 'Samuel L. Jackson',
	more_than_3_performers = 'yes'
WHERE game_id = 59;

#It's now December 2025, and the NFL has just announced that your favorite artist/band will join Bad Bunny to perform at the Super Bowl LX Halftime Show.
#Your task is to add a new record into the database for Super Bowl LX with the following information:
#Game_id: 60, Game_number: LX, Date: 2026-02-08, Venue: Levi's Stadium (hint: use \ to offset the apostrophe)
#City: Santa Clara, State: California, Main performer: Bad Bunny, Guest performer 1: (your favorite artist or band)
#Guest performer 2: (your favorite celebrity who will dance in the background)
#All other columns should remain empty for now.
#Under this question, submit the INSERT statement you would write to add this record for Super Bowl LX.

USE super_bowl_db;
INSERT INTO Super_bowl (game_id, game_number, date, venue, city, state, performer_1, performer_2, performer_3) VALUES
	(60, 'LX', '2026-02-08', 'Levi\'s Stadium', 'Santa Clara', 'California', 'Bad Bunny', 'Childish Gambino', 'Chris Rock')





