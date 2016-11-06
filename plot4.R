if(!require(lubridate)){
        install.packages("lubridate")
        library(lubridate)
}
power <- read.delim("household_power_consumption.txt", sep = ";", colClasses = "character")
pow.sset <- power[power$Date == "1/2/2007" | power$Date == "2/2/2007", ]
pow.sset$DateTime <- paste(pow.sset$Date, pow.sset$Time, sep = " ")
pow.sset$DateTime <- dmy_hms(pow.sset$DateTime)
pow.sset$Global_active_power <- as.numeric(pow.sset$Global_active_power)
png("plot2.png", 480, 480)
plot(pow.sset$DateTime, pow.sset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()