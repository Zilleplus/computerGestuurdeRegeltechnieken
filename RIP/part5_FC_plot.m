function part5_FC_plot( desired_state,estimated_state,motor_input,...
    folderName )

    fig=figure;
    subplot(2,1,1);
    plot(desired_state.time,desired_state.signals.values(:,1),'green'); hold all;
    plot(estimated_state.time,estimated_state.signals.values(:,1),'black'); hold all;
    title('\theta');xlabel('t(s)');
    ylim([-0.4 0.4]);
    legend('desired','measured');
    subplot(2,1,2);
    plot(desired_state.time,desired_state.signals.values(:,2),'green'); hold all;
    plot(estimated_state.time,estimated_state.signals.values(:,2),'black');
    title('\alpha');xlabel('t(s)');
    ylim([-0.08 0.08]);
    legend('desired','measured');
    saveas(fig,['./report/img/part5_experiments/' folderName ...
        '/alpha_theta.png']);

    fig=figure;
    subplot(2,1,1);
    plot(desired_state.time,desired_state.signals.values(:,3),'green'); hold all;
    plot(estimated_state.time,estimated_state.signals.values(:,3),'black'); hold all;
    title('\theta_{speed}');xlabel('t(s)');
    legend('desired','measured');
    ylim([-1 1]);
    subplot(2,1,2);
    plot(desired_state.time,desired_state.signals.values(:,4),'green'); hold all;
    plot(estimated_state.time,estimated_state.signals.values(:,4),'black');
    title('\alpha_{speed}');xlabel('t(s)');
    legend('desired','measured');
    ylim([-0.2 0.2]);
    saveas(fig,['./report/img/part5_experiments/' folderName ...
        '/alpha_theta_dot.png']);
    
    fig=figure;
    plot(motor_input.time,motor_input.signals.values,'black'); hold all;
    ylim([-5 5]);
    saveas(fig,['./report/img/part5_experiments/' folderName ...
        '/motor_input.png']);
end