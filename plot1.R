# These first three actions read in the entire dataset, 
# subset it to what we want, then create a smaller dataset
# containing only those rows. I saved this new dataset to my
# working directory so I wouldn't have to load the whole thing
# every time I came back to work on this assignment.

data.proto <- read.table("./Exploratory Data Analysis/Ass1/household_power_consumption.txt",sep=";", 
      na.strings = "?",header=T, colClasses=c("character","character","numeric","numeric",
      "numeric","numeric","numeric","numeric","numeric")) 

data <- subset(data.proto,data.proto$Date=="1/2/2007" | data.proto$Date=="2/2/2007")

write.table(data, "./Exploratory Data Analysis/Ass1/data.txt", sep=";", row.names=F)

# reads in the data we want for plot one, from the new file
# the above lines of code created.

data<-read.table("./Exploratory Data Analysis/Ass1/data.txt",
      sep=";", header=T, colClasses=c("character","character","numeric","numeric",
      "numeric","numeric","numeric","numeric","numeric"))

# creates plot 1

png("plot1.png", width=480, height=480)
hist(data$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()

