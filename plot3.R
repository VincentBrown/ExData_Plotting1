library(sqldf)

plot3  <- function() {
  mydata <- read.csv.sql("household_power_consumption.txt", sql= "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", header = TRUE,sep = ";",stringsAsFactors = FALSE)
  fulltime <- paste(mydata$Date, mydata$Time)
  mydata$Date <- strptime(mydata$Date,"%d/%m/%Y")
  mydata$Time <-  strptime(fulltime, format = '%d/%m/%Y %H:%M:%S')
  png(filename="plot3.png",width = 480, height = 480)
  with(mydata,plot(Time,Sub_metering_1,type="l",ylab=("Energy sub metering")))
  with(mydata,points(Time,Sub_metering_2,type="l",col="RED"))
  with(mydata,points(Time,Sub_metering_3,type="l",col="BLUE"))
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("BLACK","RED","BLUE") ,lwd=1)
  dev.off()
}