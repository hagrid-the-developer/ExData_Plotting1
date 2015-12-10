# http://stackoverflow.com/questions/3554572/read-csv-with-dates-and-numbers-with-r-statistical-software
# as.Date('16/12/2006', format='%d/%m/%Y')

setClass('myDate')
setAs('character', 'myDate', function(from) as.Date(from, format='%d/%m/%Y') )

gen.plot1 <- function(file) {
	col.classes <- c('myDate', 'NULL', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric')
	data <- read.csv(file, header=TRUE, sep=';', na.strings='?', quote='', colClasses=col.classes)
	data <- data[ data$Date >= '2007-02-01' & data$Date <= '2007-02-02', ]
	data
}

#gen.plot1('household_power_consumption.txt')
