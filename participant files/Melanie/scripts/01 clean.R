# Expore dataset ----

# review properties of data
glimpse(raw) # 100 observations

head(raw)
tail(raw)

names(raw)


#filter out people who didn't consent

filter_raw <- raw %>% 
  filter(consent=="Yes")

filter_raw
