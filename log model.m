% 给定数据
x = [1960 1970 1990 2000 2020];
y = [11127017 14493242 19863008 22433862 25190961];

% 转换x以使其适合对数模型（以1900年为基准）
x_transformed = x - 1900;

% 定义对数模型函数
logModel = @(b, x) b(1) * log(b(2) * x) + b(3);

% 初始参数估计（随便猜的一个起点）
initialParams = [1e6, 1e-3, 1e7];

% 使用nlinfit进行拟合
options = statset('nlinfit');
options.RobustWgtFun = 'bisquare';  % 使用robust option可能会提高拟合质量
beta = nlinfit(x_transformed, y, logModel, initialParams, options);

% 显示拟合参数
disp('拟合得到的参数值:');
disp(['a = ', num2str(beta(1))]);
disp(['b = ', num2str(beta(2))]);
disp(['c = ', num2str(beta(3))]);

% 绘制原始数据和拟合曲线
figure;
plot(x, y, 'ko', 'MarkerFaceColor', 'k');  % 原始数据点
hold on;
x_fit = linspace(min(x_transformed), max(x_transformed), 400) + 1900;  % 生成拟合曲线的x值
y_fit = logModel(beta, x_fit - 1900);  % 计算拟合曲线的y值
plot(x_fit, y_fit, 'b-', 'LineWidth', 2);  % 拟合曲线
xlabel('Year');
ylabel('Population');
title('Logarithmic Model Fit to Population Data');
legend('Data', 'Logarithmic Fit', 'Location', 'Best');
grid on;


%%
% 预测年份
future_years = 2020:20:2100;
% 转换预测年份以适应模型
future_years_transformed = future_years - 1900;

% 使用模型进行预测
future_predictions = logModel(beta, future_years_transformed);

% 绘制原始数据、拟合曲线和预测
figure;
plot(x, y, 'ko', 'MarkerFaceColor', 'k');  % 原始数据点
hold on;
x_fit = linspace(min(x_transformed), max(x_transformed), 400) + 1900;  % 生成拟合曲线的x值
y_fit = logModel(beta, x_fit - 1900);  % 计算拟合曲线的y值
plot(x_fit, y_fit, 'b-', 'LineWidth', 2);  % 拟合曲线
plot(future_years, future_predictions, 'r*-');  % 预测值
xlabel('Year');
ylabel('Population');
title('Logarithmic Model Fit and Prediction to 2100');
legend('Data', 'Logarithmic Fit', 'Future Prediction', 'Location', 'Best');
grid on;

% 输出预测值
disp('Yearly Predictions from 2020 to 2100:');
for i = 1:length(future_years)
    fprintf('Year %d: %f\n', future_years(i), future_predictions(i));
end


