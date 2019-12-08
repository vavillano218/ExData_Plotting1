##Downloading dataset
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="./exdata.zip",method="curl")
data <- read.table(unz("exdata.zip", "household_power_consumption.txt"), header=T, sep=";")

##Reading and taking subset of data by row; formatting of time
newdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
dtime<-strptime(paste(newdata$Date, newdata$Time, sep=" ") , "%d/%m/%Y  %H:%M:%S") 

##Setting up variables for plotting
smeter1 <- as.numeric(newdata$Sub_metering_1)
smeter2 <- as.numeric(newdata$Sub_metering_2)
smeter3 <- as.numeric(newdata$Sub_metering_3)

##Plotting and sending to png
plot(dtime, smeter1, type="l", ylab = "Energy Submetering",  xlab= "")
lines(dtime, smeter2, type="l", col="red")
lines(dtime, smeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
png("plot3.png", width=480, height=480) 
dev.off()

