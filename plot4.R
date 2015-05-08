#### Read the whole dataset from text file into a dataframe####
hsehld_tbl2 <- read.table("C:/Users/skumar/Documents/R_working_site/data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                          fill= TRUE, nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

####  subset the dataframe -- data for only two dates####
hsehld_tbl2$Date <- as.Date(hsehld_tbl2$Date, format="%d/%m/%Y")
tbl3plot <- subset(hsehld_tbl2, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#### Format the date- Combine date and time into one variable and add it to the dataframe####
datetime <- paste(as.Date(tbl3plot$Date), tbl3plot$Time)
tbl3plot$DateTime <-  as.POSIXct(datetime)
tbl4plot <- tbl3plot[,7:10]


par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(tbl3plot, {
  #### PLOT 1--- Plot the graph for Global active power ####
  plot(tbl3plot$Global_active_power~tbl3plot$DateTime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  #### PLOT 2--- Plot the graph for Voltage ####
  plot(tbl3plot$Voltage~tbl3plot$DateTime, type="l",
       ylab="Voltage", xlab="")
  #### PLOT 3--- Plot the graph for submetering ####  
  with(tbl4plot, {
    plot(Sub_metering_1~DateTime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~DateTime,col='Red')
    lines(Sub_metering_3~DateTime,col='Blue')
  })
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  #### PLOT 4--- Plot the graph for Global active power ####
  plot(tbl3plot$Global_reactive_power~tbl3plot$DateTime, type="l",
       ylab="Global Reactive Power (kilowatts)", xlab="")
}
)

### Save the plot in png format ####
dev.copy(png, "plot4.png",height=480, width=480)
dev.off()

