## Reads the data as character
data<-read.table("household_power_consumption.txt",sep = ";",header = TRUE, colClasses = "character")

## Set the Date as data class
data$Date <- as.Date(data$Date,"%d/%m/%Y")

## Take 2 days from February 2007
days2<- data[data$Date==as.Date("2007-02-01")|data$Date==as.Date("2007-02-02"),,drop=FALSE]

## Convert Time to POSIXct calss
days2$Time<-as.POSIXct(paste(days2$Date,days2$Time),"%Y-%m-%d %H:%M:%S", tz = "America/New_York")

## Plot Global Active Power per Time in a png file
png(filename = "plot2.png", width = 480, height = 480, units = "px")

plot(days2$Time,days2$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()