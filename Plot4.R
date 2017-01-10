data<-read.csv("household_power_consumption.txt",header=T,sep=";")
str(data)

data$DateTime<-paste(data$Date, data$Time)
data$DateTime<-strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

start<-which(data$DateTime==strptime("2007-02-01", "%Y-%m-%d"))

end<-which(data$DateTime==strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))

data1<-data[start:end,]

data1$Global_reactive_power<- as.numeric(data1$Global_reactive_power)
data1$Voltage<- as.numeric(data1$Voltage)


par(mfcol=c(2,2))

plot(data1$DateTime, data1$Global_active_power,type='l',ylab="Global Active Power", xlab="")

plot(data1$DateTime, data1$Sub_metering_1,type='l', xlab="",ylab ="Energy sub metering")
lines(data1$DateTime, data1$Sub_metering_2,type='l', col='red')
lines(data1$DateTime, data1$Sub_metering_3,type='l', col="blue")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),col=c("black","red","blue"),bty="n")

plot(data1$DateTime, data1$Voltage,type='l', 
     ylab="Voltage",xlab="datetime" )

plot(data1$DateTime, data1$Global_reactive_power,type='l', 
     ylab="Global_reactive_power",xlab="datetime" )

dev.copy(png, file = "plot4.png")
dev.off()

