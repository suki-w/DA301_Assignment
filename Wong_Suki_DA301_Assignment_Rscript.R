## LSE Data Analytics Online Career Accelerator 

# DA301:  Advanced Analytics for Organisational Impact

###############################################################################

# Assignment template

## Scenario
## You are a data analyst working for Turtle Games, a game manufacturer and 
## retailer. They manufacture and sell their own products, along with sourcing
## and selling products manufactured by other companies. Their product range 
## includes books, board games, video games and toys. They have a global 
## customer base and have a business objective of improving overall sales 
##performance by utilising customer trends. 

## In particular, Turtle Games wants to understand:
## - how customers accumulate loyalty points (Week 1)
## - how useful are remuneration and spending scores data (Week 2)
## - can social data (e.g. customer reviews) be used in marketing 
##     campaigns (Week 3)
## - what is the impact on sales per product (Week 4)
## - the reliability of the data (e.g. normal distribution, Skewness, Kurtosis)
##     (Week 5)
## - if there is any possible relationship(s) in sales between North America,
##     Europe, and global sales (Week 6).

################################################################################

# Week 4 assignment: EDA using R

## The sales department of Turtle games prefers R to Python. As you can perform
## data analysis in R, you will explore and prepare the data set for analysis by
## utilising basic statistics and plots. Note that you will use this data set 
## in future modules as well and it is, therefore, strongly encouraged to first
## clean the data as per provided guidelines and then save a copy of the clean 
## data for future use.

# Instructions
# 1. Load and explore the data.
##  - Remove redundant columns (Ranking, Year, Genre, Publisher) by creating 
##      a subset of the data frame.
##  - Create a summary of the new data frame.
# 2. Create plots to review and determine insights into data set.
##  - Create scatterplots, histograms and boxplots to gain insights into
##      the Sales data.
##  - Note your observations and diagrams that could be used to provide
##      insights to the business.
# 3. Include your insights and observations.

###############################################################################

# 1. Load and explore the data

# Install and import Tidyverse.
install.packages('tidyverse')
library(tidyverse)

# Import the data set.
turtle_sales_raw <- read.csv('turtle_sales.csv', header=TRUE) 

# Print the data frame.
dim(turtle_sales_raw)
view(turtle_sales_raw)
as_tibble(turtle_sales_raw)

# Create a new data frame from a subset of the sales data frame.
# Remove unnecessary columns. 
turtle_sales <- select(turtle_sales_raw, -c('Ranking','Year','Genre','Publisher')) 
# Rename columns. 
colnames(turtle_sales)[1]="product"
colnames(turtle_sales)[2]="platform"

# View the data frame.
dim(turtle_sales)
view(turtle_sales)
as_tibble(turtle_sales)

# Determine the sum of missing values (data frame and seatbelt column). 
sum(is.na(turtle_sales))

# Change datatype of categorical columns to factor.
turtle_sales$product=as.factor(turtle_sales$product)
turtle_sales$platform=as.factor(turtle_sales$platform)

# Check unique count of categorical columns.
n_distinct(turtle_sales$product)
n_distinct(turtle_sales$platform)

# Sense check to see if each data entry represents one unique product
turtle_unique_check <- filter(turtle_sales, product == '9080')
turtle_unique_check 

# View the descriptive statistics.
summary(turtle_sales)

################################################################################

# 2. Review plots to determine insights into the data set.

## 2a) Scatterplots

# Create scatterplot to explore relationship between EU & NA Sales.
qplot(NA_Sales, EU_Sales, data=turtle_sales)
# Create scatterplot to explore relationship between Global & NA Sales.
qplot(Global_Sales, NA_Sales, data=turtle_sales)
# Create scatterplot to explore relationship between Global & EU Sales.
qplot(Global_Sales, EU_Sales, data=turtle_sales)

## 2b) Histograms

# Create histogram for Global Sales column.
qplot(Global_Sales, bins=20,data=turtle_sales)
# Create histogram for NA Sales column.
qplot(NA_Sales, bins=20, data=turtle_sales)
# Create histogram for EU Sales column.
qplot(EU_Sales, bins=20, data=turtle_sales)

## 2c) Boxplots

# Create subset of Dataframe to generate boxplots.
turtle_sales_sub <- select(turtle_sales,-c('product','platform'))
boxplot(turtle_sales_sub, horizontal=T)

# Remove the major outlier that casts significant impact on the visualization.
turtle_sales_new <- filter(turtle_sales, Global_Sales<40)
turtle_sales_sub <- select(turtle_sales_new,-c('product','platform'))
boxplot(turtle_sales_sub, horizontal=T)

