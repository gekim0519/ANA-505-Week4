#Week 4: dplyr package
# Gaeun Kim
#Task: Write the function to get a dataset from Base R: Titanic
#and give the dataframe a new name of your choice
#(hint: you will want your data to be a dataframe. Use the function: as.data.frame(Titanic))
titanic = as.data.frame(Titanic)
#See the top rows of the data
#TASK: Write the function to see the top rows of the data
head(titanic)
#Install and call the package dplyr
#TASK: Write the functions to install and call dplyr
installed.packages('dplyr')
library(dplyr)
#Let's just see the Survived and Sex columns
#Task: Write the function to 'select' the Survived and Sex columns 
#(hint: use the 'select' function)
titanic %>% select(Survived, Sex)
#Let's name the dataset with just the two columns, Survived and Sex
#TASK: Write the function to save the two columns as one new dataset
#and give it a name
titanic_subset = titanic %>% select(Survived, Sex)
#Let's get rid of the Sex column in the new dataset created above
#TASK: Write the function that deselects the sex column
#(hint: use the 'select' function to not select a -column)
 titanic_subset %>% select(-Sex)
#Let's rename a column name
#TASK: Write the function that renames 'Sex' to 'Gender'
titanic_subset %>% rename(Gender = Sex)
#Let's make a new dataframe with the new column name
#TASK: Write the function that names a new dataset that includes the 'gender' column
titanic_subset_rename = titanic_subset %>% rename(Gender = Sex)
#Let's 'filter' just the males from our dataset
#TASK: Write the function that includes only rows that are 'male'
titanic_m = titanic %>% filter(Sex == 'Male')
#Let's 'arrange' our data by gender (not the data you just filtered)
#TASK: Write the function to group the data by gender (hint: arrange())
titanic_subset_rename %>% arrange(Gender)
#Let's see how many people were examined in the dataset (total the frequency in the original dataframe)
#TASK: Sum the Freq column
#TASK: After you run it, write the total here:2201
sum(titanic$Freq)
#Since we have a males dataset, let's make a females dataset
#TASK: Write the function that includes only rows that are 'female'
titanic_f = titanic %>% filter(Sex == 'Female')
#And now let's join the males and females
#TASK: Write the function that joins the male and female rows 
#(hint: try using 'union' or 'bind_rows')
union(titanic_m, titanic_f)

#Optional Task: add any of the other functions 
#you learned about from the dplyr package
#group_by()
titanic %>% group_by(Class) %>% summarise(Freq = sum(Freq))

#mutate()
titanic %>% mutate(Survived_bin = if_else(Survived == 'Yes', 1, 0))
