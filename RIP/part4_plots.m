clc;clear all;
load('./measurement_data/exp1_ruis.mat');

fig=figure;
subplot(2,1,1);
plot(after_filter.time,after_filter.signals.values(:,1)); hold all;
plot(before_filter.time,before_filter.signals.values(:,1)); hold all;
title('\theta before and after the low pass filter');
legend('with filter','without filter');
xlabel('t(s)');
subplot(2,1,2);
plot(after_filter.time,after_filter.signals.values(:,2)); hold all;
plot(before_filter.time,before_filter.signals.values(:,2));
title('\alpha before and after the low pass filter');
legend('with filter','without filter');
xlabel('t(s)');
saveas(fig,'./report/img/part4_experiments/noise/simple_plot.png');

fig=figure;
subplot(2,1,1);
plot(after_filter.time,before_filter.signals.values(:,1)-after_filter.signals.values(:,1));
title('difference \theta before after filter');
xlabel('t(s)');
subplot(2,1,2);
plot(after_filter.time,before_filter.signals.values(:,2)-after_filter.signals.values(:,2)); hold all;
title('difference \alpha before after filter');
xlabel('t(s)');
saveas(fig,'./report/img/part4_experiments/noise/difference.png');

fig=figure;
subplot(2,1,1);
variance_theta = var(before_filter.signals.values(:,1)-after_filter.signals.values(:,1));
histogram(before_filter.signals.values(:,1)-after_filter.signals.values(:,1));
title(['\theta variance=' num2str(variance_theta)]);
subplot(2,1,2);
variance_alpha = var(before_filter.signals.values(:,2)-after_filter.signals.values(:,2));
histogram(before_filter.signals.values(:,2)-after_filter.signals.values(:,2));
title(['\alpha variance=' num2str(variance_alpha)]);
saveas(fig,'./report/img/part4_experiments/noise/histogram.png');
%% the manual tracking
clc;clear all;
load('./measurement_data/exp3_tracking_points.mat');
folderName='tracking_manual';
part4_tracking_plot( desired_state,estimated_state,motor_input,...
    folderName );

%% DO NOT USE THE WRONG MEASUREMENTS WITH OLD FC
% clc;clear all;
% load('./measurement_data/exp2_tracking_sine.mat');
%%
clc;clear all;
load('./measurement_data/exp2_tracking_sine_fc2.mat');
folderName='tracking_sine';
part4_tracking_plot( desired_state,estimated_state,motor_input,...
    folderName );
%%
clc;clear all;
load('./measurement_data/exp2_tracking_stair_fc2.mat');
folderName='tracking_stair';
part4_tracking_plot( desired_state,estimated_state,motor_input,...
    folderName );
%%
clc;clear all;
load('./measurement_data/exp4_disturbance_rejection_fc2_V2.mat');
folderName='disturbance_rejection';
part4_tracking_plot( desired_state,estimated_state,motor_input,...
    folderName );