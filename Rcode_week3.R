#rcode week 3

sat <- read.csv("active-satellites.csv")
str(sat)

head(sat)

#print the first 3 rows
sat[1:3,]
#print the variable names
names(sat)

#taking a look at the first few values of period..minutes
sat$Period..Minutes.[1:3]

#check if these are characters
is.character(sat$Period..Minutes.)

#this will cause a NAs warning
sat$PeridMin <- as.numeric(sat$Period..Minutes.)

#find which characters are NA
sat$Period..Minutes.[is.na(sat$PeriodMin)]

#fix this data, the process of data cleaning
sat$PeriodMin[sat$Period..Minutes.=="8 days"] <- 8*24*60


#now lets calculate the mean period
mean(sat$PeriodMin) #we getting NA because of the values. 
#let's exclude these values by removing NAs before giving
#Periods to mean()
mean(sat$PeriodMin[!is.na(sat$PeriodMin)])

#or use ask mean() to remove NAs for us
mean(sat$PeriodMin, na.rm=TRUE)

#let's plot a simple barplot!
barplot(table(sat$Launch.Site))

#graph does not look that good, we only have some labels, and also good to have these in order of increasing number of launches
#get at able of numbers of launches by site
tablaunch <- table(sat$Launch.Site)

#sort it into increasing order
tablaunch <- sort(tablaunch)
#draw a barplot, rotate the names, and reduce font size
barplot(tablaunch, las=2, cex.names=0.4)

#check for the 5 biggest launch sites
rev(tablaunch)[1:5]

#functions quick overview
square <- function(x) {
  #square the value
  return(x^2)
}

#implement the function and square 2
square(x=2)
#alternatively we can do this:
square(2)

#here we can square a scalar
aa <-6
square(aa)

aa <- c(1,4,5)
square(aa)



#square the elements of the array
aa <- array(c(1,4,5,3,3,3), dim=c(3,2))
square(aa)


#check the arguments of square()
#this will output null
args(square)

#args median has one default argument
args(median)

v <- c(3, 4, NA, 10)
v


#any math operation involving NA gives NA, so this result isn't helpful.
# we can get R to ignore the missing value, so we can call median in various ways
median(v, TRUE)

#positional matching of the arguments
#we can write more readable code and be explicit about these arguments by naming them
median(x=v, na.rm=TRUE)

#now this is called explicit matching, then the order doesnt matter
median(na.rm=TRUE, x=v)

#in many R functions, there are one or two arguments that are required, followed
#By a whole lot of optional arguments
args(legend)


#in these circumstances what is often done is that we use positional matching for
#the firt required arguments which occupy the first argument slots
#then explicit matching using names for the rest
median(v, na.rm=TRUE)

#R allows you to be a little lazy when specifying argument names
## The following are all valid
median(v, n=TRUE)
median(v, na=TRUE)
median(v, na.=TRUE)
median(v, na.r=TRUE)
median(v, na.rm=TRUE)
#but its best to write out the full name of every argument

#if you were to define an object with any of these names, R would break 
#these are reserved words and names
?reserved

#this will cause an error and break R
Inf <- 5

#but with lower case i, this will not happen
inf <- 5
inf

#scope
#sqrt is not a reserved word, so we can define it
sqrt <- 6
sqrt

#but to execute the sqrt function, we have to use brackets
sqrt(10)

#but in reality we can define a function called sqrt and have it do whatever
#sqrt <- function(x) {
 # return(x+2)
#}
#but this is not good so better to not create a function with the same word

#the search() function will give a hierarchy of global environments
search()

#we can see the set of objects in Global Environment using the ls() command
ls()

#to see the contents of package:base, we can see:
ls("package:base")

#if a reserved function is buried then we can use base:: to call it
base::sqrt(4)


