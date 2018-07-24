# Baseball Insights with Tableau

### Summary:

 This report documents the design process of developing a data story using 
 [Tableau](https://www.tableau.com/), which allows user to build rich data 
 visualizations for exploratory and explanatory data analysis. The Tableau 
 storyboard investigates baseball statistics and explores the relationship
 between a batter's handedness (left, right, or both), height, and weight 
 on performance statistics such as the number of Home Runs (HR) hit and player 
 Batting Average over the course of their career. A total of 1,157 
 player's are included in the data set. Both an initial storyboard and a 
 final storybaord (after recieveing external feedback) can be found at the links
 below:

[First Storyboard Link](https://public.tableau.com/profile/greg.clunies#!/vizhome/p8_Baseball_Data_orig/Story1?publish=yes)

[Second Storyboard](https://public.tableau.com/profile/greg.clunies#!/vizhome/p8_Baseball_Data_final/Story1?publish=yes)
 
## Design:
 
 Variables in the dataset include:

 - Player Name
 - Handedness
 - Height (in inches)
 - Weight (in lbs.)
 - Batting Average
 - Home Runs

 I created an additional variable, Body Mass Index (BMI) using the following
 formula:

 `BMI = [weight (lb) / height (in) / height (in)] x 703`

 Based on the varibales provided, I have chosen to include the following
 visualiztions:

 1. Bar plots and histograms of each variable to understand the overall
 distribution of each variable.

 2. Box plots for home runs and batting average by handedness. Include filters
 to narrow into specific ranges (e.g., player's with batting average > 0.280). 

 3. Line plots comparinging batting average and home runs against player height,
 weight, and BMI.

 4. A scatter plot of Batting Avg. versus Home Runs, with the histograms in 
 visualization **1.**, which when used with filters for HR and Batting Avg., it 
 will be easy to see the characteristics of high performing batters. 

## Feedback:

 I received the following feedback after sharing my visualization with a friend. 

 - How are the handedness of batters distributed among the other player
   attributes (weight, height, BMI)
 - You mention that for the line plots comparing weight, height, and BMI to 
   Batting Avg. and Home Runs, that the variability in batting avg. and home 
   runs hit increases at the extreme values of height, weight, BMI. Is there a 
   way to show how many records occur for each value of height/weight/BMI on the
   line plots?

 I have made the follwing changes to address each point of feedback:

 - Added Handedness to the color detail of each histogram
 - Added number of Records to the size of each line plot. Thicker lines now 
   indicate more records at a given value of height/weight/BMI

## Resources:

I used the following online resources to get some general knowledge about 
baseball batting averages, known effects of handedness on perfromance, and 
estimates of what a "good" batting average is.

- [CDC Formula for BMI](https://www.cdc.gov/nccdphp/dnpao/growthcharts/training/bmiage/page5_2.html)
- [The Importance Of Handedness Training In Baseball Hitting](https://www.gamesensesports.com/knowledge/2017/3/17/righties-vs-lefties-the-importance-of-handedness-training-in-baseball-hitting)
- [.280 is the new 0.300](https://www.usatoday.com/story/sports/mlb/2014/08/29/mlb-hitting-300/14801965/)

## Data Files

 - baseball_data.csv
