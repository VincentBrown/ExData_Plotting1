library(sqldf)

plot2  <- function() {
  mydata <- read.csv.sql("household_power_consumption.txt", sql= "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", header = TRUE,sep = ";",stringsAsFactors = FALSE)
  fulltime <- paste(mydata$Date, mydata$Time)
  mydata$Date <- strptime(mydata$Date,"%d/%m/%Y")
  mydata$Time <-  strptime(fulltime, format = '%d/%m/%Y %H:%M:%S')
  png(filename="plot2.png",width = 480, height = 480)
  with(mydata,plot(Time,Global_active_power,ylab="Global Active Power (kilowatts)",type="l"))
  dev.off()
}