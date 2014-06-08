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

# reads in the data we want for plot 3, from the new file
# the above lines of code created.

data<-read.table("./Exploratory Data Analysis/Ass1/data.txt",
      sep=";", header=T, colClasses=c("character","character","numeric","numeric",
      "numeric","numeric","numeric","numeric","numeric"))

# for plots 2 through 4 -- created the datetime column in the dataset

datetime <- NULL
for(i in 1:nrow(data)){
      datetime <- c(datetime,paste(data[i,"Date"],data[i,"Time"],sep=" "))
}
data <- cbind(data,datetime)

# creates plot 3 -- call plot3() after sourcing to initialize

plot3 <- function(){
      
      png("plot3.png", width=480, height=480)
      
      plot(strptime(as.character(data$datetime),format="%d/%m/%Y %H:%M:%S"),
           data$Sub_metering_1, type="l", 
           ylab="Energy Sub Metering", xlab="")
      
      points(strptime(as.character(data$datetime),format="%d/%m/%Y %H:%M:%S"),
             data$Sub_metering_2, type="l", col="red")
      
      points(strptime(as.character(data$datetime),format="%d/%m/%Y %H:%M:%S"),
             data$Sub_metering_3, type="l", col="blue")
      
      legend("topright",lwd=1, col=c("black","red","blue"), 
             legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
      
      dev.off()
}