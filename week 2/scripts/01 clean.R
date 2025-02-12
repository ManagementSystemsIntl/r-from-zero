# R from Zero Training Series
# Week 2 Clean Script

# Let's say we exported data from Fulcrum or ODK 
# after the data collection period ended. While 
# exploring the data, we noticed there are still 
# a few variables that need to be cleaned before 
# moving onto the analysis. Using the same survey 
# data from last week (slightly improved because 
# of your great feedback on the pilot data), 
# let's examine a few of those issues.

# Run source file ----
source("week 2/scripts/00 prep.R")

# city ----
frq(raw$city) 
# ERROR: Misspelling of City Xai-Xai

# education ----
# What is your highest level of education?
# Responses: No formal education, High School, Bachelor's, Master's, PhD
frq(raw$education)
# ERROR: Incorrect label, "None" 

# registered ----
# Are you the registered beneficiary for this distribution? 
# Responses: Yes, No
frq(raw$registered)
# ERROR: registered has some responses coded and some not

raw <- raw %>% 
  filter(consent=="Yes") %>% 
  mutate(city = case_when(city=="XaiXai" ~ "Xai-Xai",
                          TRUE ~ city),
         education = ifelse(education=="None","No formal education", education),
         registered = case_when(registered==1 ~ "Yes",
                                registered==0 ~ "No",
                                TRUE ~ registered),
         satisfaction = ifelse(satisfaction=="", NA_real_, satisfaction),
         dissatisfied_reason = ifelse(dissatisfied_reason=="", NA_real_, dissatisfied_reason),
         quantity = ifelse(quantity=="", NA_real_, quantity),
         quality = ifelse(quality=="", NA_real_, quality)) %>% 
  rename(dis_reason = dissatisfied_reason)

map(raw[2:13], frq)

# Save cleaned data ----
write_csv(raw, "week 2/data/cleaned/week 2 dataset cleaned.csv")
write_rds(raw, "week 2/data/cleaned/week 2 dataset cleaned.rds")

