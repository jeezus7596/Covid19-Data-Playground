close all;
addpath('./COVID-19/csse_covid_19_data/csse_covid_19_time_series/');
data = csvread('time_series_19-covid-Confirmed.csv',16,4);
indiaCases = data(1,1:end-1);

Ndays = Ndays;
dayVec = 0:Ndays;
startDate = datetime(2020,1,22);

% Plot indian cases
h = figure;
plot(indiaCases, '.b','MarkerSize',12)
grid on; hold on;
xlabel('Date');
ylabel('Cases Reported');
title('India Study');

% Make labels to days
xticks(1:7:Ndays)
xticklabels(generateLabels(startDate, Ndays/7));

% Exponential Fit
isolatedData = indiaCases(1:numel(indiaCases));
isolatedDays = 1:(numel(indiaCases));
model1 = fit(isolatedDays', isolatedData', 'exp1');

plot(dayVec,model1(dayVec),'-.r','LineWidth',1);

saveas(h,'.\images\graph.png');

