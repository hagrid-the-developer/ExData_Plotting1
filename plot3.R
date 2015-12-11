
gen.plot3 <- function(file, png.file='plot3.png', png.width=480, png.height=480) {
	png(png.file, width=png.width, height=png.height)

	col.classes <- c('character', 'character', 'NULL', 'NULL', 'NULL', 'NULL', 'numeric', 'numeric', 'numeric')
	data <- read.csv(file, header=TRUE, sep=';', na.strings='?', quote='', colClasses=col.classes)
	data <- data[ data$Date %in% c('1/2/2007', '2/2/2007'), ]
	data <- data.frame(date=strptime(paste(data$Date, data$Time), format='%d/%m/%Y %H:%M:%S'),
			   Sub_metering_1=data$Sub_metering_1,
			   Sub_metering_2=data$Sub_metering_2,
			   Sub_metering_3=data$Sub_metering_3)

	plot(data$date, data$Sub_metering_1, type='l', col='black', xlab='', ylab='')
	lines(data$date, data$Sub_metering_2, type='l', col='red')
	lines(data$date, data$Sub_metering_3, type='l', col='blue')
	title(ylab='Energy sub metering')
	legend('topright', lty = 1, col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

	dev.off()
}

gen.plot3('household_power_consumption.txt')
