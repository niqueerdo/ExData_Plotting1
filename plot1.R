# Load Dataset
# Note: missing values are coded as ?
data <- read.table("household_power_consumption.txt", header = TRUE, 
                   sep = ';', na.strings ='?')

# Check no.of rows and columns, datatypes
str(data)

# We will only be using data from the dates 2007-02-01 and 2007-02-02
data$Date <- as.Date(data$Date, "%d/%m/%Y")
class(data$Date)

data_Feb1_Feb2 <- subset(data, Date >= as.Date("2007-2-1") & 
                                 Date <= as.Date("2007-2-2"))

# Histogram: Global Active Power
hist(data_Feb1_Feb2$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# Save to a PNG file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, "plot1.png", width = 480, height = 480)
dev.off()