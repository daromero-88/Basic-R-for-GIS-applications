#####BASIC R FOR GEOGRAPHICAL INFORMATION SYSTEM APPLICATIONS######

--------------------------------------------------------
  #'  Author: Daniel Romero-Alvarez
  #                
  #'  Script to:
  #'  0. Resources 
  #'  1. Explore the basics of R as a programming language
  #'  2. Anatomy of a function
  #'  3. GIS objects I: Polygons 
  #'  4. GIS objects II: Points
  #'  5. GIS objects III: Rasters
  #'  

--------------------------------------------------------
  
# 0 Resources --------------------------------------------
 #' Mike Marin tutorials: 
 #' https://www.youtube.com/channel/UCaNIxVagLhqupvUiDK01Mgg
 #' 
 #' John Starmer = STATQUEST 
 #' https://www.youtube.com/user/joshstarmer 
 #' 
 #' StackOverflow 
 #' How do I do a loop in R? 
 #' https://stackoverflow.com/questions/50252721/how-do-i-do-a-loop-using-r
 #' 
 #' Github
 #' https://github.com/
 #' 
 #' Github desktop 
 #' https://desktop.github.com/
 #' 
 #' Code repository: 
 #' 
 #' 
 #' Endless other resources... 
 #' 
  

  
# 1. Explore the basics of R as a programming language -----------------------------------

# 1.1. A common language in R-----------------------------------

#Objects

a = 1

a =  1, 2, 3 #error, complex 'c()' object not defined

a = c(1, 2, 3)

class(a) 
#numeric vector

b = tttt #error, no character defined

b = 'b' #characters go with quotes

b = 'a', 'b', 'c' #error no complex number

b = c('a', 'b', 'c')

class (b) 
#character vector 

c = c (1, 'b', 'c')
class (a)
#character, in this case, 1 is an element 

list1 = list (a, b, c)
class (list1)


#Subsetting: 
cc = c(2000:4000)

cc[1]
cc[2]
cc[10:20]

cc[which (cc== 2090)]

#1.2. Creatig data: Dataframes and matrices-----------------------------

c1 = rnorm (100, 5, 2)
hist (c1)
plot (c1)
plot (sort(c1))

c2 = sample (1:1000,100, replace = T)
hist (c2)
plot (c2)

c3 = runif (100, 0.1, 5)
hist (c3)

df1 = data.frame (cbind (c1, c2, c3))
class (df1)

colnames (df1) = c('First', 'Second', 'Third')
head (df1)
tail (df1)

#Dataframe focus on columns as variables and rows as observations

m1 = matrix (ncol = 10, nrow = 10, sample (1:20,100, replace = T))

#structure of the information, it can be a square, a line, a rectangle, etc...columns and rows are not variables and observations


#Subsetting: 

df1$Second

df1[,2]

df1[1,1]

df1[1:5,3]

df1[3, 1:3]

df1[3,]




# 1.3. In build functions, operations -----------------------------------

#Numeric vectors: 

e = 1001:2000
f = 1:1000

class(e)

g = e+f
g = e*f
g = e/f
g = log (e)-log(f)


mean (e)

h = mean (e)
i = sd (e)

h+i

summary (e)

setwd ('/Users/daniel/Documents/GitHub/Basic-R-for-GIS-applications')
getwd

#2. Anatomy of a function -----------------------------------

#function sample
j = sample (1:10, 20, replace = T) #check help 

#function runif
k = runif (10, 1.52, 2.80) #check help 

#function round
l = round (19/456, 4) #check help 

#function 
length(e)

#function plot 
plot (j)

plot (j, main = 'Example', pch = 15, cex = 0.9, col = 'red')

#about color: 
col1 = c('yellow', 'red')
pale1 = colorRampPalette(col1)

plot (j, main = 'Example', pch = 15, cex = 0.9, col = pale1(5))

#####SUMMARY: 1 and 2#####

