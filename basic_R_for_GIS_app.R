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
 #' https://github.com/daromero-88/Basic-R-for-GIS-applications
 #' 
 #' Endless other resources... 
 #' 
  

  
# 1. Explore the basics of R as a programming language -----------------------------------

# 1.1. A common language in R-----------------------------------

#Objects

a = 1

a =  1, 2, 3 #error, complex 'c()' object not defined, never forget to actually READ THE ERROR screen

a = c(1, 2, 3)

class(a) #this function tells you what is happending with the code 
#numeric vector

b = tttt #error, no character defined

b = 'Hello World' #characters go with quotes

b = 'a', 'b', 'c' #error no complex object defined

b = c('a', 'b', 'c')

class (b) 
#character vector 

c = c (1, 'b', 'c')
class (c)

#character, in this case, 1 is an element 

list1 = list (a, b, c)
class (list1)


#Subsetting: 
cc = c(2000:4000)

cc[1] #subset to obtain the first element 
cc[2] #subset to obtain the second element 
cc[10:20] #subsetting the numeric vector cc to obtain the elementes from 10 to 20


cc[which (cc== 2090)] #subset by using logical paramaters: '==' is the way to tell R: EQUALS, because the normal '=' is used to defined objects


# 1.2. In build functions, operations -----------------------------------

#Numeric vectors: 

e = 1001:2000
f = 1:1000

length(e)
length(f)

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

#1.3. Creatig data: Dataframes and matrices-----------------------------
#Check section 2 before analyzing section 1.2
c1 = rnorm (100, 5, 2) #creates a numeric vector with a random distribution with mean = 5 and standard deviation = 2
hist (c1) #create a histogram 
plot (c1) #create a plot of the points (notice the difference between histogram and plot)
plot (sort(c1)) #same plot with sorted data via the function sort

c2 = sample (1:1000,100, replace = T) #creates a numeric vector using a sample 
hist (c2) #histogram 
plot (c2) #plot

c3 = runif (100, 0.1, 5) #function to create a uniform distributioon 
hist (c3) #histogram 

df1 = data.frame (cbind (c1, c2, c3)) #create a dataframe with the objects previously created
class (df1) #checking the object

colnames (df1) = c('First', 'Second', 'Third') #adding names to the columns in the dataframe
head (df1) #checking the first 6 objects in the dataframe
tail (df1) #checking the last 6 objects in the dataframe

#' Dataframe focus on columns as variables and rows as observations
#' 
#' 
#' On the contrary, matrices focus on the distriibution of the data itself, 
#' columns and rows define information by cell and do not respect the order column = 
#' variable and row = observation as in dataframes. 

m1 = matrix (ncol = 10, nrow = 10, sample (1:20,100, replace = T)) #function matrix which is respective arguments allows the creation of different columns and rows 


#Subsetting matrices and dataframes: 

df1$Second #the operator '$' allows the selection of an entire column 

df1[,2] #square brackets allow the subsetting, in this case of the second column 

df1[1,1] #select the element defined by the indexes of the column and row, in this case first row and first column 

df1[1:5,3] #select the first 5 rows from the third column 

df1[3, 1:3] #select the third element from columns 1 to 3 

df1[3,] #select the entire third row 


#2. Anatomy of a function -----------------------------------

#function sample
j = sample (1:100, 300, replace = T) #check help 

#function runif
k = runif (10, 1.52, 2.80) #check help 

#function round
l = round (19/456, 2) #check help 

#function 
length(e) #check help 

#function plot 
plot (j) #check help 

plot (j, main = 'Example', pch = 16, 
      cex = 1.3, col = 'red', 
      ylab = 'EXAMPLE Y AXIS')

#' each function comes with a particular set of arguments that change
#' depending on the developer of the function... you can see this by comparing 
#' sample and runif... both basically create numeric vectors with random numbers 
#' but each argument should be called inside the function... 

#about color: 
col1 = c('yellow', 'red') #vector of two colors as defined in: http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf
#there are A LOT OF COLORS AVAILABLE! 

