library(lubridate)
dt<-read.table("./household_power_consumption.txt",sep=";",header=TRUE,fill=FALSE);
dt2<-subset(dt,select=c("Date","Time","Sub_metering_1","Sub_metering_2","Sub_metering_3","Voltage","Global_reactive_power","Global_active_power"),Date %in% c("1/2/2007","2/2/2007"));
dt2$dt<-strptime(paste(dt2$Date,dt2$Time), format="%d/%m/%Y %H:%M:%S");
x<-0.002;
dt2$Global_active_power<-as.numeric(dt2$Global_active_power)*x;
dt2$"Global_reactive_power"<-as.numeric(dt2$"Global_reactive_power")*0.002;
dt2$"Voltage"<-as.numeric(dt2$"Voltage")*0.1;
par(mfrow=c(2,2));
plot(dt2$dt,(dt2$Global_active_power),typ='l',ylab="Global Active Power(Kilowatts)",xlab="");
#plot(dt2$dt,(dt2$Voltage),typ='l',ylab="Voltage",xlab="datetime");
plot(dt2$dt,(dt2$Voltage),typ='l',ylab="Voltage",xlab="datetime");
plot(dt2$dt,(dt2$"Sub_metering_1"),typ='l',ylab="Energy Sub Metering",xlab="");
lines(dt2$dt, dt2$"Sub_metering_3", col = "blue");
lines(dt2$dt, dt2$"Sub_metering_2", col = "red");
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch=20,col = c("black","red","blue"),cex=0.5,bty="n");
plot(dt2$dt,(dt2$Global_reactive_power),typ='l',ylab="Global_reactive_power",xlab="datetime");
dev.copy(png,file="plot4.png",height=480,width=480);
dev.off();