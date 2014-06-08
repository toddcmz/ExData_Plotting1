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

# reads in the data we want for plot 2, from the new file
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

# creates plot 2 using the new datetime column

png("plot2.png", width=480, height=480)
plot(strptime(as.character(data$datetime),format="%d/%m/%Y %H:%M:%S"),
     data$Global_active_power, type="l", 
     ylab="Global Active Power (Kilowatts)", xlab="")
dev.off()