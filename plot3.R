## Reads the data as character
data<-read.table("household_power_consumption.txt",sep = ";",header = TRUE, colClasses = "character")

## Set the Date as data class
data$Date <- as.Date(data$Date,"%d/%m/%Y")

## Take 2 days from February 2007
days2<- data[data$Date==as.Date("2007-02-01")|data$Date==as.Date("2007-02-02"),,drop=FALSE]

## Convert Time to POSIXct calss
days2$Time<-as.POSIXct(paste(days2$Date,days2$Time),"%Y-%m-%d %H:%M:%S", tz = "America/New_York")

## Plot all Energy sub metering in a png file
png(filename = "plot3.png", width = 480, height = 480, units = "px")

plot(days2$Time,days2$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")
lines(days2$Time,days2$Sub_metering_2, col ="red")
lines(days2$Time,days2$Sub_metering_3, col ="blue")

legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,col=c("black","red","blue"))

dev.off()