# R from Zero Training Series
# Week 1 Prep Script

# Install required packages
install.packages(c("dplyr", "purrr", "readxl", "sjmisc"))

# Load libraries
library(dplyr)
library(purrr)
library(readxl)
library(sjmisc)

# Set working directory
setwd("C:/Users/melanie.murphy/Desktop/R projects/r-from-zero")

# Create an object for the dataset
raw <- read.csv("week 1/data/dataset.csv")