pale1 = colorRampPalette(col1) #function colorRampPalette will create a ramp between the colors presented 

plot (j, main = 'Example', pch = 15, cex = 0.9, col = pale1(5)) #check the plot with your own palette


#2.1. Most important function ever: DEFINE WORKING DIRECTORY------------------

#' This function allows the user to select a folder in their computer to add any particular 
#' output outside R memory. Also from here, elements can be read it to R.  

setwd ('/Users/daniel/Documents/GitHub/Basic-R-for-GIS-applications') #add the corresponding path in your computer 

getwd #this one tells you where is the current directory 


#####SUMMARY: 1 and 2#####

#' R and R studio have a large community of support on internet and we must take the advantage of 
#' this strength, make sure to google all your problems. 
#' It is a language and as so, you need to learn its syntax and vocubulary, for example, 
#' respect lower/upper cases.
#' There are multiple objects in R, usually the objects determine what is happening, 
#' in doubt, use class(THE OBJECT).
#' Functions are embebed codes that allows the user to automatize operations, 
#' don't forget to look functions in the HELP section.
#' Dataframes and matrices are complex objects that allows the storage of 
#' higher level of complexity than vectors. 
#' 

#3. GIS objects I: Polygons -----------------------------------

#3.1. Packages and libraries---------------------------------------------

install.packages('raster') #manipulation of raster files 
install.packages('sp') #manipulation of shape files (POLYGONS)
install.packages('rgeos') #manipulation of GIS data 
install.packages('rgdal') #manipulation of GIS data 
install.packages('mapdata') #manipulation of GIS data 
install.packages('maptools') #in-build maps and geographical information. 

#' Another way to install everything can be to define a vector of characters
#' with all the packages that we need for any particular excercise. 

#pcks = c('raster', 'sp', 'rgeos', 'rgdal', 'maptools', 'mapdata') 
#install.packages(pcks)

#...etc

#The following lines will activate the packages installed 
library(raster)
library(sp)
library(rgeos)
library (rgdal)
library (maptools)
library(mapdata)


#3.2. Spatial Polygons with  'World Simple'-------------------------

data("wrld_simpl", package = "maptools") #this will call the simplified map from maptools package
plot (wrld_simpl) #checking the whole world 

class (wrld_simpl) #SpatialPolygonsDataFrame object! 

#by calling the object you can see that it has multiple elements: 
wrld_simpl

#among them: 
#' features: number of rows in the polygon dataframe
#' extent: square defining the space of the polygon 
#' crs: projection (planar, UTM, etc)
#' variables: number of columns in the polygon dataframe

crs(wrld_simpl) #checking the projection of the object using function crs
WGS84 = crs(wrld_simpl) # defining a character vector with the polygon projection



plot (wrld_simpl) #checking the whole world 
zoom(wrld_simpl, ext=drawExtent(), new=TRUE, useRaster=TRUE) #zooming on the world polygon 

plot (wrld_simpl) #checking the whole world 
e = drawExtent() #manually selection a portion of the map using a square 

cp1 = as (extent(e), 'SpatialPolygons') #transforming our square in an actual Spatial Polygon 

mp1 = crop (wrld_simpl, cp1) #cropping the map with the just created Spatial Polygon 
plot (mp1) #plotting the new portion of the map 

#we can write this new shape file in our computer: 

writeOGR(mp1, layer= 'mp1', dsn = 'shapes1', driver = 'ESRI Shapefile') #check help 

#' notice the arguments of this function
#' layer: name of the output shape file 
#' dsn: name of a folder that is going to be created where this shapefile will be saved
#' drive: define the typical shapefile class 

#' now you can check the folder 'shapes1' that is inside the folder of your working directory, 
#' and there you will find the shapefile you just created...notice that it has different files
#' a normal shapefile usually is defined by the shape itself (.shp) together with the projection 
#' (.prj), dataframe (.dbf), and index of the shape (.shx)
#' 

