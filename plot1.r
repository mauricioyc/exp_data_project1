## Reads the data as character
data<-read.table("household_power_consumption.txt",sep = ";",header = TRUE, colClasses = "character")

## Set the Date as data class
data$Date <- as.Date(data$Date,"%d/%m/%Y")

## Take 2 days from February 2007
days2<- data[data$Date==as.Date("2007-02-01")|data$Date==as.Date("2007-02-02"),,drop=FALSE]

## Plot histogram in a png file
png(filename = "plot1.png", width = 480, height = 480, units = "px")

hist(as.numeric(days2$Global_active_power),col="red",xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")

dev.off()