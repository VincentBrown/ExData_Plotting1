library(sqldf)

plot1  <- function() {
  mydata <- read.csv.sql("household_power_consumption.txt", sql= "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", header = TRUE,sep = ";",stringsAsFactors = FALSE)
  mydata$Date <- strptime(mydata$Date,"%d/%m/%Y")
  mydata$Time <- strptime(mydata$Time,format = '%H:%M:%S')
  png(filename="plot1.png")
  hist(mydata$Global_active_power,col="RED",main = "Global Active Power",xlab="Global Active Power (kilowatts)")
  dev.off()
}