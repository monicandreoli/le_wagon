-- Considering this new jukebox database(attached in the zip file: xml file structure + sqlite content), write the SQL queries to answer these questions:
-- 1. List all customers (name + email), ordered alphabetically (no extra information)
-- (should return 59 rows)
SELECT first_name, email
FROM customers
ORDER BY first_name ASC

-- 2. List tracks (Name + Composer) of the Classical playlist
-- (should return 75 rows)
SELECT tracks.name, tracks.composer
FROM playlists
JOIN playlist_tracks ON playlists.id = playlist_tracks.playlist_id
JOIN tracks ON playlist_tracks.playlist_id = tracks.id
WHERE playlists.name = "Classical"

-- 3. List the 10 artists mostly listed in all playlists
-- (top result should be Iron Maiden with 516 count)
SELECT artists.name, COUNT(artists.name) as counter
FROM playlist_tracks
JOIN tracks ON playlist_tracks.track_id = tracks.id
JOIN albums ON tracks.album_id = albums.id
JOIN artists ON albums.artist_id = artists.id
GROUP BY artists.name
ORDER BY counter DESC
LIMIT 10

-- 4. List the tracks which have been purchased at least twice, ordered by number of purchases
-- (top result should be 'the Trooper' with 5 count)
SELECT tracks.name, COUNT(*) AS purchases
FROM tracks
JOIN invoice_lines ON invoice_lines.track_id = tracks.id
GROUP BY tracks.name
HAVING purchases >= 2
ORDER BY purchases DESC


