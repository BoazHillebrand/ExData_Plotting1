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
pow.sset$Voltage <- as.numeric(pow.sset$Voltage)
pow.sset$Global_reactive_power <- as.numeric(pow.sset$Global_reactive_power)
png("plot4.png", 480, 480)
par(mfcol = c(2,2))

# upper-right plot
plot(pow.sset$DateTime, pow.sset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# lower-left plot
plot(pow.sset$DateTime, pow.sset$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(pow.sset$DateTime, pow.sset$Sub_metering_2, col = "red")
lines(pow.sset$DateTime, pow.sset$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))

# upper-right plot
plot(pow.sset$DateTime, pow.sset$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# lower-right plot
plot(pow.sset$DateTime, pow.sset$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()