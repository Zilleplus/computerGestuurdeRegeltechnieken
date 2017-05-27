clc;clear all;
load('./measurement_data/expb_1_ruis.mat');

fig=figure;
subplot(2,1,1);
%plot(after_filter.time,after_filter.signals.values(:,1)); hold all;
plot(befor_filter.time,befor_filter.signals.values(:,1)-mean(befor_filter.signals.values(:,1))); hold all;
title('noise on \theta');
%legend('\theta')
%legend('with filter','without filter');
xlabel('t(s)');
ylabel('V');
subplot(2,1,2);
%plot(after_filter.time,after_filter.signals.values(:,2)); hold all;
plot(befor_filter.time,befor_filter.signals.values(:,2)-mean(befor_filter.signals.values(:,2)));
title('noise on \alpha');
%legend('\alpha');
xlabel('t(s)');
ylabel('V');
saveas(fig,'./report/img/part4_experiments/noise/simple_plot_2.png');

% %M: niet nuttig
% fig=figure;
% subplot(2,1,1);
% plot(after_filter.time,befor_filter.signals.values(:,1)-after_filter.signals.values(:,1));
% title('difference \theta before after filter');
% xlabel('t(s)');
% subplot(2,1,2);
% plot(after_filter.time,befor_filter.signals.values(:,2)-after_filter.signals.values(:,2)); hold all;
% title('difference \alpha before after filter');
% xlabel('t(s)');
% saveas(fig,'./report/img/part4_experiments/noise/difference_2.png');

%M: frequentie plot is nuttiger
fig=figure;
subplot(2,1,1);
F=linspace(0,200,length(after_filter.time));
semilogy(F,abs(fft(befor_filter.signals.values(:,1)-mean(befor_filter.signals.values(:,1)))));
title('Frequency spectrum of noise on \theta');
xlabel('f [Hz]');
xlim([0 100])
ylim([10^-3 1])
subplot(2,1,2);
semilogy(F,abs(fft(befor_filter.signals.values(:,2)-mean(befor_filter.signals.values(:,2)))));
title('Frequency spectrum of noise on \alpha');
xlabel('f [Hz]');
xlim([0 100]);
ylim([10^-3 1])
saveas(fig,'./report/img/part4_experiments/noise/freq_spec.png');

fig=figure;
subplot(2,1,1);
variance_theta = var(befor_filter.signals.values(:,1)-mean(befor_filter.signals.values(:,1)))%-after_filter.signals.values(:,1));
histogram(befor_filter.signals.values(:,1)-mean(befor_filter.signals.values(:,1)));%-after_filter.signals.values(:,1));
title(['\theta variance=' num2str(variance_theta)]);
xlabel('V');
xlim([-3*10^-3 3*10^-3])
subplot(2,1,2);
variance_alpha = var(befor_filter.signals.values(:,2)-mean(befor_filter.signals.values(:,2)))%-after_filter.signals.values(:,2));
histogram(befor_filter.signals.values(:,2)-mean(befor_filter.signals.values(:,2)));%-after_filter.signals.values(:,2));
xlabel('V');
title(['\alpha variance=' num2str(variance_alpha)]);
saveas(fig,'./report/img/part4_experiments/noise/histogram_2.png');
%% the filter Fc=1Hz
clc;clear all;
load('./measurement_data/expb_5_F_0_5.mat');
folderName='FC05';
part5_FC_plot( desired_state,estimated_state,motor_input,...
    folderName );
%% the filter Fc=1Hz
clc;clear all;
load('./measurement_data/expb_5_F_1_0.mat');
folderName='FC1';
part5_FC_plot( desired_state,estimated_state,motor_input,...
    folderName );
%% the filter Fc=2Hz
clc;clear all;
load('./measurement_data/expb_5_F_2_0.mat');
folderName='FC2';
part5_FC_plot( desired_state,estimated_state,motor_input,...
    folderName );
%% the filter Fc=3Hz
clc;clear all;
load('./measurement_data/expb_5_F_3_0.mat');
folderName='FC3';
part5_FC_plot( desired_state,estimated_state,motor_input,...
    folderName );
%% the filter Fc=4Hz
clc;clear all;
load('./measurement_data/expb_5_F_4_0.mat');
folderName='FC4';
part5_FC_plot( desired_state,estimated_state,motor_input,...
    folderName );
%% the filter Fc=8Hz
clc;clear all;
load('./measurement_data/expb_5_F_8_0.mat');
folderName='FC8';
part5_FC_plot( desired_state,estimated_state,motor_input,...
    folderName );
