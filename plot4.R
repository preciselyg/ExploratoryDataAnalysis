# Loading  household_power_consumption.txt
data_file <- "household_power_consumption.txt"
if (!file.exists(data_file)) stop(paste("Didn't find data file", data_file))

# The data is in a ; separated file with ? for NA
col_class <- c("character", "character", "numeric", "numeric", "numeric", "numeric",
               "numeric", "numeric", "numeric")
data_all <- read.table(data_file, sep=";", header=TRUE,
                   colClasses=col_class, na.strings="?",
                   nrows=2075260)

#  pick specific dates
data_use <- subset(data_all, Date=="1/2/2007" | Date=="2/2/2007")

data_use$Date.Time <- strptime(paste(data_use$Date, data_use$Time),
                           format="%d/%m/%Y %H:%M:%S")

# Plotting the data.
png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2,2))

plot(data_use$Date.Time, data_use$Global_active_power, xlab="Global Active Power",
     ylab="Global Active Power", main="", type="n")
lines(data_use$Date.Time, data_use$Global_active_power, col="black")

plot(data_use$Date.Time, data_use$Voltage, xlab="datetime",
     ylab="Voltage", main="", type="n")
lines(data_use$Date.Time, data_use$Voltage, col="black")

plot(data_use$Date.Time, data_use$Sub_metering_1, xlab="",
     ylab="Energy sub metering", main="", type="n")
lines(data_use$Date.Time, data_use$Sub_metering_1, col="black")
lines(data_use$Date.Time, data_use$Sub_metering_2, col="red")
lines(data_use$Date.Time, data_use$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black","red","blue"), lty=1, bty="n")

plot(data_use$Date.Time, data_use$Global_reactive_power, xlab="datetime",
     ylab="Global_reactive_power", main="", type="n")
lines(data_use$Date.Time, data_use$Global_reactive_power, col="black")

dev.off()

