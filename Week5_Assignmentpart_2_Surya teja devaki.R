#Installing package for Auto regressive aggregated moving average 
install.packages("forecast")
#Loading the package
library(forecast)
#Loading the dataset 
volcanodust<-scan("http://robjhyndman.com/tsdldata/annual/dvi.dat", skip=1)
#displaying the results of dataset
volcanodust
#crteating a time series model
volcanodust_ts<-ts(volcanodust,start =c(1500))
#Displaying the time series model 
volcanodust_ts
#plotting the time series model
plot(volcanodust_ts,xlab="Year",ylab= "volcano dust", main ="volcano dust in year")
#building a time series model with different frequency
volcanodust_ts2<-ts(volcanodust,frequency =2,start=c(1500))
#displaying the time series model with 
volcanodust_ts2
#plotting the time series model with different frequency
plot(volcanodust_ts2,xlab="Year",ylab= "volcano dust", main ="volcano dust in year with frequency 2")
#decomposing the time series model using different frequency
volcano_ts2_decompose<-decompose(volcanodust_ts2)
#displaying the decomposed time series model with different frequency
volcano_ts2_decompose
#plotting the decomposed the time series model
plot(volcano_ts2_decompose,xlab='Year',ylab='volcano dust')
#displaying seasonal data
volcano_ts2_decompose$seasonal
#adjusting by removing the seasonal component 
adujsted_volcano<-volcanodust_ts2 - volcano_ts2_decompose$seasonal
#plotting the adjusted volcano 
plot(adujsted_volcano, main = "adjusted tiime series model", xlab="year", ylab= "volcano dust")
#correlogram on time series model which dont have frequency
acf(volcanodust_ts,plot=FALSE)
#plotting  correlogram on time series model without frequency
acf(volcanodust_ts)
# Applying partial correlation on time series model without frequency
pacf(volcanodust_ts,lag.max=20,plot = FALSE)
#plotting the partial correlation time series model
pacf(volcanodust_ts,lag.max=20)
#using auto arima  to find best model
auto.arima(volcanodust_ts,ic = "bic")
#fitting the arima model
arima_volcanodust_ts<-arima(volcanodust_ts,order=c(2,0,0))
#displaying the results
arima_volcanodust_ts
#forecasting the data for next 30 years
forecast_auto_arima<-forecast(arima_volcanodust_ts,h=30)
#plotting the forecastes data
plot(forecast_auto_arima,xlab='year',ylab='volcano dust',main='forecasting the volcano dust')
