# R from Zero Training Series
# Week 1 Clean Script

# Run source file ----
source("week 1/scripts/00 prep.R")

# Expore dataset ----

# Review properties of data
glimpse(raw) # 100 observations

# Review first 6 observations
head(raw)

# Review last 6 observations
tail(raw)

# Review variable names
names(raw) # 13 variables

# Frequency review ----
# check for the following: 
# values out of range
# implausible or suspicious values
# mistakes in skip logic and question type
# failures of logic tests (not skip logic but expected social values
# such as combinations of age, education, employment, etc)

# ID

frq(raw$ID)


# Consent 

frq(raw$Consent)

consent <- raw %>% 
  filter(Consent=="Yes")

consent

frq(consent$Consent)


# Type of errors---- 
# Duplicate IDs
# Misspelling of City Xai-Xai
# One sex response missing
# one respondent is aged 15, 99 and 150
# 18 year old with PhD is a little suspicious
# employment status mismatch, a lot  of young people retired, 
# people who said they had no formal education respondent student
# registered has some responses coded and some not
# reported satisfaction despite not receiving assistance
# reported dissatisfaction when selected somewhat satisfied 
# item quality has incorrect label 
# Non-Consenting Participants completed survey (4)
