import pandas as pd 
import numpy as np 
from matplotlib import pyplot as plt
from scipy.optimize import curve_fit


def logisitc(x, k, l, x0 = 0):
    return (l/(1 + np.exp(-k*(x-x0))))

def exponential(x,a,b,c):
    return a * np.exp(b * x - c) 

def plotGraph():
    plt.plot(predictDays, logisitc(predictDays, *popt), 'r--',label='logistic: k=%5.3f, l=%5.3f ,x0=%5.3f'% tuple(popt))
    plt.plot(predictDays, exponential(predictDays, *poptexp), 'g--',label='exp: a=%5.3f, b=%5.3f, c=%5.3f'% tuple(poptexp))
    plt.plot(days, file.loc['India'][3:,],'o',color='blue', label = 'data')    
    plt.xlabel('Days')
    plt.ylabel('Cases in India')
    plt.legend()
    plt.xlim((0,70))
    plt.grid()
    plt.savefig('images/py_curves.png')
    plt.show()


file = pd.read_csv("./COVID-19/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Confirmed.csv")

file.set_index('Country/Region', inplace=True)
cases = file.loc['India'][3:][:]
cases = np.array(cases).astype(np.float64)
days = (np.arange(cases.shape[0]).astype(np.float64))
predictDays = np.array(range(1,70))

# exp curve fit
poptexp, pcovexp = curve_fit(exponential, days, cases)

# logistic curve fitting
popt, pcov = curve_fit(logisitc, days, cases)
plotGraph()
