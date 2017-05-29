function part4_tracking_plot( desired_state,estimated_state,motor_input,...
    folderName )

    fig=figure;
    subplot(2,1,1);
    plot(desired_state.time,desired_state.signals.values(:,1)); hold all;
    plot(estimated_state.time,estimated_state.signals.values(:,1)); hold all;
    title('\theta');xlabel('t(s)');
    subplot(2,1,2);
    plot(desired_state.time,desired_state.signals.values(:,2)); hold all;
    plot(estimated_state.time,estimated_state.signals.values(:,2));
    title('\alpha');xlabel('t(s)');
    saveas(fig,['./report/img/part4_experiments/' folderName ...
        '/alpha_theta.png']);

    fig=figure;
    subplot(2,1,1);
    plot(desired_state.time,desired_state.signals.values(:,3)); hold all;
    plot(estimated_state.time,estimated_state.signals.values(:,3)); hold all;
    title('\theta_{speed}');xlabel('t(s)');
    subplot(2,1,2);
    plot(desired_state.time,desired_state.signals.values(:,4)); hold all;
    plot(estimated_state.time,estimated_state.signals.values(:,4));
    title('\alpha_{speed}');xlabel('t(s)');
    saveas(fig,['./report/img/part4_experiments/' folderName ...
        '/alpha_theta_dot.png']);
    
    fig=figure;
    plot(motor_input.time,motor_input.signals.values);% hold all;
    ylim([-5 5]);
    xlabel('t(s)');ylabel('u(V)');
    title('Motor input')
    saveas(fig,['./report/img/part4_experiments/' folderName ...
        '/motor_input.png']);
end