###############################################################################

# 3. Observations and insights

## Your observations and insights here ......
## - Scatterplot is used to examine the relationship between NA sales and EU sales.
## - There is a positive correlation between NA sales and EU sales.
## - Histogram does not provide insights over the data set.
## - Boxplot gives high level overview on the presence of outliers.
## - Further data manipulation is required to reflect statistical distribution insights from the boxplot.

###############################################################################
###############################################################################


# Week 5 assignment: Cleaning and maniulating data using R

## Utilising R, you will explore, prepare and explain the normality of the data
## set based on plots, Skewness, Kurtosis, and a Shapiro-Wilk test. Note that
## you will use this data set in future modules as well and it is, therefore, 
## strongly encouraged to first clean the data as per provided guidelines and 
## then save a copy of the clean data for future use.

## Instructions
# 1. Load and explore the data.
##  - Continue to use the data frame that you prepared in the Week 4 assignment. 
##  - View the data frame to sense-check the data set.
##  - Determine the `min`, `max` and `mean` values of all the sales data.
##  - Create a summary of the data frame.
# 2. Determine the impact on sales per product_id.
##  - Use the group_by and aggregate functions to sum the values grouped by
##      product.
##  - Create a summary of the new data frame.
# 3. Create plots to review and determine insights into the data set.
##  - Create scatterplots, histograms, and boxplots to gain insights into 
##     the Sales data.
##  - Note your observations and diagrams that could be used to provide 
##     insights to the business.
# 4. Determine the normality of the data set.
##  - Create and explore Q-Q plots for all sales data.
##  - Perform a Shapiro-Wilk test on all the sales data.
##  - Determine the Skewness and Kurtosis of all the sales data.
##  - Determine if there is any correlation between the sales data columns.
# 5. Create plots to gain insights into the sales data.
##  - Compare all the sales data (columns) for any correlation(s).
##  - Add a trend line to the plots for ease of interpretation.
# 6. Include your insights and observations.

################################################################################

# 1. Load and explore the data

# View data frame created in Week 4.
dim(turtle_sales)
as.tibble(turtle_sales)
view(turtle_sales)

# Check output: Determine the min, max, and mean values.
turtle_sales_agg <- select(turtle_sales,-c('product','platform'))
apply(turtle_sales_agg,2,min)
apply(turtle_sales_agg,2,max)
apply(turtle_sales_agg,2,mean)

# View the descriptive statistics.
summary(turtle_sales_agg)

###############################################################################

# 2. Determine the impact on sales per product_id.

## 2a) Use the group_by and aggregate functions.
# Group data based on Product and determine the sum of sales per Product.

product_total <- turtle_sales %>% group_by(product) %>%
  summarise(NA_total=sum(NA_Sales),EU_total=sum(EU_Sales),Global_total=sum(Global_Sales),
            .groups='drop')

# View the data frame.
view(product_total)

# Explore the data frame.
dim(product_total)
as.tibble(product_total)

## 2b) Determine which plot is the best to compare game sales.

# Create scatterplots to explore of sales across products.
qplot(product, Global_total, data=product_total)
qplot(product, NA_total, data=product_total)
qplot(product, EU_total, data=product_total)

# Create scatterplots to explore of sales across platforms.
qplot(platform, Global_total, data=platform_total)
qplot(platform, NA_total, data=platform_total)
qplot(platform, EU_total, data=platform_total)

# Create scatterplot to explore relationship between EU & NA Sales.
qplot(NA_total, EU_total, data=product_total)

# Create a new Dataframe with a column to reflect product count by platform.
product_by_platform <- turtle_sales %>% group_by(platform) %>% 
  summarise(product_count=n_distinct(product),NA_total=sum(NA_Sales), EU_total=sum(EU_Sales), Global_total=sum(Global_Sales))
product_by_platform <- product_by_platform[order(-product_by_platform$product_count, -product_by_platform$Global_total),]
as.tibble(product_by_platform)
view(product_by_platform)

# Create scatterplots to explore correlation between sales and product count.
qplot(product_count, Global_total, data=product_by_platform)                            
qplot(product_count, NA_total, data=product_by_platform)  
qplot(product_count, EU_total, data=product_by_platform)  

# Create histograms.
qplot(Global_total, bins=20,data=product_total)
qplot(NA_total, bins=20,data=product_total)
qplot(EU_total, bins=20,data=product_total)

# Create boxplots.
product_total_sub <- select(product_total, -c('product','platform'))
boxplot(product_total_sub, horizontal=T)

# Remove the major outlier that casts significant impact on the visualization.
product_total_sub1 <- filter(product_total_sub, Global_total<40)
boxplot(product_total_sub1, horizontal=T)

