library(lubridate)
dt<-read.table("./household_power_consumption.txt",sep=";",header=TRUE,fill=FALSE);
dt2<-subset(dt,select=c("Date","Time","Sub_metering_1","Sub_metering_2","Sub_metering_3"),Date %in% c("1/2/2007","2/2/2007"));
dt2$dt<-strptime(paste(dt2$Date,dt2$Time), format="%d/%m/%Y %H:%M:%S");
dt2$Global_active_power<-dt2$Global_active_power;
x<-0.1;
dt2$"Sub_metering_2"<-as.numeric(dt2$"Sub_metering_2")*x;
plot(dt2$dt,(dt2$"Sub_metering_1"),typ='l',ylab="Energy Sub Metering",xlab="");
lines(dt2$dt, dt2$"Sub_metering_3", col = "blue");
lines(dt2$dt, dt2$"Sub_metering_2", col = "red");
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch=20,col = c("black","red","blue"));
dev.copy(png,file="plot3.png",height=480,width=480);
dev.off();
