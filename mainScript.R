x <- c("sp", "ggmap", "rgdal", "rgeos", "maptools", "dplyr", "tidyr", "tmap", "tidyverse", "ggplot2")
install.packages(x)
lapply(x, library, character.only = TRUE)
# 
# 
# #reading maps
# library(readxl)
# library(rgdal)
# TorontoMap = readOGR(dsn = "data", layer="NEIGHBORHOODS_WGS84")
# 
# #generating data
# EnviroData <- "./data/WB-Environment.xlsx"
# HealthData <- "./data/WB-Health.xlsx"
# EnviroSet <- read_excel(EnviroData, sheet = 3)
# HealthSet <- read_excel(HealthData, sheet = 3, cell_rows(2:142))
# 
# head(TorontoMap@data)
# nrow(TorontoMap)
# nrow(EnviroSet)
# nrow(HealthSet)
# 
# class(TorontoMap$AREA_S_CD)
# TorontoMap$AREA_S_CD <- as.numeric(TorontoMap$AREA_S_CD)
# class(EnviroSet$`Neighbourhood Id`)
# 
# bigdf <- left_join(EnviroSet, HealthSet, by = c('Neighbourhood Id' = 'Neighbourhood Id'))
# 
# TorontoMap@data <- left_join(TorontoMap@data, bigdf, by = c('AREA_S_CD' = 'Neighbourhood Id'))
# 
# #Plotting
# library(tmap)
# plot(TorontoMap)
# colnames(TorontoMap@data)[18] <- "Preg"
# qtm(TorontoMap, "Green Rebate Programs")
