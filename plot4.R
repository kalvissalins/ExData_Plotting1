## Read data from working directory
power <- read.csv("./household_power_consumption.txt", sep=";", dec=".", stringsAsFactors = FALSE)
## Subset data
data<-subset(power,power$Date=="1/2/2007"|power$Date=="2/2/2007")
## Convert dates
data$DateTime<-strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
## Convert variables to numeric
data$Global_active_power<-as.numeric(data$Global_active_power)
data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)
data$Sub_metering_3<-as.numeric(data$Sub_metering_3)
data$Voltage<-as.numeric(data$Voltage)
data$Global_reactive_power<-as.numeric(data$Global_reactive_power)
data$Voltage<-as.numeric(data$Voltage)/10
## Open graphics device
png(filename="plot4.png",width=480,height=480)
## Define rows for multiple plots
par(mfrow=c(2,2))
## Make plots
plot(data$DateTime,data$Global_active_power,type="n",xlab="",ylab="Global Active Power")
lines(data$DateTime,data$Global_active_power)

with(data, plot(DateTime,Voltage,type="n"))
with(data,lines(DateTime,Voltage))

plot(data$DateTime,data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(data$DateTime,data$Sub_metering_1)
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
legend("topright",bty="n", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(data, plot(DateTime,Global_reactive_power,type="l"))
## Close device
dev.off()