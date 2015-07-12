### plot3.R 
#### creates plot3.png per Exploratory Data Analysis Project 1

#### Created by WhiteFishDontJump, July 2015

plot3 <- function() {

### test if workingdata is available, else get the data

    if(!exists("workingdata")) {
        source('getdata.R')
        getdata()
    }

### open file device
        png(file="plot3.png")
    
### prepare plot
    par("mar" = c(2.1,4.1,1.1, 1))
    tickpoints <- tickpts
    plabels <- day_axis
    colcolors <- c("black", "red", "blue")
    legendkey <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3" )
    
    plot(workingdata$Sub_metering_1,,"l", ylab="Energy sub metering", xlab="", xaxt="n")
    lines(workingdata$Sub_metering_2, col ="red")
    lines(workingdata$Sub_metering_3, col ="blue")
    axis(1, at = tickpoints, labels=plabels)
    legend("topright", lty = 1, col = colcolors, legend = legendkey )

### close png device
    dev.off()



message("plot3.png created")
}
