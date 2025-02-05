# R from Zero Training Series
# Week 1 Clean Script

# Run source file ----
source("week 1/scripts/00 prep.R")

# Explore dataset ----

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

# ID ----
# Unique ID of respondent
frq(raw$ID) 
# ERROR: Duplicate IDs

# city ----
frq(raw$city) 
# ERROR: Misspelling of City Xai-Xai

# consent ----
# Whether respondent consents to be interviewed
frq(raw$consent) #100 were asked to be interviewed

consented <- raw %>% 
  filter(consent=="Yes")

frq(consented$consent) # 91 consented, sample for the rest of the survey is 91 respondents
# ERROR: None

# sex -----
frq(raw$sex) 
# ERROR: One sex response missing, need to require question

# age ----
frq(raw$age) # Only 5 NAs, when there should be 9
# ERROR: Non-Consenting Participants completed survey (4)
# ERROR: one respondent is aged 15, 99 and 150

# education ----
# What is your highest level of education?
# Responses: No formal education, High School, Bachelor's, Master's, PhD
frq(raw$education)

table(raw$age, 
      raw$education)
# ERROR: Non-Consenting Participants completed survey (4)
# ERROR: Incorrect label, "None" 
# ERROR: 18 and 22 year olds with PhD is a little suspicious

# employment ----
# What is your current employment status?
# Responses: Unemployment, Employed, Retired, Student
#checking with age
frq(raw$employment)

table(raw$age, 
      raw$employment)

under_retireage <- raw %>% 
  filter(age<62)

tab_xtab(under_retireage$age, 
         under_retireage$employment)
#we see that there are around 15 people who stated 
#they were retired under average retirement age

#checking with education
tab_xtab(raw$education, 
         raw$employment)

student <- raw %>% 
  filter(employment=="Student")

table(student$education, 
         student$employment)
# ERROR: Non-Consenting Participants completed survey (4)
# ERROR: employment status mismatch, a lot  of young people retired
# ERROR: people who said they had no formal education respondent student

raw_filt <- raw %>% 
  filter(consent=="Yes")

# registered ----
# Are you the registered beneficiary for this distribution? 
# Responses: Yes, No
frq(raw_filt$registered)
# ERROR: registered has some responses coded and some not

# received_assistance ----
# Did you receive assistance today? 
# Responses: Yes, No
frq(raw_filt$received_assistance) #70 respondents said yes
# ERROR: None

# satisfaction ----
# If you received assistance, were you satisfied with the assistance received? 
# Responses: Very dissatisfied, Somewhat dissatisfied, Somewhat satisfied, Very satisfied
frq(raw_filt$satisfaction) #61 responses when there should be 70

tab_xtab(raw_filt$satisfaction, 
         raw_filt$received_assistance)
# ERROR: reported satisfaction despite not receiving assistance
# ERROR: received assistance but wasn't asked this question

# dissatisfied_reason ----
# Why were you dissatisfied with the assistance received? (please select all that apply)
# Responses: Wait too long, Quality, Limited variety
frq(raw_filt$satisfaction) #32 dissatisfied
frq(raw_filt$dissatisfied_reason) #42 responses

tab_xtab(raw_filt$satisfaction, 
         raw_filt$dissatisfied_reason)
# ERROR: reported dissatisfaction when selected somewhat satisfied 

# quantity ----
# If you received assistance, did you receive the correct number of items?
# Responses: Yes, No
frq(raw_filt$quantity) #71 responses, when there should be 70

tab_xtab(raw_filt$quantity, 
         raw_filt$received_assistance)
# ERROR: reported quantity despite not receiving assistance

# quality
# If you received assistance, how would you rate the quality of the items received? 
# Responses: Poor, Ok, Great
frq(raw_filt$quality) #71 responses, when there should be 70

tab_xtab(raw_filt$quality, 
         raw_filt$received_assistance)
# ERROR: item quality has incorrect label 
# ERROR: reported quality despite not receiving assistance

