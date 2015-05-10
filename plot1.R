#set the working dir to folder containing the extracted household_power_consumption.txt file
file <- file("household_power_consumption.txt")

#only the data of 2 dates is required so we subset the data that contains data for 1/2/2007 and 2/2/2007
data <- read.table(text = grep("^[1,2]/2/2007", readLines(file), value=TRUE), 
                   col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
                   "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep=";",
                   na.strings ="?")

#Saving the output file after plotting as plot1.png
png("plot1.png", width = 480, height = 480)

#Plotting is done by hist() function
hist(data$Global_active_power, main = "Global Active Power", col="red", xlab = "Global Active Power (killowatts)",
     ylab = "Frequency")

dev.off()

#close the file connection to avoid warnings
close(file)