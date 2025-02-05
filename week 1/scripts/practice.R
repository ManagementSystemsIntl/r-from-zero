# R from Zero Training Series
# Week 1 Clean Script

# Install and load packages ----
# This is usually in the 00 prep file, but adding here to simplify 
# Install required packages
install.packages(c("dplyr", "purrr", "readxl", "sjmisc", "sjPlot"))

# Load libraries
library(dplyr)
library(purrr)
library(readxl)
library(sjmisc)
library(sjPlot)

# Create an object for the dataset
# add file path then run the line of code
raw <- read.csv("[add file path]/dataset.csv")

# Explore dataset ----

# Review properties of data
glimpse(raw) # How many observations?

# Review the first 6 observations


# Review the last 6 observations


# Review variable names
names(raw) # How many variables?

# Frequency review ----
# check for the following: 
# implausible or suspicious values
# mistakes in skip logic and question type
# failures of logic tests (not skip logic but expected social values
# such as combinations of age, education, employment, etc)

# ID ----
frq(raw$ID) 
# FINDINGS: 

# city ----
# run the frq() function to investigate 

# FINDINGS: 

# consent ----
frq(raw$consent) 
# How many respondents consented?  

# sex -----
# run the frq() function to investigate 

# FINDINGS: 

# age ----
# run the frq() function to investigate 

# FINDINGS: 

# education ----
# run the frq() function to investigate 


# run the table() function to investigate 
table(raw$age, 
      raw$education) # Do you see anything suspicious? 
# FINDINGS: 

# employment ----
frq(raw$employment)

# checking with age
table(raw$age, 
      raw$employment) 
# a lot of young people are retired, lucky - yet suspicious 

# now we create a new object focusing on those who 
# are under the averageretirement age
under_retireage <- raw %>% 
  filter(age<62)

# create a tab_xtab() function looking at age and 
# employment in the new object we just created


# How many people said they were retired?

# checking employment with education
tab_xtab(raw$education, 
         raw$employment)

# now let's create a new object including students only


# run this, quick way to check results
table(student$education, 
         student$employment)
# How many "student" also stated they have no formal education? 

# FINDINGS: 

# Let's go ahead and filter out those who did not consent
# you will want to use the raw_filt object moving forward
raw_filt <- raw %>% 
  filter(consent=="Yes")

# registered ----
# run the frq() function to investigate 

# FINDINGS: 

# received_assistance ----
# run the frq() function to investigate 

# How many respondents said yes?

# satisfaction ----
# run the frq() function to investigate  

# How many responded dissatisfied? 

# run tab_xtab to check for skip logic issues


# FINDINGS: 

# dissatisfied_reason ----
frq(raw_filt$dissatisfied_reason) 
#How many should have responded? 

# run tab_xtab to check for skip logic issues

# FINDINGS: 

# quantity ----
frq(raw_filt$quantity) 
#How many should have responded? 

# run tab_xtab to check for skip logic issues

# FINDINGS: 

# quality
# run the frq() function to investigate  


# run tab_xtab to check for skip logic issues

# FINDINGS: 


