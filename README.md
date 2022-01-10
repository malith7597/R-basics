# R-basics
Basic R fundamentals for data analysis  ( basic statistics,plotting and sql/ dplyr and of %>% pipe operator)
While SQL is one of the most widely used programming languages for querying datasets, R is quickly growing the top for analysts and data scientists looking to enrich their statistical repertoires. The rise of data-driven marketing and sales operations has swiftly forayed R into the start-up and enterprise worlds. Owing to its massive suite of libraries and visualizations, boasting over 10,000 packages on CRAN alone, R is just as powerful, if not more, as any leading BI tool when it comes to exploring correlations and causal relationships in your customer datasets. As an IDE, RStudio's GUI is also perfect for querying datasets in syntax not dissimilar to SQL.

The supply of fossil fuels is constantly decreasing. Major automotive manufacturers like Tesla and Porsche manufacture many electric vehicles. The improvement of battery technology in recent years has led to the higher popularity of electric vehicles. They are good for the environment and they do not emit any greenhouse gases. There are, however, many challenges associated with electric vehicles. They have a limited range. Charging the vehicle takes time and can be a hassle sometimes. The availability of charging stations is also a big issue. Incompatibility of charging stations can also be a problem. Despite many challenges and issues, switching to electric vehicles is good for the environment and is more economically viable in the long term. In this task, we will utilise electric vehicles (EV) information extracted from the https://ev-database.org website which provides a complete overview of all electric vehicles in Europe. The provided dataset (EV_cars_info.xls) includes information for 102 different EVs. The specific 14 attributes in the dataset (see attached file) include among others information for the brand name, model name, acceleration per sec, range per km, body-style type, number of seats as well as prices in euros. 

The main objective in this question is to import the provided ev_cars_info.xls dataset into a database (MySQL) and then, via R environment, to request some queries to the database and illustrate the outcome/result of those queries in RStudio environment. You need to explore two different ways of exploring the database via R. The first (classic) methodology is using the functions contained in the RMySQL/DBI packages while the second via the dplyr/dbplyr packages. Finally, you need to import back the contents of the “ev_cars table” into R and produce/illustrate some simple visualization of the various attributes included in this dataset. 

Specific Tasks:

1.	Import the provided ev_cars_info.xls to the database (you may need to save it first as csv file) and inspect what you have loaded via an appropriate command.
2.	Using the RMySQL/DBI methodology, “ask” via R the following queries and present the appropriate outcome of each query:
	Get the first 15 rows of the imported table
	Get those cars with 4 seats and top speed greater equal to 200 km/h
	Get the average range and efficiency by types of body-styles
	Get the car models and acceleration for cars belonging to segment F
	Get the max Battery_pack and the min FastCharge for cars belonging to Hatchback body-style.
	Get those car models, which their brand starts with S and their price is less than 40,000 euros.
3.	Explore the dplyr/dbplyr alternative methodology and provide results for all above queries too. You need to read/explore the role of %>% pipe operator. This methodology is not covered in related tutorial.
4.	Extract all information from database to R and produce/illustrate the following visualization schematics:
	Create a pie chart showing the proportion of cars from the dataset that have different number of seats.
	Draw a scatter plot showing the relationship between Acceleration and Range. What conclusion can we get from this graph? 
	Create a boxplot to show the distribution of FastCharge per body-style “classes”.
	Create a bar graph that shows the number of each “class” of body-styles attribute in this EV dataset.
In your main text, you need to include together with your results/discussion, the related segments of your R code. At the end of your report, you have to include all of your codes as an appendix.
