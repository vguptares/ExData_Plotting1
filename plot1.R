dt<-read.table("./household_power_consumption.txt",sep=";",header=TRUE,fill=FALSE);
dt1<-subset(dt,select=c("Global_active_power"),Date %in% c("1/2/2007","2/2/2007"));
dt2<-na.omit(dt1); #dt4<-dt1[complete.cases(dt1)];
dt3<-is.na(dt1$Global_active_power);
hist(as.numeric(dt2$Global_active_power)/500, breaks=16, col="red",xlab="Global Active Power(Kilowatts)",main="Global Active Power");
dev.copy(png,file="plot1.png",height=480,width=480);
dev.off();
