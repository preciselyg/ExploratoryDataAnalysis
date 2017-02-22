# from  household_power_consumption.txt
original_file <- "household_power_consumption.txt"
if (!file.exists(original_file)) stop(paste("Didn't find data file", original_file))

# The data is in a ; separated file with ? for NA
col_class <- c("character", "character", "numeric", "numeric", "numeric", "numeric",
               "numeric", "numeric", "numeric")
data_use <- read.table(original_file, sep=";", header=TRUE,
                   colClasses=col.class, na.strings="?",
                   nrows=2075260)

# select desired dates
data_use <- subset(data_use, Date=="1/2/2007" | Date=="2/2/2007",
               c(Date, Time, Global_active_power))

data_use$Date.Time <- strptime(paste(data_use$Date, data_use$Time),
                           format="%d/%m/%Y %H:%M:%S")

# Plot
png(filename="plot2.png", width=480, height=480)
plot(data_use$Date.Time, data_use$Global_active_power, xlab="",
     ylab="Global active power (kilowatts)", main="", type="n")
lines(data_use$Date.Time, data_use$Global_active_power)
dev.off()
