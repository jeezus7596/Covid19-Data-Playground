import pandas as pd 
import numpy as np 
from matplotlib import pyplot as plt
from scipy.optimize import curve_fit
file = pd.read_csv("./COVID-19/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Confirmed.csv")

file.set_index('Country/Region', inplace=True)
cases = file.loc['India'][3:][:]
cases = np.array(cases).astype(np.float64)
days = (np.arange(cases.shape[0]).astype(np.float64))
predictDays = np.array(range(1,70))


def logisitc(x, k, l, x0 = 0):
    return (l/(1 + np.exp(-k*(x-x0))))

def exponential(x, a , b, c):
    return a * np.exp(-b * x) + c

plt.plot(days, file.loc['India'][3:,],'o',color='blue', label = 'data')    

#popt, pcov = curve_fit(exponential, days, cases)

#logistic curve fitting
popt, pcov = curve_fit(logisitc,days, cases)

plt.plot(predictDays, logisitc(predictDays, *popt), 'r-',label='fit: k=%5.3f, l=%5.3f ,x0=%5.3f'% tuple(popt))
plt.xlabel('Days')
plt.ylabel('Cases in India')
plt.legend()
plt.xlim((0,70))
plt.grid()
plt.savefig('images/py_curves.png')
plt.show()
