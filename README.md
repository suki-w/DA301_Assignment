# DA301_Assignment

Link to presentation video: https://drive.google.com/drive/folders/1W5sPGXIyv8yhBI7Umzzwxwj2gizA-412?usp=share_link

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


Week 4

The sales raw data is being explored on R, using the Tidyverse package. To start with, the datatype of the Platform and Product columns are changed to factor type to ensure they can be analysed from a categorical perspective. Through sense checking, it is noticed that one unique product may be associated with more than one line of data in the data set.

Scatterplots, histograms and boxplots are used to identify trends in the EDA:

<Scatterplots> Scatterplots can be used when attempting to explore the relationship of two sets of numeric data. Therefore EU Sales data has been used to compare against NA Sales data through the scatterplot, and the result shows that a certain level of positive correlation exists between the sales performance in the two regions. It is definitely worthwhile to explore the relationship further.

<Histograms> Histograms are mainly used to display the distribution frequency of numeric data consolidated in scaled intervals. In this analysis histogram visualisations do not give much insights on sales, especially when each line of data does not necessarily represent one unique product.

<Boxplots> Boxplots can be used to preview statistical distribution of the sales data and identify outliers. From the boxplots, it is observed that outliers are present across Global, NA and EU sales data, and there is one outlier with extreme value within the Global data set that exclusion of it would help improve visualisation quality of the boxplot. The other metrics such as IQR, mean etc. reflected from the boxplot give limited insights though, as each line of data does not necessarily represent one unique product. Further aggregation of product sales data is required for a more accurate visualisation.


Week 5

Data has been further manipulated to enable more in-depth EDA - firstly, product sales have been grouped to provide total regional/ global sales by product. Scatterplots, histograms and boxplots are plotted again to visualise the insights. We can now conclude the product sales are in general positively skewed, as seen from the histogram with peak leaning towards the left, and a median line leaning towards the left plus a shorter left whisker in the boxplot.

Reviewing product sales distribution across platforms would also provide insights. As we look at the scatterplot zooming in on the correlation between regional/ global sales and product count, it is observed from the outlier that PC as a platform generates limited sales despite that it carries a wide range of products.

We then need to determine the normality of product sales with the Q-Q plot, Shapiro-Wilk test, skewness, and kurtosis. From the Q-Q plot, it is observed the sales distribution is far from normal distribution, given the significant deviation from the theoretical quantile lines. Same conclusion can be made from the Shapiro-Wilk test with p-value <0.05. All 3 sets of sales data have skewness ranges from 2.89 to 3.07 (>0), confirming that all of them are highly positively skewed; whereas their kurtosis ranges from 15.6 to 17.8 (>3), implying that their curves have very sharp peaks and heavy tails.

A scatterplot with best fit lines is then plotted to explore the level of correlation between NA and EU Sales across platforms. Platform DS, 3DS and Wii are observed with the highest sales correlation between region NA and EU, i.e. the right sales strategies can possibly drive synergetic sales momentum across both regions.


Week 6

Global, NA and EU Sales have been fitted into linear regression models to delve into their correlations. There is a positive correlation between NA Sales vs EU Sales (0.62), NA Sales vs Global Sales (0.92) as well as EU Sales vs Global Sales (85%), with coefficients of 0.92, 0.51 and 0.32 respectively. The model for NA vs EU Sales does not fit very well with R-squared equaling to 0.38, yet the other two models fit fairly well with R-squared equaling to 0.84 and 0.72 respectively.

A multi-linear regression model is then fitted in to evaluate how NA Sales and EU Sales correlate to Global Sales. The models fit very well with R-square being 0.97 together with low standard errors. The model has defined coefficient of NA Sales as 1.15 and that of EU Sales as 1.34, implying that EU Sales have slightly more influence over Global Sales than NA Sales. Leveraging the model, forecasted Global Sales values have been generated and compared against the observed values - three of the forecasted values are predicted correctly with limited variances, whereas the other two are seen with greater variances.


Recommendations

The following recommendations can be provided to Turtle Games for future growth:

- Target customers with profile of mid to high spending plus mid to high remuneration to drive loyalty engagements
- Review product portfolio on website, bring good products from online to offline and review products that generate negative sentiments
- Investigate what has caused “disappointments” to customers in their purchase, as seen in majority of the negative customer reviews
- Develop concerted sales strategies over platform DS, 3DS and Wii, as there can be synergistic impact on sales given their high level of correlation over sales of NA and EU
- Review product offerings on platform PC as the platform carries a wide range of products yet generates limited sales

