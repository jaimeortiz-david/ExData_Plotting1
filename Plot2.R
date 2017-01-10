data<-read.csv("household_power_consumption.txt",header=T,sep=";")
str(data)

data$DateTime<-paste(data$Date, data$Time)
data$DateTime<-strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

start<-which(data$DateTime==strptime("2007-02-01", "%Y-%m-%d"))

end<-which(data$DateTime==strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))

data1<-data[start:end,]

data1$Global_active_power<-as.numeric(data1$Global_active_power)
plot(data1$DateTime, data1$Global_active_power,
     type='l',ylab="Global Active Power (Kilowatts)", xlab="")
dev.copy(png, file = "plot2.png")
dev.off()
