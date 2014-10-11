library(sqldf)

plot4  <- function() {
  mydata <- read.csv.sql("household_power_consumption.txt", sql= "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", header = TRUE,sep = ";",stringsAsFactors = FALSE)
  fulltime <- paste(mydata$Date, mydata$Time)
  mydata$Date <- strptime(mydata$Date,"%d/%m/%Y")
  mydata$Time <-  strptime(fulltime, format = '%d/%m/%Y %H:%M:%S')
  png(filename="plot4.png",width = 480, height = 480)
  par(mfcol = c(2,2))
  with(mydata,plot(Time,Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",type="l"))
  with(mydata,plot(Time,Sub_metering_1,type="l",ylab=("Energy sub metering"),xlab=""))
  with(mydata,points(Time,Sub_metering_2,type="l",col="RED"))
  with(mydata,points(Time,Sub_metering_3,type="l",col="BLUE"))
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("BLACK","RED","BLUE") ,lwd=1,bty="n")
  with(mydata,plot(Time,Voltage,type="l",xlab="datetime"))
  with(mydata,plot(Time,Global_reactive_power,type="l",xlab="datetime"))
  dev.off()
}