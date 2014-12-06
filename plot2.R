require(data.table)
require(lubridate)

## Getting data
Sys.setlocale( category = "LC_TIME", locale = "en_US.UTF-8")

colClasses <-c(rep("character",9))
raw_data <- fread(unzip("exdata-data-household_power_consumption.zip"),
                  colClasses=colClasses)
work_data <- raw_data[raw_data$Date %in%c("1/2/2007","2/2/2007"),]
work_data$Date_time <- dmy_hms(paste(work_data$Date,work_data$Time))

## plot2 
work_data$Global_active_power <- as.numeric(work_data$Global_active_power)
png(file="plot2.png",width=480,height=480)
plot(work_data$Date_time,work_data$Global_active_power,
     type="l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")
dev.off()  
