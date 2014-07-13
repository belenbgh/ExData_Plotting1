##################################################################
##
## Exploratory Data Analysis
## 
## Course Project 1: Electric Power Consuption
##
## Plot 1
##
##################################################################

## Read the data

data <- read.csv("household_power_consumption.txt", 
			sep = ";",
			colClasses = "character")


## Subset the data from the dates 2007-02-01 and 2007-02-02

data[ ,"Date"] <- as.Date(data[ ,"Date"], format = "%d/%m/%Y")

data_sub <- subset(data, data$"Date" >= "2007-02-01" & data$"Date" <= "2007-02-02")


## Convert to numeric the column to be plotted

data_sub[,"Global_active_power"] <- as.numeric(data_sub[,"Global_active_power"])


## Make the plot and save it to a png file

hist(data_sub$Global_active_power, 
	main = "Global Active Power", 
	col = "red",
	xlab="Global Active Power (kilowatts)",
	ylab = "Frecuency")

dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
