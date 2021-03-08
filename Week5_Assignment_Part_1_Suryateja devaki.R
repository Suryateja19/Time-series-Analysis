#loading the data 
births <- scan("http://robjhyndman.com/tsdldata/data/nybirths.dat")
#for displaying the results of births data
births
#for creating time series model for data in births resulting in time series per month from 1946
births_ts<-ts(births,frequency = 12,start=c(1946,1))
#for displaying the time series model
births_ts
#To plot the time series model from 1946 to 1960
plot(births_ts, main="Time series", color='black')
#for decomosing the time series models in its components
components_births_decompose<-decompose(births_ts)
#displaying the results 
components_births_decompose
#for plottinng the  decoposed time series model
plot(components_births_decompose)
# displaying the seasonal component of the time series model
components_births_decompose$seasonal
#Removing the seasonal components from the time series model 
Adjusting_comp_births<-births_ts - components_births_decompose$seasonal
#Plotting the adjusted  time series 
plot(Adjusting_comp_births,main='seasonally adjustedtime series model ')

