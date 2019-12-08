##Downloading dataset
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="./exdata.zip",method="curl")

##Reading and taking subset of data by row
data <- read.table(unz("exdata.zip", "household_power_consumption.txt"), header=T, sep=";")
newdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##Plotting and sending to png
hist(as.numeric(newdata$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
png("plot1.png", width=480, height=480)
dev.off()


