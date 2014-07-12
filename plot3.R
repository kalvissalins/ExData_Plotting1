## Read data from working directory
power <- read.csv("./household_power_consumption.txt", sep=";", dec=".", stringsAsFactors = FALSE)
## Subset data
data<-subset(power,power$Date=="1/2/2007"|power$Date=="2/2/2007")
## Convert dates
data$DateTime<-strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
## Convert variables to numeric format
data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)
data$Sub_metering_3<-as.numeric(data$Sub_metering_3)
## Open graphics device
png(filename="plot3.png",width=480,height=480)
## Make plot
plot(data$DateTime,data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
## Close device
dev.off()
