

gen.plot4 <- function(file, png.file='plot1.png', png.width=480, png.height=480) {
	png(png.file, width=png.width, height=png.height)

	col.classes <- c('character', 'character', 'numeric', 'numeric', 'numeric', 'NULL', 'numeric', 'numeric', 'numeric')
	data <- read.csv(file, header=TRUE, sep=';', na.strings='?', quote='', colClasses=col.classes)
	data <- data[ data$Date %in% c('1/2/2007', '2/2/2007'), ]
	data <- data.frame(date=strptime(paste(data$Date, data$Time), format='%d/%m/%Y %H:%M:%S'),
			   Global_active_power=data$Global_active_power,
			   Voltage=data$Voltage,
			   Global_reactive_power=data$Global_reactive_power,
			   Sub_metering_1=data$Sub_metering_1,
			   Sub_metering_2=data$Sub_metering_2,
			   Sub_metering_3=data$Sub_metering_3)

	par(mfrow=c(2, 2))

	plot(data$date, data$Global_active_power, type='l', col='black', xlab='', ylab='')
	title(ylab='Global Active Power (kilowats)')

	plot(data$date, data$Voltage, type='l', col='black', xlab='', ylab='')
	title(xlab='datetime')
	title(ylab='Voltage')

	plot(data$date, data$Sub_metering_1, type='l', col='black', xlab='', ylab='')
	lines(data$date, data$Sub_metering_2, type='l', col='red')
	lines(data$date, data$Sub_metering_3, type='l', col='blue')
	title(ylab='Energy sub metering')
	legend('topright', lty = 1, bty = 'n', cex = 1.0, col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

	plot(data$date, data$Global_reactive_power, type='l', col='black', xlab='', ylab='')
	title(xlab='datetime')
	title(ylab='Global_reactive_power')

	dev.off()
}

gen.plot4('household_power_consumption.txt')
