library(lubridate)
dt<-read.table("./household_power_consumption.txt",sep=";",header=TRUE,fill=FALSE);
dt2<-subset(dt,select=c("Date","Time","Global_active_power"),Date %in% c("1/2/2007","2/2/2007"));
dt2$wd<-format(as.Date(dt2$Date), "%a");
dt2$dt<-strptime(paste(dt2$Date,dt2$Time), format="%d/%m/%Y %H:%M:%S");
dt2<-subset(dt2,select=c("dt","Global_active_power"));
x<-0.002;
dt2[,2]<-as.numeric(dt2[,2])*x;
plot(dt2$dt,(dt2$Global_active_power),typ='l',ylab="Global Active Power(Kilowatts)",xlab="");
dev.copy(png,file="plot2.png",height=480,width=480);
dev.off();