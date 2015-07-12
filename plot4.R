### plot4.R 
#### creates plot4.png per Exploratory Data Analysis Project 1

#### Created by WhiteFishDontJump, July 2015

plot4 <- function() {

### test if workingdata is available, else get the data

    if(!exists("workingdata")) {
        source('getdata.R')
        getdata()
    }

### open file device
        png(file="plot4.png")

#### set for 2x2 plots on single page
par("mfrow" = c(2,2))
    
### prepare plots; localize globals, set some plot params.
    
    tickpoints <- tickpts
    plabels <- day_axis
    colcolors <- c("black", "red", "blue")
    legendkey <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3" )

#### firstplot same as plot 2
    
    plot(workingdata$Global_active_power,,"l", ylab="Global Active Power (kiloWatts)", xlab="", xaxt="n")
    axis(1, at = tickpoints, labels=plabels)

#### secondplot similar to 2, but with Voltage variable,
    
    plot(workingdata$Voltage,,"l", ylab="Voltage", xlab="", xaxt="n")
    axis(1, at = tickpoints, labels=plabels)

#### third plot same as plot 3

    plot(workingdata$Sub_metering_1,,"l", ylab="Energy sub metering", xlab="", xaxt="n")
    lines(workingdata$Sub_metering_2, col ="red")
    lines(workingdata$Sub_metering_3, col ="blue")
    axis(1, at = tickpoints, labels=plabels)
    legend("topright", lty = 1, col = colcolors, legend = legendkey, bty ="n" )

#### fourth plot, similar to 2nd and 3rd, but with glob react power
 plot(workingdata$Global_reactive_power,,"l", ylab="Global Reactive Power (kW)", xlab="", xaxt="n")
axis(1, at = tickpoints, labels=plabels)



### close png device
    dev.off()



message("plot4.png created")
}
