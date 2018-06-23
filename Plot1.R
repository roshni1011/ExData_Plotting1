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

#create png file with plot
png("Plot1.png", width = 480, height = 480)
hist(data$Global_active_power, 
     main = "Global Active Power", 
     col = "Red", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency")
dev.off()
