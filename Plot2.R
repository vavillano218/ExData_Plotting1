##Downloading dataset
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="./exdata.zip",method="curl")

##Reading and taking subset of data by row
data <- read.table(unz("exdata.zip", "household_power_consumption.txt"), header=T, sep=";")
newdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##Setting up variables for plotting
dtime<-strptime(paste(newdata$Date, newdata$Time, sep=" ") , "%d/%m/%Y  %H:%M:%S") 
globalactivepower <- as.numeric(newdata$Global_active_power)

##Plotting and sending to png
plot(dtime, globalactivepower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
png("plot2.png", width=480, height=480) 
dev.off()

