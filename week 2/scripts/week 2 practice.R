# R from Zero Training Series
# Week 2 

# Install and load packages ----
# This is usually in the 00 prep file, but adding here to simplify 
# Install required packages
install.packages(c("dplyr", "purrr", "readxl", "sjmisc", "sjPlot", "readr", "flextable"))

# Load libraries
library(dplyr)
library(purrr)
library(readxl)
library(sjmisc)
library(sjPlot)
library(readr)
library(flextable)

# Create an object for the dataset ----
# add file path then run the line of code
raw <- read.csv("week 2 dataset.csv")

# Filter to keep those who consented to be interviewed 
raw <- raw %>% 
  filter(consent=="Yes")

# Review the data to find errors -----
# You generally would do this with map()
# but I added all the errors below 

## city ----
frq(raw$city) 
# ERROR: Misspelling of City Xai-Xai

# run the mutate() and case_when() function to change the name
# "XaiXai" to "Xai-Xai"

raw <- raw %>% 
  mutate(city = case_when(           ,
                          TRUE ~ city))

# run the frq() function to check to see if it worked


## education ----
# What is your highest level of education?
# Responses: No formal education, High School, Bachelor's, Master's, PhD
frq(raw$education)
# ERROR: Incorrect label, "None" 

# run the mutate() and ifelse() function to set the condition as
# when education equals "None", if true change to "No formal education"

raw <- raw %>% 
  mutate(education = ifelse(   ,    , education))

# run the frq() function to check to see if it worked


## registered ----
# Are you the registered beneficiary for this distribution? 
# Responses: Yes, No
frq(raw$registered)
# ERROR: registered has some responses coded and some not

# run the mutate() and case_when() function to change 1 and 0
# to "Yes" and "No, everything else should remain the same

raw <- raw %>% 
  mutate(registered = case_when(      ,
                                      ,
                                TRUE ~   ))

# run the frq() function to check to see if it worked


# Setting missing values ----
# We want to set blanks to missing values if they are true missing values
# To do this we will use the ifelse() function, and example is below
# Set the missing values for the rest of the variables needed: 
# dissatisfied_reason, quantity, quality

frq(raw$satisfaction)

raw <- raw %>% 
  mutate(satisfaction = ifelse(satisfaction=="", NA_real_, satisfaction))

# Now we can map to review the frequencies and will see a nicely cleaned dataset
map(raw[2:13], frq)

# Save cleaned data ----
write_csv(raw, "week 2 dataset cleaned.csv")
write_rds(raw, "week 2 dataset cleaned.rds")

# Now it's your time to analyze ----
# First, create a new object of your cleaned dataset and call it cln

# Then go through step-by-step the process outlined under 
# the "Creating a Flextable" section of the week 2 guide

# Choose one of these questions to analyze: consent, registered, received_assistance, satisfaction, quantity or quality. 
# Create a new numeric variable in binary form (0,1) from the question selected, using `mutate()`.
# Choose one of these demographic variables to `groupby()`: city, sex, education, employment. Bonus if you create a categorical variable from age and use that. 
# Create a table-ready object using the question and disaggregation of choice. 
# Create a `flextable()` that includes the number and percent of responses. 

# Please share the table you created in our Teams channel! 



