close all;
addpath('./COVID-19/csse_covid_19_data/csse_covid_19_time_series/');
data = csvread('time_series_19-covid-Confirmed.csv',16,5);
indiaCases = data(1,1:end-1);

Ndays = 60;
% Plot indian cases
plot(indiaCases, '.b','MarkerSize',12)
grid on; hold on;
xlabel('Days since 22 Jan');
ylabel('Cases Reported');
title('India Study');
xticks(7:7:Ndays);

% Exponential Fit
isolatedData = indiaCases(1:numel(indiaCases));
isolatedDays = 1:(numel(indiaCases));
model1 = fit(isolatedDays', isolatedData', 'exp1');

plot(model1(1:Ndays),'-.r','LineWidth',1);

