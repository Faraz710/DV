#Age of Death of Successive Kings of England
#starting with William the Conqueror

kings <- scan("http://robjhyndman.com/tsdldata/misc/kings.dat",skip=3)
# Read 42 items
kings
kingstimeseries <- ts(kings)
kingstimeseries
#Time Series:
  births <- scan("http://robjhyndman.com/tsdldata/data/nybirths.dat")
#Read 168 items
birthstimeseries <- ts(births, frequency=12, start=c(1946,1))
birthstimeseries
souvenir <- scan("http://robjhyndman.com/tsdldata/data/fancy.dat")
souvenirtimeseries <- ts(souvenir, frequency=12, start=c(1987,1))
souvenirtimeseries
plot.ts(kingstimeseries)
plot.ts(birthstimeseries)
plot.ts(souvenirtimeseries)
logsouvenirtimeseries <- log(souvenirtimeseries)
plot.ts(logsouvenirtimeseries)
#SMA - Simple Moving Average
library("TTR")
kingstimeseriesSMA3 <- SMA(kingstimeseries,n=3)
plot.ts(kingstimeseriesSMA3)
birthstimeseriescomponents <- decompose(birthstimeseries)
birthstimeseriescomponents$seasonal # get the estimated values of the seasonal component
plot(birthstimeseriescomponents)
#Forecast using Exponential smoothing 
rain <- scan("http://robjhyndman.com/tsdldata/hurst/precip1.dat",skip=1)
rainseries <- ts(rain,start=c(1813))
plot.ts(rainseries)
rainseriesforecasts <- HoltWinters(rainseries, beta=FALSE, gamma=FALSE)
rainseriesforecasts
rainseriesforecasts$fitted
plot(rainseriesforecasts)
rainseriesforecasts$SSE
HoltWinters(rainseries, beta=FALSE, gamma=FALSE, l.start=23.56)
#Forecast
library("forecast")

rainseriesforecasts2 <- forecast.HoltWinters(rainseriesforecasts, h=8)
rainseriesforecasts2
