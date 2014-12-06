require(data.table)
require(lubridate)

## Getting data
Sys.setlocale( category = "LC_TIME", locale = "en_US.UTF-8")

colClasses <-c(rep("character",9))
raw_data <- fread(unzip("exdata-data-household_power_consumption.zip"),
                  colClasses=colClasses)
work_data <- raw_data[raw_data$Date %in%c("1/2/2007","2/2/2007"),]
work_data$Date_time <- dmy_hms(paste(work_data$Date,work_data$Time))

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