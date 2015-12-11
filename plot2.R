
gen.plot2 <- function(file, png.file='plot2.png', png.width=480, png.height=480) {
	png(png.file, width=png.width, height=png.height)

	col.classes <- c('character', 'character', 'numeric', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL')
	data <- read.csv(file, header=TRUE, sep=';', na.strings='?', quote='', colClasses=col.classes)
	data <- data[ data$Date %in% c('1/2/2007', '2/2/2007'), ]
	data <- data.frame(date=strptime(paste(data$Date, data$Time), format='%d/%m/%Y %H:%M:%S'),
			   Global_active_power=data$Global_active_power)

	plot(data$date, data$Global_active_power, type='l', col='black', xlab='', ylab='')
	title(ylab='Global Active Power (kilowats)')

	dev.off()
}

gen.plot2('household_power_consumption.txt')