#we can read the shapefile that we just created as follows: 

ex1 = readOGR ('./shapes1/mp1.shp') #defining an object using the path of the .shp file extension 
plot (ex1, col = 'grey', main = 'Reading maps') #we can plot the polygon with a particular color and title


#we can further explore the elements of the dataframe of the polygon as follows: 
wrld_simpl@data #notice the '@' operator, this allows you to explore the objects inside spetial objects such as Spatial Polygons

class(wrld_simpl@data) #by adding @data, we can see that it is a dataframe...

View (wrld_simpl@data) #the function View allows the user to see the polygon as an excel table, so super useful! 

head (wrld_simpl@data) #watch the first six elements of the dataframe

#3.2.1 Subsetting polygons via its dataframe -----------------------

names (wrld_simpl@data) #check the names that define the columns of the dataframe

wrld_simpl@data$NAME #use the operator $ to select the information in the column NAME
#this show you all the countries defined in the dataframe of the shapefile 

#function subset: 
count1 = subset (wrld_simpl, NAME == 'Ecuador') 
plot (count1)

count2 = subset (wrld_simpl, NAME == 'United States')
plot (count2)

#subset by expressions: 

names (wrld_simpl@data)

plot (wrld_simpl@data$AREA) #this will create a plot with the data storaged in the AREA column

exp1 = subset (wrld_simpl, AREA>500000) #we can obtain only the countries with an area larger than 500000
plot (exp1)

plot (sort (wrld_simpl@data$POP2005)) #here we can use the column POP2005 in order to explore this data further

exp2 = subset (wrld_simpl, POP2005>1.1e+09) #here we are selecting those countries with a population larger than 1.1e+09
plot (exp2) #of course, India and China! 

#write shapefile: 
writeOGR(exp2, layer= 'exp2', dsn = 'shapes2', driver = 'ESRI Shapefile') #we can write our second shape 


#3.2.1 Downloading and manipulating reliable shape files ----------------------- 

#' Open access and very detailed, the shape files from Natural Earth have 
#' become very popular for any GIS application: 
  
download.file("https://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/cultural/ne_10m_admin_0_countries.zip", 
              destfile = 'countries.zip') #download the zip file 

unzip(zipfile = "countries.zip", 
      exdir = './countries_test') #unzipping the file, in exdir you have to specify the folder name

world2 = readOGR ('./countries_test/ne_10m_admin_0_countries.shp') #reading the file 

class (world2) 
names (world2@data) #check the name of the variables of this dataframe 

View (world2@data) 

unique(world2$ADMIN) #information on the unique values of a column

am = subset (world2, CONTINENT =='South America' 
              | CONTINENT == 'North America') #subsetting based on the variable continent 
plot (am) #takes longer in plotting because it is far more detailed than the wrld_spl map

zoom(am, ext=drawExtent(), new=TRUE, useRaster=TRUE) #zooming on this raster


br1 = subset (world2, ADMIN == 'Brazil') #we can select any particular country 
plot (br1, col = 'grey', main = 'Brazil from Natural Earth')

#write shapefile: 
writeOGR(br1, layer= 'br1', dsn = 'shapes3', driver = 'ESRI Shapefile') #write the new country


#3. GIS objects II: Points -----------------------------------

#points in a map: 

pt_random = spsample (br1, n = 100, 'random') #this function will throw random points in the polygon of your selection 

class(pt_random) #is a spatial points object 

plot (br1)
points (pt_random, pch= 3, cex = 0.7, col= 'red') #plotting the points in the map 

#writing points 
write.csv (pt_random@coords, 'test1.csv', row.names = F) #writing the points as a csv file 


#NEXT EXCERCISES ---------------------------------------

#' csv files 
#' reading csv files 
#' decimal cooordinates 
#' 

#4. GIS objects III: Rasters -----------------------------------

#what is a raster
#creating rasters 
#exporting rasters
#importing rasters

#raster stacks

