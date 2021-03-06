data <- fread("household_power_consumption.txt", sep = ";", na.strings = "?")
subset <- subset(data, Date == '2/2/2007' | Date == '1/2/2007')
subset$Date <- as.Date(strptime(subset$Date, '%d/%m/%y'))
x <- paste(subset$Date, subset$Time)
x <- strptime(x, "%d/%m/%Y %H:%M:%S")
png("plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
plot(x, subset$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
plot(x, subset$Voltage, type="l", xlab = "datetime", ylab = "Voltage")
plot(x, subset$Sub_metering_1, t="l", ylab="Energy sub metering", xlab="")
lines(x,subset$Sub_metering_2, col="red")
lines(x,subset$Sub_metering_3, col="blue")
legend("topright", legend= c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col =c("black","red", "blue"), lty = 1)
plot(x, subset$Global_reactive_power, type="l", xlab = "datetime",ylab="Global_reactive_power")
dev.off()