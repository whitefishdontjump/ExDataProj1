ExploratoryDataAnalysis_Project1
========================================================
(README-JHR.MD is my codebook for this project)

This is a project assignment that John Raphael completed
for Coursera/JHU Exploratory Data Analysis (exdata-002),
05/09/2014. 

The assignment is detailed at https://github.com/rdpeng/ExData_Plotting1
(README.MD file contains the assignment, the figures folder contains png examples from RD Peng)

The original source of the data is:
https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption "UC Irvive Machine Learning Archive Dataset"


MD prepared by John Raphael, (github user whitefishdontjump) 
Platform: Windows Vista sp2, 32-bit, R3.1, RStudio 0.98.507)

Procedure:
   I wrote and used getdata() function (source: getdata.R) which:
   1. if data not already downloaded, downloads the data set from
      https://d396qusza40orc.cloudfront.net/exdata%-data%-household_power_consumption.zip
  
   2. unzipped the downloaded file, named "powerdata.zip"

   3. Recorded date, time and URL are in file SourceInfo.txt
   
   4. Reads data from the extracted txt file into a data.frame
   
   5. converts date column to Posix format, subsets the array for the two days specifed in assignment
   
   6. exports the "workingdata" data.frame to the global environment, 
        and also writes the df to file "workingdata.csv"
   
   7. initializes some parameters common to most plots, exports these to global environment.
   
   Note: getdata() includes console messages to indicate progress.  For me, it ran about 2 minutes

Plots:
    There are 4 plot scripts (plot1.R, plot2.R,  . . .)
    Each  of the four scripts:
       1. checks for existence of workingdata and calls getdata() if needed.
       2. opens the png file device with associated file name ("plot1.png", etc.)
       3. uses plot and realted commands to construct a plot
       4. turns off the png device and sends a console message that the file is created
       
       


The following descriptions of the 9 variables in the dataset are taken from the UCI web site:

Date: Date in format dd/mm/yyyy

Time: time in format hh:mm:ss

Global_active_power: household global minute-averaged active power (in kilowatt)

Global_reactive_power: household global minute-averaged reactive power (in kilowatt)

Voltage: minute-averaged voltage (in volt)

Global_intensity: household global minute-averaged current intensity (in ampere)

Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).

Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.

Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.
