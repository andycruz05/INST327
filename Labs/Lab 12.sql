#Write a SELECT query that retrieves the album rank, title, artist name, genre, and release year. 
#Sort the results by album rank, from 1 to 100.

USE greatest_ablums_db;
SELECT Album_Rank, Album_Title, Artist, Genre, Release_Year
FROM Album_Rankings ar
JOIN Artists a ON a.Artist_ID = ar.Artist_ID
JOIN Genres g ON g.Genre_ID = ar.Genre_ID
ORDER BY Album_Rank ASC;

#Create a VIEW, named rock_albums, that displays the album rank, title, artist name, genre, release year, and worldwide sales. 
#Include only albums classified as "Rock", including its subgenres such as Punk Rock and Psychedelic Rock. 
#The view should return exactly 46 rows. 
#Before creating the view, add a line to drop it if it already exists to prevent potential name conflicts.

USE greatest_albums_db;
DROP VIEW IF EXISTS rock_albums;
CREATE VIEW rock_albums AS
	SELECT Album_Rank, Album_Title, Artist, Genre, Release_Year, Worldwide_Sales_In_Millions
	FROM Album_Rankings ar
    JOIN Artists a ON a.Artist_ID = ar.Artist_ID 
    JOIN Genres g ON g.Genre_ID = ar.Genre_ID
    WHERE Genre REGEXP 'Rock';
    
#Create a VIEW, named albums_with_long_songs, that displays the album title, artist name, genre, and the average song duration for each album. 
#Include only albums where the average song duration is 5 minutes or longer. 
#The view should return exactly 19 rows, sorted by average song duration in descending order. 
#Before creating the view, add a line to drop it if it already exists to prevent potential name conflicts.

USE greatest_albums_db;
DROP VIEW IF EXISTS albums_with_long_songs;
CREATE VIEW albums_with_long_songs AS
	SELECT Album_Title, Artist, Genre, (Duration_In_Minutes / Track_Count) AS average_song_duration
	FROM Album_Rankings ar
	JOIN Artists a ON a.Artist_ID = ar.Artist_ID
	JOIN Genres g ON g.Genre_ID = ar.Genre_ID
	WHERE (Duration_In_Minutes / Track_Count) >= 5
	ORDER BY average_song_duration DESC;

#Create a procedure, named albums_by, that takes an artist name as an input argument and outputs the following details:
#Artist name, Album title, Album rank, Genre, Worldwide sales. Sort the results by album rank in ascending order.

USE greatest_albums_db;
DROP PROCEDURE IF EXISTS albums_by;
DELIMITER $$
CREATE PROCEDURE albums_by(IN keyword VARCHAR(100))
BEGIN 
	SELECT Artist, Album_Title, Album_rank, Genre, Worldwide_Sales_In_Millions
    FROM Album_Rankings ar
    JOIN Artists a ON a.Artist_ID = ar.Artist_ID
	JOIN Genres g ON g.Genre_ID = ar.Genre_ID
    WHERE Artist LIKE CONCAT('%', keyword,'%')
    ORDER BY Album_rank ASC;
    END $$
DELIMITER ;

#Create a function, named top_album_from, that takes a year as an input argument and 
#outputs the title of the highest ranked album from that year. 
#If no albums exist for the given year, the function should return NULL.

USE greatest_albums_db;
DROP FUNCTION IF EXISTS top_album_from;
DELIMITER $$
CREATE FUNCTION top_album_from(year_input INT)
RETURNS VARCHAR(70)
DETERMINISTIC
BEGIN 
	DECLARE result_title VARCHAR(70);
    
    SELECT Album_Title
    INTO result_title
    FROM Album_Rankings
    WHERE Release_Year = year_input
    ORDER BY Album_Rank ASC
    LIMIT 1;
    RETURN result_title;
END$$
DELIMITER ;