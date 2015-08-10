# Since the file is big, the reading of only required rows is attempted by the below method.

# Measurements started from 17:24:00 on 16/12/2006
# Therefore, number of measurements taken for 16-12-2006 = 24*60 - (17*60 + 24) = 396 at a 1 minute sampling rate

# Number of days from 17-12-2006 to 31-12-2006 = 15.
# Thus, number of measurements = 15*24*60 = 21600

# Number of days from 01-01-2007 to 31-01-2007 = 31
# Number of measurements = 31*24*60 = 44640

# Total number of measurements to be skipped = 396+21600+44640 = 66636 (minus some 50 as margin for error) 

# Then the required days of 01-02-2007 and 02-02-2007 arrive.

# Now, number of measurements to be taken = 2*1440 = 2880 (+50 + another 50 as margin) for two days

nrows_to_be_skipped <- 66636-50
nrows_to_be_taken <- 2880 + 50 + 50


# Since many rows at the beginning are skipped, the zeroth row containing column
# names is also skipped. Therefore, a vector of column names is given to col.names argument of read.table() function.

column_names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")


# reading the selected rows of the file 

household_power_consumption_dframe <- read.table("household_power_consumption.txt",header=TRUE,sep=";",col.names = column_names, skip = nrows_to_be_skipped, nrows = nrows_to_be_taken)



# creating "plot1.png" file which is a histogram of Global Active Power for the required 2440 rows
# using png(), dev.off() functions
# the default width and height pixels setting for png() function is 480x480.

png(filename = "plot1.png") # Open png device and create "plot1.png" in the working directory.
hist(household_power_consumption_dframe$Global_active_power[(household_power_consumption_dframe$Date == "1/2/2007" | household_power_consumption_dframe$Date == "2/2/2007")], col = "RED", main = "Global Active Power" ,xlab = "Global Active Power (kilowatts)")
dev.off() # Close png device. "plot1" is now created 
