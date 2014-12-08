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

# X-Axis is Time for 2 choosen days. Format to DataAndtime Object that can 
# be used by the plot functions.
time<-paste(df_subset$Date,df_subset$Time)
df_subset$Time<-strptime(time,"%d/%m/%Y %H:%M:%S")

plot(df_subset$Time,df_subset$Global_active_power,"l",xlab="",ylab="Global Active Power(kilowatt)")

# Save to a png file of size 480*480
dev.copy(png, file = "plot2.png", width=480,height=480) 
dev.off()
