MoodMatch 🎬

A mood-based movie recommendation system that suggests movies based on what you are feeling rather than simply genre alone. Built utilizing SQL, Python, ML, and Snowflake.

Status of project: Core ML pipeline is complete, Streamlit deployment in progress

Overview:
A lot of the recommendation systems we see today recommend films based solely on ratings and genres, not on what a person could really be in the mood to watch. Genres alone generally do not capture what a user could really be in the mood for at that moment; rather, they capture the essence of the plot. MoodMatch classifies each movie into a few different moods (e.g., if the user is in the mood for a Rom-Com, they can choose the feel-good mood). The five mood categories are Nostalgic, Feel-Good, Scary, Adventurous, and Melancholic. This app will recommend a movie based on the user's emotional state, using natural language processing on the movie overviews. 


Tech Stack:

Coding Language: Python

Database/Warehouse: Snowflake

ML/NLP: sci-kit learn(TF-DF, Logistic Regression), numpy

Deployment: Streamlit (in progress)

Dataset used: Kaggle Dataset (TMDB Data set, ~35,000 entries)


Process/Functionality:
1. Cleaning dataset - Uploaded the dataset directly into Snowflake and utilized SQL to clean. Removed unnecessary columns for MoodMatch, and reformatted the genre column to list out the genres for easy manipulation later in Python. Cleaned movies that were written in a foreign language by using the ILIKE clause, and created a new table named CLEAN_DATA for the cleaned and finished data for easy access.
2. Labeling - Manually labeled around 750 movies for training the model. Labeled movies by classifying them into the five different moods based on genre and words in the movie overviews.
3. Model Training - Trained a TF-IDF (Term Frequency-Inverse Document Frequency) vectorizer on the labeled movie set, which assigned a score for each of the words in the overview. Scores determine how popular or frequent a word is. All text in each entry was combined into one column for better evaluation, and from here, the scores were determined by comparing the frequency of a specific word to the rest of the text per movie (Term Frequency), then compared to the entire data set (Inverse Document Frequency). Words that are rare across the entire data set but are common in a specific document receive higher scores. After TF-IDF vectorization, logistic regression was applied to classify the rest of the movies in the data set based on the labeled and achieved an accuracy of 74.13% via 5-fold validation. A test/train split was applied to improve the model's overall generalization.
4. Prediction on full dataset - Fit the model to the entire dataset and make sure every movie was given a mood label.
5. Recommendation Engine - Built a recommendation function with two parameters (mood, an integer n = 10) that filters out the mood based on the argument passed into the function. This function takes the average of all the scores (for selected mood) from the TF-IDF vectorization final matrix and computes the centroid to compare against when performing cosine similarity (NLP) on the individual movie. Cosine similarity is used to compute the angle between the vector of scores of a specific movie and the vector of average scores of films that belong to a specific mood. This is done to determine how closely a specific film aligns with the centroid of one of the mood-based film groups. For example, if the angle measurement between two vectors is 90 degrees, the cosine would be 0, indicating there is no overlap (perpendicular) between the two vectors; therefore, no meaningful relationship between them. A value closer to 1 would indicate better similarity, and the function would group the movie with its respective mood-based group. The function returns the ten movies from the selected mood.




Challenges and What I Learned:

- Noticed that not all the empty overview entries in the data set were taken out with the SQL querying earlier, so I fixed that issue by stripping the remaining in the recommend function
- Sometimes, the information that I wanted to remove contained information that was written in more than one way in the data set. That was a bit tedious to remove. For example, for the overview column, some columns contained "No Overview." and some that had "Empty". I was able to optimize this problem by pulling out all like words and using SQL to delete them from the
- There was a lot of uneeded information or missing information in the dataset which I was able to utilize SQL to clean
- 




Future Improvements:
