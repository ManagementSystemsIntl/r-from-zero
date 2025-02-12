# R from Zero Training Series
# Week 2 Prep Script

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

# Create an object for the dataset
raw <- read.csv("week 2/data/raw/week 2 dataset.csv")
cln <- readRDS("week 2/data/cleaned/week 2 dataset cleaned.rds")
