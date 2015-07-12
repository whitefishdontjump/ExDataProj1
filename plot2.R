### plot2.R 
#### creates plot2.png per Exploratory Data Analysis Project 1

#### Created by WhiteFishDontJump, July 2015

plot2 <- function() {

### test if workingdata is available, else get the data

    if(!exists("workingdata")) {
        source('getdata.R')
        getdata()
    }

### open file device
        png(file="plot2.png")
    
### prepare plot
    par("mar" = c(2.1,4.1,1.1, 1))
    tickpoints <- tickpts
    plabels <- day_axis
    
    plot(workingdata$Global_active_power,,"l", ylab="Global Active Power (kiloWatts)", xlab="", xaxt="n")

    axis(1, at = tickpoints, labels=plabels)

### close png device
    dev.off()



message("plot2.png created")
}
