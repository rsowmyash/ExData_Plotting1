#### Read the whole dataset from text file into a dataframe####
hsehld_tbl2 <- read.table(".Coursera_R/R_working_site/data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                         fill= TRUE, nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
 #hsehld_tbl2[complete.cases(hsehld_tbl2)]
####  subset the dataframe -- data for only two dates####
hsehld_tbl2$Date <- as.Date(hsehld_tbl2$Date, format="%d/%m/%Y")
tbl3plot <- subset(hsehld_tbl2, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#### Format the date- Combine date and time into one variable and add it to the dataframe####
datetime <- paste(as.Date(tbl3plot$Date), tbl3plot$Time)
tbl3plot$DateTime <-  as.POSIXct(datetime)

write.table(tbl3plot, "C:/Users/skumar/Desktop/tbl3.csv", sep=",", row.names= FALSE)

#### Plot the graph for Global active power ####

plot(tbl3plot$Global_active_power~tbl3plot$DateTime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

#### Save the plot in png format ####
dev.copy(png, "plot2.png",height=480, width=480)
dev.off()