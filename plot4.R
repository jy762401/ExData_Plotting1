## read in the csv data file, identify ? as NA, give classes to columns
## change Date format
## subset the data by the two dates given power = read.csv("household_power_consumption.txt", sep=";",na.strings = "?", colClasses = c(rep("character",2),rep("numeric",7)))
power$Date = as.Date(power$Date,format = "%d/%m/%Y")
power.plot = subset(power, Date >= "2007-02-01" & Date <= "2007-02-02")

## create the plot
## put four plots in the file
par(mfcol = c(2, 2))
plot(power.plot$Global_active_power,type = "l",ylab = "Global Active Power",xlab = "",lwd = 2,xaxt ="n")
axis(1, at=c(1,floor(nrow(power.plot)/2),nrow(power.plot)), lab=c("Thur","Fri","Sat"))
plot(power.plot$Sub_metering_1, type = "l",ylab = "Energy sub metering",xaxt = "n",xlab = "")
lines(power.plot$Sub_metering_2, type="l",lwd = 2, col = "red")
lines(power.plot$Sub_metering_3, type="l",lwd = 2, col = "blue")
axis(1, at=c(1,floor(nrow(power.plot)/2),nrow(power.plot)), lab=c("Thur","Fri","Sat"))
legend("topright", col = c("black","blue","red"), legend = colnames(power.plot)[7:9],lty=1,cex=.75,bty="n")
axis(1, at=c(1,floor(nrow(power.plot)/2),nrow(power.plot)), lab=c("Thur","Fri","Sat"))
plot(power.plot$Voltage,type = "l",xlab = "datetime",ylab = "Voltage",xaxt = "n",lwd = 2)
axis(1, at=c(1,floor(nrow(power.plot)/2),nrow(power.plot)), lab=c("Thur","Fri","Sat"))
plot(power.plot$Global_reactive_power,type = "l",xlab = "datetime",ylab = "Global Reactive Power",xaxt = "n",lwd = 2)
axis(1, at=c(1,floor(nrow(power.plot)/2),nrow(power.plot)), lab=c("Thur","Fri","Sat"))

dev.print(png, width = 480, height = 480, units = "px",file = "plot4.png")
dev.off()