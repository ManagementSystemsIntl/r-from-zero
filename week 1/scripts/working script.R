# R from Zero Training Series
# Week 1 Working Script

# Install required packages
install.packages(c("dplyr", "purrr", "readxl", "sjmisc"))

# Load libraries
library(dplyr)
library(purrr)
library(readxl)
library(sjmisc)

# set working directory
setwd("C:/Users/melanie.murphy/Desktop/R projects/r-from-zero")

# Create an object for the dataset
raw <- read_xlsx("week 1/data/datatest.xlsx")


# Create an object for the dataset
raw <- read_xlsx("week 1/data/datatest.xlsx")

names(raw)

head(raw)

tail(raw)

glimpse(raw)


