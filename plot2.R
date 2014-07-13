##################################################################
##
## Exploratory Data Analysis
## 
## Course Project 1: Electric Power Consuption
##
## Plot 2
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


## Convert to numeric the column to be plotted

data_new[,"Global_active_power"] <- as.numeric(data_new[,"Global_active_power"])


## Make the plot and save it to a png file

plot(data_new$Date_Time, data_new$Global_active_power, 
	type = "l",
	xlab = "",
	ylab = "Global Active Power (kilowatts)")


dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
