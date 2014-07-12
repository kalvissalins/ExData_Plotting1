## Read data from working directory
power <- read.csv("./household_power_consumption.txt", sep=";", dec=".", stringsAsFactors = FALSE)
## Subset data
data<-subset(power,power$Date=="1/2/2007"|power$Date=="2/2/2007")
## Convert dates
data$DateTime<-strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
## Convert variable to numeric
data$Global_active_power<-as.numeric(data$Global_active_power)
## Open graphics device
png(filename="plot2.png",width=480,height=480)
## Draw plot
plot(data$DateTime,data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
## Close device
dev.off()