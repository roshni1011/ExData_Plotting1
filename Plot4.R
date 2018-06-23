#read in full dataset
data_full <- read.csv("household_power_consumption.txt", 
                      sep=";", 
                      header=TRUE,
                      stringsAsFactors=FALSE,
                      na.strings="?") 

#create a new file with a subset of the dates specified
data <- subset(data_full, Date=="1/2/2007"|Date=="2/2/2007") 

#free up space by removing the original dataset
rm(data_full) 

#format date and time stamps
data$Date_Time <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")

#create png file with plots
png("Plot4.png", width=480, height=480)

#mfrow used to fill plots row-wise
par(mfrow=c(2,2))

#plot(1,1) 
plot(data$Date_Time, data$Global_active_power, 
     ylab = "Global Active Power", 
     xlab="", 
     type="l")

#plot(1,2)
plot(data$Date_Time, data$Voltage, 
     ylab = "Voltage", 
     xlab="datetime", 
     type="l")

#plot(2,1)

#create plot with data of sub_metering_1 in blac
plot(data$Date_Time, data$Sub_metering_1, 
     ylab = "Energy sub metering", 
     xlab="", 
     type="l", 
     col="black")

#add data of sub_metering_2 in red
lines(data$Date_Time, data$Sub_metering_2, 
      col="red")

#add data of sub_metering_3 in blue
lines(data$Date_Time, data$Sub_metering_3, 
      col="blue")

#add legend without border
legend("topright", 
       lty=1, 
       bty="n",
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot(2,2)
plot(data$Date_Time, data$Global_reactive_power, 
     ylab = "Global_reactive_power", 
     xlab="datetime", 
     type="l")
dev.off()


