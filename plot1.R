df<-read.delim("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
#subset the data frame to required dates only.

# Note on date subsetting.
# Date in the data is a set of characters, also note that the data has the date in d/m/yyyy format.
# so first converrt the date from chaacter to a date object and then match that with 
# the object of same type. Use the as.Date() function to convert. 
# Dates can have various formats, so use the format type variable in as.Date() to help 
# the function understand the format of the string it is converting. e.g. %d/%m/%y 
# is used for date of the type 29/02/76 while %d/%m/%y format should be used to specify formats
# like 29/02/1976.


df_subset<-df[(as.Date(df$Date,format="%d/%m/%Y") == as.Date('1/2/2007',format="%d/%m/%Y")) | 
              (as.Date(df$Date,format="%d/%m/%Y") == as.Date('2/2/2007',format="%d/%m/%Y")),]

# Draw a hostogram
hist(df_subset$Global_active_power,col='red',xlab='Global Active Power (kilowatts)',
     main="Global Active Power")
#title(main="Global Active Power")

# Save to a png file of size 480*480
dev.copy(png, file = "plot1.png", width=480,height=480) 
dev.off()
