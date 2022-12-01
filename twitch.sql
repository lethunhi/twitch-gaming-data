
-- 1. Select the first 20 rows from each of the two tables.

SELECT *
FROM stream
LIMIT 20;

SELECT *
FROM chat
LIMIT 20;


-- 2. What are the unique games in the stream table?

SELECT DISTINCT game
FROM stream;

-- 3. What are the unique channels in the stream table?

SELECT DISTINCT channel
FROM stream;

-- 4. What are the most popular games in the stream table?

SELECT game, COUNT(*)
FROM stream
GROUP BY 1
ORDER BY 2 DESC;

--5. These are some big numbers from the game League of Legends (also known as LoL). Where are these LoL stream viewers located?


SELECT country, COUNT(*)
FROM stream
WHERE game = 'League of Legends'
GROUP BY 1
ORDER BY 2 DESC;

--6. The player column contains the source the user is using to view the stream (site, iphone, android, etc).

-- Create a list of players and their number of streamers.

SELECT player, COUNT(*)
FROM stream
GROUP BY 1
ORDER BY 2 DESC;

--7. Create a new column named genre for each of the games.

-- Group the games into their genres: Multiplayer Online Battle Arena (MOBA), First Person Shooter (FPS), Survival, and Other.

SELECT game,
 CASE
  WHEN game = 'Dota 2'
      THEN 'MOBA'
  WHEN game = 'League of Legends' 
      THEN 'MOBA'
  WHEN game = 'Heroes of the Storm'
      THEN 'MOBA'
    WHEN game = 'Counter-Strike: Global Offensive'
      THEN 'FPS'
    WHEN game = 'DayZ'
      THEN 'Survival'
    WHEN game = 'ARK: Survival Evolved'
      THEN 'Survival'
  ELSE 'Other'
  END AS 'genre',
  COUNT(*)
FROM stream
GROUP BY 1
ORDER BY 3 DESC;


-- 8. Let’s write a query that returns two columns:

-- The hours of the time column
-- The view count for each hour
-- Lastly, filter the result with only the users in Vietnam.

SELECT strftime('%H', time),
   COUNT(*)
FROM stream
WHERE country = 'VN'
GROUP BY 1;

--9. The stream table and the chat table share a column: device_id. Let’s join the two tables on that column.

SELECT *
FROM stream
JOIN chat on stream.device_id = chat.device_id
