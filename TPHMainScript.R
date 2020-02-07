x <- c("sp", "ggmap", "rgdal", "rgeos", "maptools", "dplyr", "tidyr", "tmap", "tidyverse", "ggplot2")
install.packages(x)
lapply(x, library, character.only = TRUE)
# 
# 
# #reading maps
library(readxl)
library(rgdal)
TorontoMap = readOGR(dsn = "data/Neighbourhoods", layer="Neighbourhoods")
RoadMap = readOGR(dsn ="data/TO_CenterLine", layer ="CENTRELINE_WGS84")
# 
#generating data
EnviroData <- "./data/wb_env.xlsx"
HealthData <- "./data/wb_health.xlsx"
SocialData <- "./data/social_housing_density.xlsx"
EnviroSet <- read_excel(EnviroData, sheet = 3)
HealthSet <- read_excel(HealthData, sheet = 3, cell_rows(2:142))
# 
head(TorontoMap@data)
nrow(TorontoMap)
nrow(EnviroSet)
nrow(HealthSet)
# 
class(TorontoMap$FIELD_5)
TorontoMap$FIELD_5 <- as.numeric(TorontoMap$FIELD_5)
class(EnviroSet$`Neighbourhood Id`)
# 
bigdf <- left_join(EnviroSet, HealthSet, by = c('Neighbourhood Id' = 'Neighbourhood Id'))
bigdf <- left_join(bigdf, SocialData, by = c('Neighbourhood Id' = 'Neighbourhood'))
# 
TorontoMap@data <- left_join(TorontoMap@data, bigdf, by = c('FIELD_5' = 'Neighbourhood Id'))
# 
# #Plotting
# library(tmap)
plot(TorontoMap)
plot(RoadMap)
colnames(TorontoMap@data)[18] <- "Preg"
qtm(TorontoMap, "Pollutants Released to Air")
