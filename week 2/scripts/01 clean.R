# R from Zero Training Series
# Week 2 Clean Script

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

# received_assistance ----
# Did you receive assistance today? 
# Responses: Yes, No
frq(raw$received_assistance) #70 respondents said yes

# satisfaction ----
# If you received assistance, were you satisfied with the assistance received? 
# Responses: Very dissatisfied, Somewhat dissatisfied, Somewhat satisfied, Very satisfied
frq(raw$satisfaction) #61 responses when there should be 70

tab_xtab(raw$satisfaction, 
         raw$received_assistance)
# ERROR: reported satisfaction despite not receiving assistance
# ERROR: received assistance but wasn't asked this question

# dissatisfied_reason ----
# Why were you dissatisfied with the assistance received? (please select all that apply)
# Responses: Wait too long, Quality, Limited variety
frq(raw$satisfaction) #32 dissatisfied
frq(raw$dissatisfied_reason) #42 responses

tab_xtab(raw$satisfaction, 
         raw$dissatisfied_reason)
# ERROR: reported dissatisfaction when selected somewhat satisfied 


raw <- raw %>% 
  filter(consent=="Yes") %>% 
  mutate(city = case_when(city=="XaiXai" ~ "Xai-Xai",
                          TRUE ~ city),
         education = ifelse(education=="None","No formal education", education),
         registered = case_when(registered==1 ~ "Yes",
                                registered==0 ~ "No",
                                TRUE ~ registered),
         satisfaction = ifelse(received_assistance=="Yes", satisfaction, NA_real_),
         satisfaction = ifelse(satisfaction=="", "Not asked", satisfaction),
         dissatisfied_reason = ifelse(dissatisfied_reason=="", NA_real_, dissatisfied_reason),
         dissatisfied_reason = ifelse(satisfaction=="Somewhat satisfied", NA_real_, dissatisfied_reason),
         quantity = ifelse(received_assistance=="Yes", quantity, NA_real_),
         quantity = ifelse(quantity=="", "Not asked", quantity),
         quality = ifelse(received_assistance=="Yes", quality, NA_real_),
         quality = ifelse(quality=="", "Not asked", quality))

map(raw[2:13], frq)

# Save cleaned data ----
write_csv(raw, "week 2/data/cleaned/week 2 dataset cleaned.csv")
write_rds(raw, "week 2/data/cleaned/week 2 dataset cleaned.rds")