###############################################################################


# 3. Determine the normality of the data set.

## 3a) Create Q-Q Plots

# Global Sales:Create Q-Q Plots.
qqnorm(product_total$Global_total, col='blue', xlab="Normal Theoratical Quantiles", ylab=' Global Sales')
# Global Sales: Add a reference line to the qqplot.
qqline(product_total$Global_total, col='red', lwd=2)

# NA Sales: Create Q-Q Plots.
qqnorm(product_total$NA_total, col='blue', xlab="Normal Theoratical Quantiles", ylab='NA Sales')
# NA Sales: Add a reference line to the qqplot.
qqline(product_total$NA_total, col='red', lwd=2)

# EU Sales: Create Q-Q Plots.
qqnorm(product_total$EU_total, col='blue', xlab="Normal Theoratical Quantiles", ylab='EU Sales')
# EU Sales: Add a reference line to the qqplot.
qqline(product_total$EU_total, col='red', lwd=2)

## 3b) Perform Shapiro-Wilk test

# Install and import Moments.
install.packages('moments') 
library(moments)

# Global Sales: Perform Shapiro-Wilk test.
shapiro.test(product_total$Global_total)
# NA Sales: Perform Shapiro-Wilk test.
shapiro.test(product_total$NA_total)
# EU Sales: Perform Shapiro-Wilk test.
shapiro.test(product_total$EU_total)

## 3c) Determine Skewness and Kurtosis

# Global Sales: Specify the skewness and kurtosis.
skewness(product_total$Global_total)
kurtosis(product_total$Global_total)

# NA Sales: Specify the skewness and kurtosis.
skewness(product_total$NA_total)
kurtosis(product_total$NA_total)

# EU Sales: Specify the skewness and kurtosis.
skewness(product_total$EU_total)
kurtosis(product_total$EU_total)

## 3d) Determine correlation

# Determine correlation between Global Sales vs NA/ EU Sales.
cor(product_total$Global_total, product_total$NA_total)
cor(product_total$Global_total, product_total$EU_total)

# Determine correlation between NA Sales vs EU Sales.
cor(product_total$NA_total, product_total$EU_total)

###############################################################################

# 4. Plot the data

# Create a new Dataframe to store sum of sales grouped by platforms and products.
platform_total <- turtle_sales %>% group_by(platform,product) %>%
  summarise(NA_total=sum(NA_Sales),EU_total=sum(EU_Sales),Global_total=sum(Global_Sales),
            .groups='drop')
platform_total <-filter(platform_total, NA_total<=30 )

# Create a ggplot to explore relationship between NA & EU Sales across platforms.
ggplot (data = platform_total,mapping=aes(x = NA_total, y = EU_total, color =platform))+
  geom_point(color = 'blue', alpha = 0.5, size = 1.5)+
  geom_smooth(method = 'lm', se=F, size=1.5)+
  scale_x_continuous(breaks = seq(0, 35, 5), "NA Sales in £ (Millions)")+
  scale_y_continuous(breaks = seq(0, 25, 5), "EU Sales in £ (Millions)")+
  labs(title = "Relationship Between NA & EU Sales Across Platforms",
       color = "Platform")

###############################################################################

# 5. Observations and insights
# Your observations and insights here...
## - Product sales are non-normal distribution.
## - Product sales are highly positively skewed with sharp peaks and heavy tails.
## - Platform DS, 3DS and Wii are seen with high correlation between NA & EU Sales.


###############################################################################
###############################################################################

# Week 6 assignment: Making recommendations to the business using R

## The sales department wants to better understand if there is any relationship
## between North America, Europe, and global sales. Therefore, you need to
## investigate any possible relationship(s) in the sales data by creating a 
## simple and multiple linear regression model. Based on the models and your
## previous analysis (Weeks 1-5), you will then provide recommendations to 
## Turtle Games based on:
##   - Do you have confidence in the models based on goodness of fit and
##        accuracy of predictions?
##   - What would your suggestions and recommendations be to the business?
##   - If needed, how would you improve the model(s)?
##   - Explain your answers.

