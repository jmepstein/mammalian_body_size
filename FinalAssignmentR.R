# R Assignment 8 (Final Assignment)

#Installing and loading packages:
install.packages("dplyr")
library(dplyr)

#Importing mammal body size data:
mammal_sizes <- read.csv("MOMv3.3.txt", header=F, sep = "\t", na.strings = "-999",
                         stringsAsFactors = F)
head(mammal_sizes)

#Adding column names to mammal body size data:
colnames(mammal_sizes) <- c("continent", "status", "order", 
                            "family", "genus", "species", "log_mass", "combined_mass", 
                            "reference")
head(mammal_sizes)
mammal_sizes$continent

#Calculating the mean mass of the extinct species and the extant spcies:
mean_mass_extinct <- mean(mammal_sizes$combined_mass[mammal_sizes$status == "extinct"], na.rm = T)
mean_mass_extant <- mean(mammal_sizes$combined_mass[mammal_sizes$status == "extant"], na.rm = T)

#Calculating the mean mass of extinct species among different continents:
extinct_mass <- mammal_sizes %>%
                filter(status == 'extinct')%>%
                group_by(continent) %>%
                summarize(mean(combined_mass))

#Calculating the mean mass of extant species among different continents:
extant_mass <- mammal_sizes %>%
              filter(status == 'extant')%>%
              group_by(continent) %>%
              summarize(mean(combined_mass, na.rm=T))
  
  
  
  
