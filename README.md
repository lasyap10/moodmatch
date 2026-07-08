MoodMatch 🎬
Mood-based movie recommendation system that suggests movies based on what you are feeling rather than simply genre alone. Built utilizing SQL, Python, ML, and Snowflake.

Status of project: Core ML pipeline is complete, Streamlit deployment in progress

Overview:
A lot of the recommendation systems we see today recommend films based solely on ratings and genres, not on what a person could really be in the mood to watch. Genres alone generally do not capture what a user could really be in the mood for at that moment; rather, they capture the essence of the plot. MoodMatch classifies each movie into a few different moods (e.g., if the user is feeling a Rom-Com, they would be able to choose the feel-good mood). The five mood categories are Nostalgic, Feel-Good, Scary, Adventurous, and Melancholic. This app will reccomend the user a movie based on their emotional state, using natural language processing on the movie overviews. 


Tech Stack:

Coding Language: Python

Database: Snowflake

ML/NLP: sci-kit learn(TF-DF, Logistic Regression), numpy

Deployment: Streamlit (in progress)

Dataset used: Kaggle Dataset (TMDB Data set, ~35,000 entries)


Process:
1. Cleaning dataset - Uploaded the dataset directly into Snowflake and utilized SQL to clean. Removed unnecessary columns for MoodMatch, and reformatted the genre column to list out the genres for easy manipulation later in Python. Cleaned movies that were written in a foreign language by using the ILIKE clause, and created a new table named CLEAN_DATA for the cleaned and finished data for easy access.




Challenges and What I Learned:




Future Improvements:
