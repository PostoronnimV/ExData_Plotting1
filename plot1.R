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