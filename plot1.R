### R script to plot1 in the assignment##

#### Read the whole dataset from text file into a dataframe####
hsehld_tbl <- read.table(".Coursera_R/R_working_site/data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                            nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

####  subset the dataframe -- data for only two dates####
hsehld_tbl$Date <- as.Date(hsehld_tbl$Date, format="%d/%m/%Y")
tbl2plot <- subset(hsehld_tbl, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

### Plot1- Draw a histogram for Global active power ####
hist(tbl2plot$Global_active_power,main="Global Active Power", xlab= "Global Active Power (in kilowatts)"
      ,ylab= "Frequency", col= "Red")


#### Save the plot in png format ####
dev.copy(png, "plot1.png",height=480, width=480)
dev.off()