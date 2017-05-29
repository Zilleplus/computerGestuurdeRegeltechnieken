function part4_tracking_plot_step( desired_state,estimated_state,motor_input,...
    folderName,lowT,highT )
if nargin<6
    lowT=0; highT=desired_state.time(end);
end
    time=desired_state.time;
    selc=(time>=lowT & time<=highT);
    fig=figure;
    subplot(2,1,1);
    plot(desired_state.time(selc),desired_state.signals.values(selc,1)); hold all;
    plot(estimated_state.time(selc),estimated_state.signals.values(selc,1)); hold all;
    title('\theta');xlabel('t(s)');
    subplot(2,1,2);
    plot(desired_state.time(selc),desired_state.signals.values(selc,2)); hold all;
    plot(estimated_state.time(selc),estimated_state.signals.values(selc,2));
    title('\alpha');xlabel('t(s)');
    saveas(fig,['./report/img/part4_experiments/' folderName ...
        '/alpha_theta.png']);

    fig=figure;
    subplot(2,1,1);
    plot(desired_state.time(selc),desired_state.signals.values(selc,3)); hold all;
    plot(estimated_state.time(selc),estimated_state.signals.values(selc,3)); hold all;
    title('\theta_{speed}');xlabel('t(s)');
    subplot(2,1,2);
    plot(desired_state.time(selc),desired_state.signals.values(selc,4)); hold all;
    plot(estimated_state.time(selc),estimated_state.signals.values(selc,4));
    title('\alpha_{speed}');xlabel('t(s)');
    saveas(fig,['./report/img/part4_experiments/' folderName ...
        '/alpha_theta_dot.png']);
    
    fig=figure;
    plot(motor_input.time(selc),motor_input.signals.values(selc));% hold all;
    ylim([-5 5]);
    xlabel('t(s)');ylabel('u(V)');
    title('Motor input')
    saveas(fig,['./report/img/part4_experiments/' folderName ...
        '/motor_input.png']);
end