# Instructions
# 1. Load and explore the data.
##  - Continue to use the data frame that you prepared in the Week 5 assignment. 
# 2. Create a simple linear regression model.
##  - Determine the correlation between the sales columns.
##  - View the output.
##  - Create plots to view the linear regression.
# 3. Create a multiple linear regression model
##  - Select only the numeric columns.
##  - Determine the correlation between the sales columns.
##  - View the output.
# 4. Predict global sales based on provided values. Compare your prediction to
#      the observed value(s).
##  - NA_Sales_sum of 34.02 and EU_Sales_sum of 23.80.
##  - NA_Sales_sum of 3.93 and EU_Sales_sum of 1.56.
##  - NA_Sales_sum of 2.73 and EU_Sales_sum of 0.65.
##  - NA_Sales_sum of 2.26 and EU_Sales_sum of 0.97.
##  - NA_Sales_sum of 22.08 and EU_Sales_sum of 0.52.
# 5. Include your insights and observations.

###############################################################################

# 1. Load and explor the data
# View data frame created in Week 5.
dim(product_total)
as.tibble(product_total)
view(product_total)

# Determine a summary of the data frame.
summary(product_total)

###############################################################################

# 2. Create a simple linear regression model

## 2a) Determine the correlation between columns
product_total_clean <- select(product_total, c('NA_total','EU_total','Global_total'))
cor(product_total_clean)

# Create a linear regression model on NA & EU Sales.
model_NA_EU <- lm(NA_total~EU_total, data=product_total)
summary(model_NA_EU)

# Create a linear regression model on Global & NA Sales.
model_GB_NA <- lm(NA_total~Global_total, data=product_total)
summary(model_GB_NA)

# Create a linear regression model on Global & EU Sales.
model_GB_EU <- lm(EU_total~Global_total, data=product_total)
summary(model_GB_EU)

## 2b) Create a plot (simple linear regression)
# Basic visualization.

# Explore model_NA_EU.
# View residuals on a plot.
plot(model_NA_EU$residuals)
# Check normality of residuals.
qqnorm(residuals(model_NA_EU))
qqline(residuals(model_NA_EU), col='blue')
# Plot the relationship with base R graphics.
plot(product_total$EU_total, product_total$NA_total)
# Add line-of-best-fit.
coefficients(model_NA_EU)
abline(coefficients(model_NA_EU))

# Explore model_GB_NA.
# View residuals on a plot.
plot(model_GB_NA$residuals)
# Check normality of residuals.
qqnorm(residuals(model_GB_NA))
qqline(residuals(model_GB_NA), col='blue')
# Plot the relationship with base R graphics.
plot(product_total$Global_total, product_total$NA_total)
# Add line-of-best-fit.
coefficients(model_GB_NA)
abline(coefficients(model_GB_NA))

# Explore model_GB_EU.
# View residuals on a plot.
plot(model_GB_EU$residuals)
# Check normality of residuals.
qqnorm(residuals(model_GB_EU))
qqline(residuals(model_GB_EU), col='blue')
# Plot the relationship with base R graphics.
plot(product_total$Global_total, product_total$EU_total)
# Add line-of-best-fit.
coefficients(model_GB_EU)
abline(coefficients(model_GB_EU))

###############################################################################

# 3. Create a multiple linear regression model

# Select only numeric columns from the original data frame.
# Check correlation among sales columns.
turtle_sales_raw <- read.csv('turtle_sales.csv', header=TRUE) 
turtle_sales_clean <- select(turtle_sales_raw, -c('Product', 'Platform', 'Ranking','Year','Genre','Publisher'))
cor(turtle_sales_clean)

# Multiple linear regression model.
model_all = lm(Global_Sales~NA_Sales+EU_Sales, data=turtle_sales)
summary(model_all)

###############################################################################

# 4. Predictions based on given values

# Create new DataFrame to store given values.
NA_Sales <- c(34.02, 3.93, 2.73, 2.26, 22.08)
EU_Sales <- c(23.08, 1.56, 0.65, 0.97, 0.52)
sales_fc = data.frame(NA_Sales, EU_Sales)
sales_fc

# Perform forecast using the model.
sales_fc$Global_Sales <- predict(model_all, newdata = sales_fc)
sales_fc

# Extract observed values from original dataset.
turtle_sales_org <- turtle_sales %>% filter(NA_Sales==34.02|NA_Sales==3.93|NA_Sales==2.73|NA_Sales==2.26|NA_Sales==22.08)
turtle_sales_org

# Compare predicted values with observed values.
sales_fc <- mutate(sales_fc, Observed_Global_Sales=turtle_sales_org$Global_Sales, 
                   Difference=sales_fc$Global_Sales-turtle_sales_org$Global_Sales)
as.tibble(sales_fc)

###############################################################################

# 5. Observations and insights
# Your observations and insights here...
## - Strong, positive correlations between all 3 Sales columns.
## - The 3 Sales columns can fit well into a multi-linear regression model.
## - EU Sales have slightly more influence over Global Sales than NA Sales.

###############################################################################
###############################################################################




