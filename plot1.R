setClass('myDate')
setAs('character', 'myDate', function(from) as.Date(from, format='%d/%m/%Y') )

gen.plot1 <- function(file, png.file='plot1.png', png.width=480, png.height=480) {
	png(png.file, width=png.width, height=png.height, bg='transparent')

	col.classes <- c('myDate', 'NULL', 'numeric', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL')
	data <- read.csv(file, header=TRUE, sep=';', na.strings='?', quote='', colClasses=col.classes)
	data <- data[ data$Date >= '2007-02-01' & data$Date < '2007-02-03', 'Global_active_power']

	hist(data, col = 'red', xlab = 'Global Active Power (kilowats)', main = 'Global Active Power')

	dev.off()
}

gen.plot1('household_power_consumption.txt')
