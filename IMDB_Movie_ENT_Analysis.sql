-- Create staging tables

DROP TABLE IF EXISTS staging.genres;
DROP TABLE IF EXISTS staging.title_genres;
DROP TABLE IF EXISTS staging.titles;
DROP TABLE IF EXISTS staging.person_title_roles;
DROP TABLE IF EXISTS staging.title_ratings;

CREATE TABLE IF NOT EXISTS staging.genres (
    id SERIAL PRIMARY KEY,
    genre TEXT
);

CREATE TABLE IF NOT EXISTS staging.title_genres (
    id SERIAL PRIMARY KEY,
    title_id INTEGER,
    genre TEXT   
);

CREATE TABLE IF NOT EXISTS staging.titles (
    id SERIAL PRIMARY KEY,
    t_title_id TEXT,
    title_type TEXT,
    primary_title TEXT, 
    original_title TEXT, 
    is_adult TEXT, 
    start_year INTEGER, 
    end_year TEXT,
    runtime_min INTEGER
);

CREATE TABLE IF NOT EXISTS staging.person_title_roles (
    id SERIAL PRIMARY KEY,
    title_id INTEGER,
    primary_name TEXT,
    person_role TEXT
);

CREATE TABLE IF NOT EXISTS staging.title_ratings (
    id SERIAL PRIMARY KEY,
    title_id INTEGER,
    avg_rating DECIMAL (3,1),
    num_votes INTEGER
);

-- These CREATE TABLE statements are written to create the staging tables. These are the tables where we load our CSV files into. These CREATE TABLE statements are in the `staging_tables.sql` file in the `projects/imdb_ent/src/scripts` directory. We created the tables by running the `create_staging_tables.sh` script by opening a Jupyter terminal and running the commands `cd projects/imdb_ent/src/scripts/`  and `bash create_staging_tables.sh`.

-- Load data into staging tables

TRUNCATE TABLE staging.genres;
TRUNCATE TABLE staging.title_genres;
TRUNCATE TABLE staging.titles;
TRUNCATE TABLE staging.person_title_roles;
TRUNCATE TABLE staging.title_ratings;


\copy staging.genres FROM '../../data/imdb_genres.csv' WITH CSV HEADER;

\copy staging.person_title_roles FROM '../../data/imdb_person_title_roles.csv' WITH CSV HEADER;

\copy staging.title_genres FROM '../../data/imdb_title_genres.csv' WITH CSV HEADER;

\copy staging.title_ratings FROM '../../data/imdb_title_ratings.csv' WITH CSV HEADER;

\copy staging.titles FROM '../../data/imdb_titles.csv' WITH CSV HEADER;

-- FROM '/home/workspace/imdb_ent/data/genres.csv'
-- We wrote `\copy` commands into the `copy_staging_data.sql` file. These commands load the data in our CSV files into our staging tables. This file is located in the `projects/imdb_ent/src/scripts` directory.  We loaded the data into the staging tables by running the `load_staging_data.sh` script by opening a Jupyter terminal and running `cd projects/<your project name>/src/scripts` and `bash load_staging_data.sh`

-- Query that answer top 10 highest rated movies for the last five years
SELECT primary_title,
	    title_start_year,
	    avg_rating,
	    num_votes
FROM first_data_product
WHERE title_start_year BETWEEN 2016 and 2020 AND num_votes > 10000
GROUP BY primary_title, title_start_year
ORDER BY avg_rating DESC
LIMIT 10;
