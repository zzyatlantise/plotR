data<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
data_2<-subset(data,data$Date %in% c("2/2/2007","1/2/2007"))
y_1<-as.numeric(as.character(data_2$Sub_metering_1))
y_2<-as.numeric(as.character(data_2$Sub_metering_2))
y_3<-as.numeric(as.character(data_2$Sub_metering_3))

Date<-(as.character(data_2$Date))
Time<-(as.character(data_2$Time))
#x1 is the data of 1/2/2007
x1<-which(Date=="1/2/2007")
n1<-length(x1)
#x2 is the data of 2/2/2007
x2<-which(Date=="2/2/2007")
n2<-length(x2)

plot(c(x1,x2),c(y_1[x1],y_1[x2]),type="l",xlab="",ylab="Energy sub metering",xaxt='n',yaxt='n',ylim=c(0,30))
par(new=T)
plot(c(x1,x2),c(y_2[x1],y_2[x2]),type="l",xlab="",ylab="",xaxt='n',yaxt='n',ylim=c(0,30),col="red")
par(new=T)
plot(c(x1,x2),c(y_3[x1],y_3[x2]),type="l",xlab="",ylab="",xaxt='n',yaxt='n',ylim=c(0,30),col="blue")

axis(side=1, at=c(0,n1,n1+n2), labels=c("Thu","Fri", "Sat"))
axis(side=2, at=c(0,10,20,30), labels=c(0,10,20,30))
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.6)
dev.copy(png,file="plot3.png")
dev.off()