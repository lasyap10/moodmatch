
-- creating new table for cleaned data
CREATE TABLE CLEAN_DATA AS
SELECT
    genres,
    overview,
    runtime,
    title
FROM 
  "MOODMATCH"."PUBLIC"."RAW_DATA"
WHERE
    overview IS NOT NULL AND
    runtime IS NOT NULL AND
    genres != '[]' AND
    runtime >= 60;


-- updating the table by cleaning the genres column
UPDATE clean_data
SET
    genres = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REGEXP_REPLACE(genres, '''id'': \\d+, ''name'': ', ''), '[', ''), '{', ''), '}', ''), ']', ''), '''', '');

-- deleting documentaries
DELETE
FROM
    CLEAN_DATA
WHERE
    genres ILIKE '%Documentary%';

DELETE
FROM
    CLEAN_DATA
WHERE
    genres ILIKE '%Foreign%';
