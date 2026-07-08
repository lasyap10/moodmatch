MoodMatch 🎬

Mood-based movie recommendation system that suggests movies based on what you are feeling rather than simply genre alone. Built utilizing SQL, Python, ML, and Snowflake.

Status of project: Core ML pipeline is complete, Streamlit deployment in progress

Overview:
A lot of the recommendation systems we see today recommend films based solely on ratings and genres, not on what a person could really be in the mood to watch. Genres alone generally do not capture what a user could really be in the mood for at that moment; rather, they capture the essence of the plot. MoodMatch classifies each movie into a few different moods (e.g., if the user is in the mood for a Rom-Com, they can choose the feel-good mood). The five mood categories are Nostalgic, Feel-Good, Scary, Adventurous, and Melancholic. This app will recommend a movie based on the user's emotional state, using natural language processing on the movie overviews. 


Tech Stack:

Coding Language: Python

Database: Snowflake

ML/NLP: sci-kit learn(TF-DF, Logistic Regression), numpy

Deployment: Streamlit (in progress)

Dataset used: Kaggle Dataset (TMDB Data set, ~35,000 entries)


Process:
1. Cleaning dataset - Uploaded the dataset directly into Snowflake and utilized SQL to clean. Removed unnecessary columns for MoodMatch, and reformatted the genre column to list out the genres for easy manipulation later in Python. Cleaned movies that were written in a foreign language by using the ILIKE clause, and created a new table named CLEAN_DATA for the cleaned and finished data for easy access.
2. Labeling - Manually labeled around 750 movies for training the model. Labeled movies by classifying them into the five different moods based on genre and words in the movie overviews.
3. Modeling Training - Trained a TF-IDF (Term Frequency-Inverse Document Frequency) on the labeled movie set, which assigned a score for each of the words in the overview. Scores determine how popular or frequent a word is. All text in each entry was combined into one column for better evaluation, and from here, the scores were determined by comparing the frequency of a specific word to the rest of the text per movie (Term Frequency), then compared to the entire data set (Inverse Document Frequency). Words that are rare across the entire data set but are common in a specific document receive higher scores. After TF-IDF vectorization, logistic regression was applied to classify the rest of the movies in the data set based on the labeled and achieved an accuracy of 74.13% via 5-fold validation. A test/train split was applied to improve the model's overall generalization.




Challenges and What I Learned:




Future Improvements:
