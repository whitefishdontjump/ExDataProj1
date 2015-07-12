### plot1.R 
#### creates plot1.png per Exploratory Data Analysis Project 1

#### Created by WhiteFishDontJump, July 2015

plot1 <- function() {

### test if workingdata is available, else get the data

    if(!exists("workingdata")) {
        source('getdata.R')
        getdata()
    }

### open file device
        png(file="plot1.png")
    
### prepare histogram
    
    hist(workingdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kiloWatts)" )

### close png device
    dev.off()



message("plot1.png created")
}
