% 提供的数据
years = [1960, 1970, 1990, 2000, 2020];
population = [11127017, 14493242, 19863008, 22433862, 25190961];

% 将年份和人口数据进行对数转换
years_diff = years - years(1);
log_population = log(population);

% 使用线性回归进行logistic模型拟合
% 创建一个线性模型: log_population = a * years_diff + b
X = years_diff';
y = log_population';

% 使用线性模型进行拟合
mdl = fitlm(X, y, 'y ~ x1');

% 获取模型的系数
coefficients = mdl.Coefficients.Estimate;

% 从模型系数计算logistic函数的参数
a = coefficients(2);
b = coefficients(1);

% 使用logistic函数计算预测的人口
population_pred = exp(a * years_diff + b);

% 绘制原始数据和拟合曲线
figure;
scatter(years, population, 'r', 'filled');
hold on;
plot(years, population_pred, 'b-');
xlabel('Year');
ylabel('Population');
title('Logistic Model Fit to Population Data');
legend('Actual Data', 'Logistic Fit');
grid on;
hold off


years_2100=[2020:10:2100];
population_2100=[25190961 25683112 25436579 24736617 23606927 22229696 20734133 19098762 17492412];


future=1960:10:2100;
future_dealed=future-1960;
P_predict=exp(a.*future_dealed+b);
figure;
plot(years, population, 'r'); % 原始数据点
hold on;
plot(future, P_predict, 'b-'); 
scatter(future, P_predict, 'g','filled'); 
plot(years_2100,population_2100,'p')
xlabel('Year');
ylabel('Population');
title('logistic model Fit and Future Prediction to 2100');
legend('original','logistic prediction to 2100','data point of prediction','official prediction')
grid on;
hold on;
