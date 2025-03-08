# IMDB Movie Entertaiment Data Analysis
<img width="1232" alt="Image" src="https://github.com/user-attachments/assets/e98da426-7099-4e31-aabc-19c0fdd551b7" />

The project aims to design and implement a robust data pipeline  transform raw data into an organized Star Schema, which extracts meaningful insights through visualization. This pipeline enables the entertainment industry to leverage insights from the data for smart decision making, identify trends, and measure performance.

### Address business questions
1. What are the top 10 highest rated movies for the last 5 years?
2. What directors (with at least 3 movies) have the highest average rating?
3. What actresses (with at least 3 movies) have the highest average rating?
4. What actors (with at least 3 movies) have the highest average rating?
5. What are the 3 highest rated movies in each genre?

## Data engineering:
- Transform & Query data using SQL
- Database Postgresql 
- Build data pipelines using JupyterNotebook & dbt
- Visualize data using Apache Superset

## Data Source
- CSV files including directors, actresses and actors saved in Jupter Notebook project directory https://chipzx92.github.io/DataEngineeringI320/docs/projects/imdb_ent/REQUIREMENTS.html
- IMDB Genres include Animation, Comedy, Family, Musical, and Romance
- Five CSV files:
  • imdb_titles
  • imdb_title_ratings
  • imdb_title_genres
  • imdb_person_title_roles
  • imdb_genres

## Data Cleaning
- Drop 'end_year' and 'title_id' to avoid data redundancy & inconsistencies
- Drop rows with genre music and musical columns

## Data Ingestion
- Use SQL to create staging tables
- Load script into SQLite Jupyter Notebook using \copy commands

## Data Modeling & Transformation
Physical ER Diagram

<img width="779" alt="Image" src="https://github.com/user-attachments/assets/021770e2-b2fd-474c-ae53-b74fdca8980d" />

Transformation ER Diagram

<img width="719" alt="Image" src="https://github.com/user-attachments/assets/fce7ac04-cbaa-4b13-9feb-f2055151332d" />

## Data Visualiztion
- Inlcude genre filter for the highest rated movies by genre 
- Filter based on number of votes to analyzing movies within a certain range (10,000 votes)  
