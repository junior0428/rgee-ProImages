#install packages 
install.packages('googledrive')
install.packages('rgee') 

library(googledrive)
library(rgee)

# rtools
Sys.which('make')

#install packages of rgee
ee_install()

#initializing rgee 
ee_Initialize('juniorcalvo')

ee_users()
#clean a credentials
ee_clean_credentials('junior')

#loading a satellite image collection of GEE

coll <-ee$ImageCollection('LANDSAT/LC08/C01/T1_TOA')$ 
  filterDate('2019-04-01','2020-06-30')$
  filterBounds(ee$Geometry$Point(-76.68,-8.65))$ 
  filterMetadata('CLOUD_COVER','less_than',10)

ee_get_date_ic(coll)
#loading a satellite image of GEE
l8<-'LANDSAT/LC08/C01/T1_TOA/LC08_008066_20200610' %>% 
  ee$Image() %>%
  ee$Image$select(c('B6', 'B5', 'B4'))

#display
Map$centerObject(l8)
Map$addLayer(l8)
