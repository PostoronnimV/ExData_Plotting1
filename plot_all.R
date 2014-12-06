require(data.table)
require(lubridate)

## Getting data
Sys.setlocale( category = "LC_TIME", locale = "en_US.UTF-8")

colClasses <-c(rep("character",9))
raw_data <- fread(unzip("exdata-data-household_power_consumption.zip"),
              colClasses=colClasses)
work_data <- raw_data[raw_data$Date %in%c("1/2/2007","2/2/2007"),]
work_data$Date_time <- dmy_hms(paste(work_data$Date,work_data$Time))

## plot1 Global Active Power
png(file="plot1.png",width=480,height=480)
work_data$Global_active_power <- as.numeric(work_data$Global_active_power)
hist(work_data$Global_active_power,
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power") 
dev.off()

## plot2 
work_data$Global_active_power <- as.numeric(work_data$Global_active_power)
png(file="plot2.png",width=480,height=480)
plot(work_data$Date_time,work_data$Global_active_power,
          type="l",
          ylab = "Global Active Power (kilowatts)",
          xlab = "")
dev.off()  

## plot3 
work_data$Sub_metering_1 <- as.numeric(work_data$Sub_metering_1)
work_data$Sub_metering_2 <- as.numeric(work_data$Sub_metering_2)
work_data$Sub_metering_3 <- as.numeric(work_data$Sub_metering_3)
png(file="plot3.png",width=480,height=480)
plot(work_data$Date_time,work_data$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering")
lines(work_data$Date_time,work_data$Sub_metering_2, type="l", col= "red")
lines(work_data$Date_time,work_data$Sub_metering_3, type="l", col= "blue")
legend("topright",
       c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),lty=1)
dev.off() 

## plot4
work_data$Global_active_power <- as.numeric(work_data$Global_active_power)
work_data$Sub_metering_1 <- as.numeric(work_data$Sub_metering_1)
work_data$Sub_metering_2 <- as.numeric(work_data$Sub_metering_2)
work_data$Sub_metering_3 <- as.numeric(work_data$Sub_metering_3)
work_data$Voltage <- as.numeric(work_data$Voltage)
work_data$Global_reactive_power <- as.numeric(work_data$Global_reactive_power)

png(file="plot4.png",width=480,height=480)

par(mfrow=c(2,2))
# 4/1
plot(work_data$Date_time,work_data$Global_active_power,
     type="l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")

# 4/2
plot(work_data$Date_time,work_data$Voltage,
     type="l",
     ylab = "Voltage",
     xlab = "datetime")

# 4/3
plot(work_data$Date_time,work_data$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering")
lines(work_data$Date_time,work_data$Sub_metering_2, type="l", col= "red")
lines(work_data$Date_time,work_data$Sub_metering_3, type="l", col= "blue")
legend("topright",
       c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),lty=1,bty="n")

# 4/4
plot(work_data$Date_time,work_data$Global_reactive_power,
     type="l",
     ylab = "Global_reactive_power",
     xlab = "datetime")

dev.off() 


