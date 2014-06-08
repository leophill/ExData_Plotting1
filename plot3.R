## Data Acquisition and Cleaning

fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="exdata_data_household_power_consumption.zip",method="curl")
mydata=read.csv2(unz("exdata_data_household_power_consumption.zip","household_power_consumption.txt"),sep=";",na.strings=c("?"),dec=".")

## Data Slicing

edata <- subset(mydata, as.Date(mydata$Date,"%d/%m/%Y") == as.Date("2007-02-01","%Y-%m-%d") | as.Date(mydata$Date,"%d/%m/%Y") == as.Date("2007-02-02","%Y-%m-%d"), dec=".", na.rm=TRUE)

x <- strptime(paste(edata$Date, edata$Time),format="%d/%m/%Y %H:%M:%S")
xvals <- c(x,x,x)
yvals <- c(edata$Sub_metering_1, edata$Sub_metering_2, edata$Sub_metering_3)

## Opening png device

png(file="plot3.png", width = 480, height = 480)

## Drawing graph on png file device

with (edata,{
      plot(xvals,yvals, type="n", xlab="",ylab="Energy sub metering")
      lines(x, edata$Sub_metering_1, col="black")
      lines(x, edata$Sub_metering_2, col="red")
      lines(x, edata$Sub_metering_3, col="blue")
      legend("topright",pch="-", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
      }
)

## Closing png file device

dev.off()

