close all;

% read some data
addpath('./COVID-19/csse_covid_19_data/csse_covid_19_time_series/');
data = csvread('time_series_19-covid-Confirmed.csv',16,4);
indiaCases = data(1,1:end-1);

% Some vector definitions
Ndays = 60;
dayVec = 0:Ndays;
startDate = datetime(2020,1,22);

% Plot indian cases
h = figure;
plot(dayVec(1:numel(indiaCases)),indiaCases, '.b','MarkerSize',12)
grid on; hold on;
xlabel('Date');
ylabel('Cases Reported');
title('India Study');

% Make labels to days
xticks(0:7:Ndays)
xticklabels(generateLabels(startDate, Ndays/7));

% Exponential Fit
isolatedData = indiaCases(1:numel(indiaCases));
isolatedDays = 0:(numel(indiaCases)-1);
model1 = fit(isolatedDays', isolatedData', 'exp1');

% plot fitted curve
plot(dayVec,model1(dayVec),'-.r','LineWidth',1);

% 4 days ago prediction
isolatedData = indiaCases(1:numel(indiaCases)-5);
isolatedDays = 0:(numel(indiaCases)-1-5);
model2 = fit(isolatedDays', isolatedData', 'exp1');

plot(dayVec,model2(dayVec),'-.g','LineWidth',1);
legend('Actual Data','Current Trend', 'Trend 5 days ago');


% Save data
saveas(h,'.\images\graph.png');
modelOverviewStr = evalc('model1');
modelOverviewStr = regexprep(modelOverviewStr, '%', '%%');
fid = fopen('README.md','w+');

fileData = '# Current Fits\n\n![](./images/graph.png)\n\n';
fprintf(fid,fileData);
fprintf(fid, "\n\n### Exp\n\n```\n" + modelOverviewStr + "\n```");

modelOverviewStr = evalc('model2');
modelOverviewStr = regexprep(modelOverviewStr, '%', '%%');

fprintf(fid, "\n\n### 5th Order Poly\n\n```\n" + modelOverviewStr + "\n```");
fclose(fid);