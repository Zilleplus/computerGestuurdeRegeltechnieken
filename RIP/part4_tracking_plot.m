function part4_tracking_plot( desired_state,estimated_state,motor_input,...
    folderName )

    fig=figure;
    subplot(2,1,1);
    plot(desired_state.time,desired_state.signals.values(:,1)); hold all;
    plot(estimated_state.time,estimated_state.signals.values(:,1)); hold all;
    title('\theta');
    subplot(2,1,2);
    plot(desired_state.time,desired_state.signals.values(:,2)); hold all;
    plot(estimated_state.time,estimated_state.signals.values(:,2));
    title('\alpha');
    saveas(fig,['./report/img/part4_experiments/' folderName ...
        '/alpha_theta.png']);

    fig=figure;
    subplot(2,1,1);
    plot(desired_state.time,desired_state.signals.values(:,3)); hold all;
    plot(estimated_state.time,estimated_state.signals.values(:,3)); hold all;
    title('\theta_{speed}');
    subplot(2,1,2);
    plot(desired_state.time,desired_state.signals.values(:,4)); hold all;
    plot(estimated_state.time,estimated_state.signals.values(:,4));
    title('\alpha_{speed}');
    saveas(fig,['./report/img/part4_experiments/' folderName ...
        '/alpha_theta_dot.png']);
    
    fig=figure;
    plot(motor_input.time,motor_input.signals.values); hold all;
    saveas(fig,['./report/img/part4_experiments/' folderName ...
        '/motor_input.png']);
end