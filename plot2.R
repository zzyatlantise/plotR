

data<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
data_2<-subset(data,data$Date %in% c("2/2/2007","1/2/2007"))
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
plot(c(x1,x2),c(y[x1],y[x2]),type="l",xlab="",ylab="Global Active Power(kilowatts)",xaxt='n')
#x<-strptime(x, "%d/%m/%y %H:%M:%OS")
axis(side=1, at=c(0,n1,n1+n2), labels=c("Thu","Fri", "Sat"))
dev.copy(png,file="plot2.png")
dev.off()