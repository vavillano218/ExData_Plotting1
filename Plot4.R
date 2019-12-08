##Downloading dataset
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="./exdata.zip",method="curl")

##Reading and taking subset of data by row, formatting time
data <- read.table(unz("exdata.zip", "household_power_consumption.txt"), header=T, sep=";")
newdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
dtime<-strptime(paste(newdata$Date, newdata$Time, sep=" ") , "%d/%m/%Y  %H:%M:%S") 

##Setting up variables for plotting
globalactivepower <- as.numeric(newdata$Global_active_power)
globalreactivepower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(newdata$Voltage)
smeter1 <- as.numeric(newdata$Sub_metering_1)
smeter2 <- as.numeric(newdata$Sub_metering_2)
smeter3 <- as.numeric(newdata$Sub_metering_3)

##Plotting and sending to png
par(mfrow = c(2, 2)) 
plot(dtime, globalactivepower, type="l", xlab="", ylab="Global Active Power", cex=0.4)
plot(dtime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(dtime, smeter1, type="l", ylab="Energy Submetering", xlab="")
lines(dtime, smeter2, type="l", col="red")
lines(dtime, smeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=3, col=c("black", "red", "blue"), bty="o")
plot(dtime, globalreactivepower, type="l", xlab="datetime", ylab="Global_reactive_power")
png("plot4.png", width=480, height=480)
dev.off()