# Golbal environment: code needed for both ui and server scripts
library(dplyr)
# Load data
UN <- read.csv("Data/IdealPoints_smallset.csv", stringsAsFactors=F)
#UN <- UN[complete.cases(UN),]
#^not necessary- all cases are complete in this ex.. 
#can be added for more complex ex.
Ideal_Point_Data <- UN

#Source needed to create plotly graph-used in all "global" scripts
source("plotlyGraphWidget.R")
