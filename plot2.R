## read in the csv data file, identify ? as NA, give classes to columns
## change Date format
## subset the data by the two dates given 
power = read.csv("household_power_consumption.txt", sep=";",na.strings = "?", colClasses = c(rep("character",2),rep("numeric",7)))
power$Date = as.Date(power$Date,format = "%d/%m/%Y")
power.plot = subset(power, Date >= "2007-02-01" & Date <= "2007-02-02")

## create the plot
## add the horizontal axis labels (done differently but gives the same plot)
plot(power.plot$Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)",xlab = "",lwd = 2,xaxt = "n")
axis(1, at=c(1,floor(nrow(power.plot)/2),nrow(power.plot)), lab=c("Thur","Fri","Sat"))
par(bg=NA)
dev.print(png, width = 480, height = 480, units = "px",file = "plot2.png")
dev.off()