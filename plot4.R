data<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
data_2<-subset(data,data$Date %in% c("2/2/2007","1/2/2007"))

par(oma=c(0,0,0,0),mfrow=c(2,2),mar=c(4,4,2,2))


y<-as.numeric(as.character(data_2$Global_active_power))

#x<-paste(as.character(data_2$Date),as.character(data_2$Time))
Date<-(as.character(data_2$Date))
Time<-(as.character(data_2$Time))
#x1 is the data of 1/2/2007
x1<-which(Date=="1/2/2007")
n1<-length(x1)
#x2 is the data of 2/2/2007
x2<-which(Date=="2/2/2007")
n2<-length(x2)
plot(c(x1,x2),c(y[x1],y[x2]),type="l",xlab="",ylab="Global Active Power",xaxt='n',cex=0.8)
#x<-strptime(x, "%d/%m/%y %H:%M:%OS")
axis(side=1, at=c(0,n1,n1+n2), labels=c("Thu","Fri", "Sat"))



voltage <- as.numeric(as.character(data_2$Voltage))
plot(c(x1,x2),c(voltage[x1],voltage[x2]),type="l",xaxt='n',yaxt='n',ylab="Voltage",xlab="datetime",ylim=c(234,246))
axis(side=1, at=c(0,n1,n1+n2), labels=c("Thu","Fri", "Sat"))
axis(side=2, at=c(234,238,242,246), labels=c(234,238,242,246))




y_1<-as.numeric(as.character(data_2$Sub_metering_1))
y_2<-as.numeric(as.character(data_2$Sub_metering_2))
y_3<-as.numeric(as.character(data_2$Sub_metering_3))



plot(c(x1,x2),c(y_1[x1],y_1[x2]),type="l",xlab="",ylab="Energy sub metering",xaxt='n',yaxt='n',ylim=c(0,30),cex=0.4)
#par(new=T)
lines(c(x1,x2),c(y_2[x1],y_2[x2]),col="red")
#plot(c(x1,x2),c(y_2[x1],y_2[x2]),type="l",xlab="",ylab="",xaxt='n',yaxt='n',ylim=c(0,30),col="red")
#par(new=T)
lines(c(x1,x2),c(y_3[x1],y_3[x2]),col="blue")
#plot(c(x1,x2),c(y_3[x1],y_3[x2]),type="l",xlab="",ylab="",xaxt='n',yaxt='n',ylim=c(0,30),col="blue")

axis(side=1, at=c(0,n1,n1+n2), labels=c("Thu","Fri", "Sat"))
axis(side=2, at=c(0,10,20,30), labels=c(0,10,20,30))
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.4)







power<- as.numeric(as.character(data_2$Global_reactive_power))
plot(c(x1,x2),c(power[x1],power[x2]),type="l",ylab="Global_reactive_power",xaxt='n',yaxt='n',xlab="datetime",,ylim=c(0.0,0.5))
axis(side=1, at=c(0,n1,n1+n2), labels=c("Thu","Fri", "Sat"))
axis(side=2, at=c(0.0,0.1,0.2,0.3,0.4,0.5), labels=c(0.0,0.1,0.2,0.3,0.4,0.5))
dev.copy(png,file="plot4.png")
dev.off()

