df<-read.delim("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
#subset the data frame to required dates only.

# Note on date subsetting.
# Date in the data is a set of characters, also note that the data has the date in d/m/yyyy format.
# So first converrt the date from character to a date object and then match that with 
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

#Open a deviceof type png.
png(file="plot4.png", height=480, width=480)

#Separate the space to a 2 * 2 grid and in each grid place the relevant plot
par(mfrow=c(2,2))
with(df_subset, {
  plot(Time,Global_active_power,"l",xlab="",ylab="Global Active Power")
  plot(Time,Voltage, "l", xlab="datetime", ylab="Voltate")
  {
    plot(Time,Sub_metering_1, "l", xlab="", ylab="energy Sub metering", col="black") 
    lines(Time,Sub_metering_2,col="red")
    lines(Time,Sub_metering_3, col="blue")
    legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1), lwd=c(2.5,2.5), 
             col= c("black", "red", "blue"))
  }
  plot(Time,Global_reactive_power,"l",xlab="datetime", ylab="Global_reactive_power")
})

dev.off()

# Checkout the cool graphs!! :-)