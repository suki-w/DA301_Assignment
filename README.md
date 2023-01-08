# DA301_Assignment

Week 1

As a data analyst working for Turtle Games and with this week’s objective as looking into how customers accumulate loyalty points, I will explore the relationship between loyalty points, age, remuneration and spending scores. The Ordinary Least Square (OLS) method is used to develop the linear regression model and create the linear equation.

<Spending vs Loyalty> From the OLS summary, the R-squared is 0.452, i.e. 45.2% of the total variability of Loyalty Points is explained by the variability of Spending Score. The F-statistic P-value generated is below 0.05, proving that Spending Score is a significant variable. With the regression line added, it is observed that the higher the spending score, the more the outliers are present, making it more difficult to be predicted through simple linear regression.

<Remuneration vs Loyalty> The R-squared is 0.380, i.e. 38% of the total variability of Loyalty Points is explained by the variability of Remuneration. The F-statistic P-value generated is below 0.05, confirming that Remuneration is a significant variable. With the regression line added, it is observed that the higher the remuneration, the more the outliers are present.

<Age vs Loyalty> The R-squared is 0.002 and the F-statistic P-value is 0.0577 (>0.05), indicating that age is not a significant variable to explain the total variability of Loyalty Points.

<Spending & Remuneration vs Loyalty> Extending from the analysis above, a multi-linear regression is performed to delve into the relationship of the Spending Score, Remuneration and Loyalty Points variables. The Adjusted R-squared of the multi-linear regression model is 0.83 which strongly explains the variability of Loyalty Points, and the VIF factors of Spending Score & Remuneration are both 1, reflecting no correlation between the two variables. Coefficients of the 2 variables are 32.6 and 34.3, small differences in the values reckon that Spending Score and Remuneration exert similar impact on the Loyalty Points variability.

To conclude, the relationship between the three variables can be summarised by the equation y = 32.6x1 + 34.3x2 -1700.3, where x1 = Spending and x2 = Remuneration. The relationship is positive, i.e. the higher-income and higher-spending the customer is, the higher loyalty he has over Turtle Games. However, it has been observed that as the spending and remuneration amount increases to a certain extent, the occurrence of outliers increases too, it would be worthwhile to further explore the data through other linear models.




Week 2

K-means clustering is used to identify specific segments from the customer database. From the scatterplot and pairplot, we can briefly tell that there could be four to five clusters within the data, whereas the Elbow Method and the Silhouette Method can be used to further justify the preferred no. of clusters.

From the Elbow Method, the critical point is found when n=5, as the change of SS Distance beyond that point is relatively insignificant. From the Silhouette Method, the critical point again appears when n=5, which is also where the silhouette score peaks. With both methods suggesting n=5, visualisations have been developed to reflect n=4, n=5 and n=6 respectively to determine the best approach. From the results, n=5 is preferred as we can see distinct clusters in fairly similar size on top right, top left, lower right, lower left and the middle, and we can further classify the clusters as:

Cluster 0 - Mid Spending, Mid Remuneration
Cluster 1 - High Spending, Low Remuneration
Cluster 2 - High Spending, High Remuneration
Cluster 3 - Low Spending, Low Remuneration
Cluster 4 - Low Spending, High Remuneration

To understand how these clusters are impacting Loyalty Points, a boxplot is created to provide a statistical overview of the clusters - it has been observed that Cluster 0 is the largest cluster of all, followed by Cluster 2; whereas Cluster 2 has the highest mean value of loyalty points, followed by Cluster 0. The implication from here is that Turtle Game will drive Loyalty Point accumulation most effectively by focusing their marketing resources on these 2 clusters alone, i.e. customers with mid to high Spending plus mid to high Remuneration.


Week 3

Natural Language Processing (NLP) is used to analyse customer social data collected online from the website. The customer comment data is first pre-processed to enable NLP at a later stage, and that includes tokenization which breaks down paragraphs, sentences into short strings. The raw data is also normalised, which includes replacement of punctuations, change of all texts to lowercase and removal of general English stop words. 

We can analyse each word by examining their frequency distribution, shortlisting the top 15 most common words found in the customer comments, and at the same time creating a Word Cloud to provide an overview on the key word appearance frequency. The sentiment polarity of those words are then studied leveraging the vaderSentiment library and histograms - it is reflected that the majority of customer reviews coming through online purchases are slightly positive, whereas overall customer reviews are neutral in general.

The entire Review and Summary column from the raw data is then evaluated by sentiment polarity, from which a common pattern is found from the customer review summary - most of the reviews with negative sentiment relate to the key word “disappointing”, implying that there is an gap between the expectation of product deliverables vs the actual deliverables customers perceive.

To further dive into the root cause, we can extract the product IDs associated with these negative reviews to see if the comments are generated from a specific range or items, so that more consolidated efforts can be put to refine the product quality or review the product descriptions/ marketing messages to minimise false expectations.
