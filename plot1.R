## read in the csv data file, identify ? as NA, give classes to columns
## change Date format
## subset the data by the two dates given 
power = read.csv("household_power_consumption.txt", sep=";",na.strings = "?", colClasses = c(rep("character",2),rep("numeric",7)))
power$Date = as.Date(power$Date,format = "%d/%m/%Y")
power.plot = subset(power, Date >= "2007-02-01" & Date <= "2007-02-02")

## create histogram
## save the plot as a png file
hist(power.plot$Global_active_power,col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
par(bg=NA)
dev.print(png, width = 480, height = 480, units = "px",file = "plot1.png")
dev.off()
