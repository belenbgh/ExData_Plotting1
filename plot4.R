##################################################################
##
## Exploratory Data Analysis
## 
## Course Project 1: Electric Power Consuption
##
## Plot 4
##
##################################################################

## Read the data

data <- read.csv("household_power_consumption.txt", 
			sep = ";",
			colClasses = "character",
			na.strings = "?")

## Subset the data from the dates 2007-02-01 and 2007-02-02

data[ ,"Date"] <- as.Date(data[ ,"Date"], format = "%d/%m/%Y")
data_sub <- subset(data, data$"Date" >= "2007-02-01" & data$"Date" <= "2007-02-02")


## Make a new column with Date and Time columns and reformat it properly

data_new <-data_sub
data_new[ ,"Date_Time"] <- paste(data_sub$Date, data_sub$Time)

data_new$Date_Time <- strptime(data_new$Date_Time, format = "%Y-%m-%d %H:%M:%S")

Sys.setlocale(category = "LC_TIME", locale = "C")


## Convert to numeric the columns to be plotted

data_new$Global_active_power <- as.numeric(data_new$Global_active_power)
data_new$Global_reactive_power <- as.numeric(data_new$Global_reactive_power)
data_new$Voltage <- as.numeric(data_new$Voltage)
data_new$Sub_metering_1 <- as.numeric(data_new$Sub_metering_1)
data_new$Sub_metering_2 <- as.numeric(data_new$Sub_metering_2)
data_new$Sub_metering_3 <- as.numeric(data_new$Sub_metering_3)


## Make the plot and save it to a png file

par(mfrow = c(2,2))

with(data_new,{
	plot(data_new$Date_Time, data_new$Global_active_power, 
		type = "l",
		xlab = "",
		ylab = "Global Active Power (kilowatts)")

	plot(data_new$Date_Time, data_new$Voltage, 
		type = "l",
		xlab = "datetime",
		ylab = "Voltage")
	
	plot(data_new$Date_Time, data_new$Sub_metering_1, 
		type = "l",
		xlab = "",
		ylab = "Energy sub metering")
	lines(data_new$Date_Time, data_new$Sub_metering_2, col = "red")
	lines(data_new$Date_Time, data_new$Sub_metering_3, col = "blue")
	legend("topright", lty = c(1,1), bty = "n",
		col = c("black", "red", "blue"), 
		legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
	
	plot(data_new$Date_Time, data_new$Global_reactive_power, 
		type = "l",
		xlab = "datetime",
		ylab = "Global_reactive_power")
})

dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
