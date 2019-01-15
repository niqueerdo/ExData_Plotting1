# Load Dataset
# Note: missing values are coded as ?
data <- read.table("household_power_consumption.txt", header = TRUE, 
                   sep = ';', na.strings ='?')

# Check no.of rows and columns, datatypes
str(data)

# We will only be using data from the dates 2007-02-01 and 2007-02-02
# Change datatype from factor to Date
data$Date <- as.Date(data$Date, "%d/%m/%Y")
class(data$Date)

data_Feb1_Feb2 <- subset(data, Date >= as.Date("2007-2-1") & 
                                 Date <= as.Date("2007-2-2"))

# Combine DateTime data and change datatype from factor to POSIXlt
datetime <- paste(data_Feb1_Feb2$Date, data_Feb1_Feb2$Time)
data_Feb1_Feb2 <- cbind(datetime, data_Feb1_Feb2)
data_Feb1_Feb2$datetime <- strptime(data_Feb1_Feb2$datetime, "%Y-%m-%d %H:%M:%S")

# Line Plot: DateTime vs Global Active Power
with(data_Feb1_Feb2, plot(datetime, Global_active_power, type = "l", 
                          ylab = "Global Active Power (kilowatts)", xlab = ""))

# Save to a PNG file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, "plot2.png", width = 480, height = 480)
dev.off()