#' R and R studio have a large community of support on internet and we must take the advantage
#' It is a language and as so, you need to learn its syntax and vocubulary 
#' There are multiple objects in R, usually the objects determine what is happening 
#' Functions are embebed codes that allows the user to automatize operations 
#' Dataframes and matrices are complex objects that allow the manipulation of data 
#' 

#3. GIS objects I: Polygons -----------------------------------

#3.1. Packages and libraries---------------------------------------------

install.packages('raster')
install.packages('sp')
install.packages('maptools')

#pcks = c('raster', 'sp', 'rgeos', 'rgdal', 'maptools', 'mapdata')
#install.packages(pcks)

#...etc

library(raster)
library(sp)
library(rgeos)
library (rgdal)
library (maptools)
library(mapdata)


#3.2. Spatial Polygons with  'World Simple'-------------------------

data("wrld_simpl", package = "maptools")
plot (wrld_simpl)


class (wrld_simpl) #SpatialPolygonsDataFrame


zoom(wrld_simpl, ext=drawExtent(), new=TRUE, useRaster=TRUE) #zooming on this raster


crs(wrld_simpl)

WGS84 = crs(wrld_simpl) # geographic projection
e = drawExtent() #manually selection a portion of the map

cp1 = as (extent(e), 'SpatialPolygons')

mp1 = crop (wrld_simpl, cp1)
plot (mp1)


cp2 = as(extent(-117.5538, -22.48155, -59.92064, 39.88928), 'SpatialPolygons') #selecting a portion of the map by coordinates
proj4string(cp2) = CRS(proj4string(wrld_simpl))

mp2 = crop (wrld_simpl, cp2)
plot (mp2)

wrld_simpl@data

class (wrld_simpl@data)

head (wrld_simpl@data)

#subsetting data- Dataframes in action: 

wrld_simpl@data$NAME

#function subset: 
count1 = subset (wrld_simpl, NAME == 'Ecuador')
plot (count1)

count2 = subset (wrld_simpl, NAME == 'United States')
plot (count2)

#subset by expressions: 

names (wrld_simpl@data)

plot (wrld_simpl@data$AREA)

exp1 = subset (wrld_simpl, AREA>500000)
plot (exp1)
plot (sort (wrld_simpl@data$POP2005))

exp2 = subset (wrld_simpl, POP2005>1.1e+09)
plot (exp2)

#write shapefile: 
writeOGR(exp2, layer= 'exp2', dsn = 'shapes1', driver = 'ESRI Shapefile')


#reading shapefiles: 

download.file("https://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/cultural/ne_10m_admin_0_countries.zip", 
              destfile = 'countries.zip') #download the zip file 

unzip(zipfile = "countries.zip", 
      exdir = './countries_test') #unzipping the file 

world2 = readOGR ('./countries_test/ne_10m_admin_0_countries.shp') #reading the file 

class (world2)
names (world2@data)

View (world2@data)

unique(world2$ADMIN) #information on the unique values of a column

am = subset (world2, CONTINENT =='South America' 
              | CONTINENT == 'North America')
plot (am)

zoom(am, ext=drawExtent(), new=TRUE, useRaster=TRUE) #zooming on this raster


br1 = subset (world2, ADMIN == 'Brazil')
plot (br1)

#write shapefile: 
writeOGR(br1, layer= 'br1', dsn = 'shapes2', driver = 'ESRI Shapefile')

#3. GIS objects II: Points -----------------------------------

#points in a map: 

pt_random = spsample (br1, n = 100, 'random')

class(pt_random)

plot (br1)
points (pt_random, pch= 3, cex = 0.7, col= 'red')

#writing points 
write.csv (pt_random@coords, 'test1.csv', row.names = F)


#NEXT EXCERCISES ---------------------------------------

#4. GIS objects II: Rasters -----------------------------------

#what is a raster
#creating rasters 
#exporting rasters
#importing rasters

#raster stacks

