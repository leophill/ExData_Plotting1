## Data Acquisition and Cleaning

fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="exdata_data_household_power_consumption.zip",method="curl")
mydata=read.csv2(unz("exdata_data_household_power_consumption.zip","household_power_consumption.txt"),sep=";",na.strings=c("?"),dec=".")

## Data Slicing

edata <- subset(mydata, as.Date(mydata$Date,"%d/%m/%Y") == as.Date("2007-02-01","%Y-%m-%d") | as.Date(mydata$Date,"%d/%m/%Y") == as.Date("2007-02-02","%Y-%m-%d"), dec=".", na.rm=TRUE)

x <- strptime(paste(edata$Date, edata$Time),format="%d/%m/%Y %H:%M:%S")
y <- edata$Global_active_power

## Opening png device

png(file="plot2.png", width = 480, height = 480)

## Drawing graph on png file device

plot(x, y, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## Closing png file device

dev.off()

