#hsehld_tbl2[complete.cases(hsehld_tbl2)]
####  subset the dataframe -- data for only two dates####
hsehld_tbl2$Date <- as.Date(hsehld_tbl2$Date, format="%d/%m/%Y")
tbl3plot <- subset(hsehld_tbl2, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#### Format the date- Combine date and time into one variable and add it to the dataframe####
datetime <- paste(as.Date(tbl3plot$Date), tbl3plot$Time)
tbl3plot$DateTime <-  as.POSIXct(datetime)

tbl4plot <- tbl3plot[,7:10]

#### Plot the graph for sub_metering ####
with(tbl4plot, {
  plot(Sub_metering_1~DateTime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


### Save the plot in png format ####
dev.copy(png, "plot3.png",height=480, width=480)
dev.off()