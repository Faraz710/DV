data(AirPassengers)
class(AirPassengers)
#This tells you that the data series is in a time series format
start(AirPassengers)
summary(AirPassengers)
edit(AirPassengers)
str(AirPassengers)
names(AirPassengers)
head(AirPassengers)
tail(AirPassengers)
library(dplyr)
glimpse(AirPassengers)
#This is the start of the time series
frequency(AirPassengers)
#The cycle of this time series is 12months in a year
summary(AirPassengers)
#The number of passengers are distributed across the spectrum
plot(AirPassengers)
#This will plot the time series
abline(reg=lm(AirPassengers~time(AirPassengers)))
#This will print the cycle across years.
cycle(AirPassengers)
plot(aggregate(AirPassengers,FUN=mean))
#This will aggregate the cycles and display a year on year trend
boxplot(AirPassengers~cycle(AirPassengers))
#Box plot across months will give us a sense on seasonal effect
# 1. There is a trend component which grows the passenger year by year.

# 2. There looks to be a seasonal component which has a cycle less than 12 months.

# 3. The variance in the data keeps on increasing with time.
# ///adf.test(diff(log(AirPassengers)), alternative="stationary", k=0)
acf(log(AirPassengers))
pacf(diff(log(AirPassengers)))
(fit <- arima(log(AirPassengers), c(0, 1, 1),seasonal = list(order = c(0, 1, 1), period = 12)))
pred <- predict(fit, n.ahead = 10*12)
ts.plot(AirPassengers,2.718^pred$pred, log = "y", lty = c(1,3))
