% calculate MSE

years_total=[1960 1970 1990 2000 2020 2030 2040 2050 2060 2070 2080 2090 2100];
population_total_offical=[11127017 14493242 19863008 22433862 25190961 25683112 25436579 24736617 23606927 22229696 20734133 19098762 17492412];

years_total_dealed=years_total-1960;

p_logistic=exp(0.0136.*years_total_dealed+16.3171); %get value of logistic

MSE_logistic=sum((p_logistic-population_total_offical).^2)./length(years_total_dealed); %MSE of logistic


x = [1960 1970 1990 2000 2020];
y = [11127017 14493242 19863008 22433862 25190961];

% 插值拟合：使用 'pchip' 插值方法
xq = linspace(min(x), max(x), 400); % 查询点
interpFit = interp1(x, y, xq, 'pchip');

% 预测未来数据：2020到2100年，每20年间隔
future_years = 2030:10:2100;
future_predictions = interp1(x, y, future_years, 'pchip', 'extrap');

MSE_interpolation=sum((future_predictions-population_total_offical(1,6:13)).^2)/length(years_total_dealed);

p_polynomial= -2099.721515.*years_total.^2 + 8592667.485*years_total- 8764242081.09509;

MSE_polynomial=sum((p_polynomial-population_total_offical).^2)/length(years_total);

disp(MSE_polynomial)
disp(MSE_interpolation)
disp(MSE_logistic)