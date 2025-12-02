USE spotify_daily_charts_db;

SELECT DISTINCT 
	CONCAT (UPPER(Artists), ' released a song titled ', "'", UPPER(track_name),"'") AS Name_And_Track
    FROM Charts
    JOIN Artists 
    ON Charts.artist_id = Artists.artist_id

WHERE track_name REGEXP 'down'

ORDER BY Name_And_Track ASC;
  
/*-------------------------*/

USE spotify_daily_charts_db;

SELECT track_name, Artists, daily_rank, Country, snapshot_date, popularity,
CASE
	WHEN popularity > 89 THEN "Very popular"
    WHEN Popularity > 79 THEN 'Popular'
    ELSE 'Moderately Popular'
END AS popularity_category
FROM Charts
INNER JOIN Artists
ON Charts.artist_id = Artists.artist_id
INNER JOIN Countries
ON Charts.country_id = Countries.country_id
INNER JOIN Metadata
ON Charts.track_id = Metadata.track_id

WHERE Country = 'United States' AND popularity BETWEEN 77 AND 100 AND snapshot_date = '2025-02-03'
ORDER BY daily_rank ASC;

/*--------------------------*/

USE spotify_daily_charts_db;

SELECT track_name, Artists, ROUND(Metadata.duration_ms / 60000, 2) AS duration_minutes
FROM Charts
INNER JOIN Artists
    ON Charts.artist_id = Artists.artist_id
INNER JOIN Metadata
    ON Charts.track_id = Metadata.track_id
WHERE ROUND(Metadata.duration_ms / 60000, 2) BETWEEN 5 AND 7.37
GROUP BY Charts.track_id, Charts.track_name, Artists.artists, Metadata.duration_ms
ORDER BY Artists ASC;

/*-----------------------*/

USE spotify_daily_charts_db;

SELECT track_name, artists, daily_rank, country, DATE_FORMAT(Charts.snapshot_date, '%M %d, %Y') AS formatted_date
FROM Charts
INNER JOIN Artists
ON Charts.artist_id = Artists.artist_id
INNER JOIN Countries
ON Charts.country_id = Countries.country_id
WHERE daily_rank = 1 AND snapshot_date BETWEEN '2025-02-01' AND '2025-02-10'
ORDER BY snapshot_date DESC, country ASC;


