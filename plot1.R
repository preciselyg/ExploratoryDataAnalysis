# Must be run from directory containing household_power_consumption.txt

data <- "household_power_consumption.txt"
if (!file.exists(data)) stop(paste("Didn't find data file", data))

# The data is in a ; separated file with ? for NA
col.class <- c("character", "character", "numeric", "numeric", "numeric", "numeric",
               "numeric", "numeric", "numeric")
data_ <- read.table(data, sep=";", header=TRUE,
                   colClasses=col.class, na.strings="?",
                   nrows=2075260)
data_$Date <- as.Date(data_$Date, format="%d/%m/%Y")

# select desired dates and variable
data_ <- subset(data_, Date=="2007-02-01" | Date=="2007-02-02",
               Global_active_power)

# Histogram
png(filename="plot1.png", width=480, height=480)
hist(data_$Global_active_power, xlab="Global Active Power (kilowatts)",
     col="red", main="Global Active Power")
dev.off()
