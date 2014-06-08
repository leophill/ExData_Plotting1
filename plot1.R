## Data Acquisition and Cleaning

fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="exdata_data_household_power_consumption.zip",method="curl")
mydata=read.csv2(unz("exdata_data_household_power_consumption.zip","household_power_consumption.txt"),sep=";",na.strings=c("?"),dec=".")

## Data Slicing

edata <- subset(mydata, as.Date(mydata$Date,"%d/%m/%Y") == as.Date("2007-02-01","%Y-%m-%d") | as.Date(mydata$Date,"%d/%m/%Y") == as.Date("2007-02-02","%Y-%m-%d"))
x <- as.numeric(edata$Global_active_power, dec=".", na.rm=TRUE)

## Opening png device

png(file="plot1.png", width = 480, height = 480)

## Drawing graph on png file device

hist(x, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")

## Closing png file device

dev.off()