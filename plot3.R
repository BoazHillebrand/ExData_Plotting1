if(!require(lubridate)){
        install.packages("lubridate")
        library(lubridate)
}
power <- read.delim("household_power_consumption.txt", sep = ";", colClasses = "character")
pow.sset <- power[power$Date == "1/2/2007" | power$Date == "2/2/2007", ]
pow.sset$DateTime <- paste(pow.sset$Date, pow.sset$Time, sep = " ")
pow.sset$DateTime <- dmy_hms(pow.sset$DateTime)
pow.sset$Global_active_power <- as.numeric(pow.sset$Global_active_power)
pow.sset$Sub_metering_1 <- as.numeric(pow.sset$Sub_metering_1)
pow.sset$Sub_metering_2 <- as.numeric(pow.sset$Sub_metering_2)
pow.sset$Sub_metering_3 <- as.numeric(pow.sset$Sub_metering_3)
png("plot3.png", 480, 480)
plot(pow.sset$DateTime, pow.sset$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(pow.sset$DateTime, pow.sset$Sub_metering_2, col = "red")
lines(pow.sset$DateTime, pow.sset$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
dev.off()