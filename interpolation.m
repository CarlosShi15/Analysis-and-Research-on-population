%Given 
x = [1960 1970 1990 2000 2020];
y = [11127017 14493242 19863008 22433862 25190961];

% 插值拟合：使用 'pchip' 插值方法
xq = linspace(min(x), max(x), 400); % 查询点
interpFit = interp1(x, y, xq, 'pchip');

% 预测未来数据：2020到2100年，每20年间隔
future_years = 2020:20:2100;
future_predictions = interp1(x, y, future_years, 'pchip', 'extrap');

% 绘制原始数据、拟合曲线和未来预测
figure;
plot(x, y, 'ko', 'MarkerFaceColor', 'k'); % 原始数据点
hold on;
plot(xq, interpFit, 'b-', 'LineWidth', 2); % 拟合曲线
plot(future_years, future_predictions, 'r*-'); % 预测值
xlabel('Year');
ylabel('Population');
title('PCHIP Interpolation Fit and Future Prediction to 2100');
grid on;
hold on;


% 输出未来预测值
disp('Future Predictions from 2020 to 2100:');
for i = 1:length(future_years)
    fprintf('Year %d: %d\n', future_years(i), round(future_predictions(i)));
end


%计算平方偏差
% 给定数据
x = [1960 1970 1990 2000 2020];
y = [11127017 14493242 19863008 22433862 25190961];

% 使用 'pchip' 插值进行模型拟合
interp_values = interp1(x, y, x, 'pchip');

% 计算总平方偏差
ssd = sum((y - interp_values).^2);

% 显示总平方偏差
disp(['Sum of Squared Deviations (SSD) for the interpolation model: ', num2str(ssd)]);

%%
years_2100=2020:10:2100;
population_2100=[25190961 25683112 25436579 24736617 23606927 22229696 20734133 19098762 17492412];
plot(years_2100,population_2100,'g')
legend('Data', 'PCHIP Fit', 'Future Prediction', 'official data point','Location', 'Best');