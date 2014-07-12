## Read data from working directory
power <- read.csv("./household_power_consumption.txt", sep=";", dec=".", stringsAsFactors = FALSE)
## Subset data
data<-subset(power,power$Date=="1/2/2007"|power$Date=="2/2/2007")
## Convert dates
data$DateTime<-strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
## Convert variables to numeric
data$Global_active_power<-as.numeric(data$Global_active_power)
## Open graphics device
png(filename="plot1.png",width=480,height=480)
## Draw histogram
hist(data$Global_active_power,col="red",main="Global Active Power", xlab="Global Active Power(kilowatts)",breaks=16)
## Close device
dev.off()