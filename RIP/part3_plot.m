function  part3_plot( sim_data,sim_data_estimator,input_data,plotnames )
    fig=figure(1);clf;
    plot(sim_data.time,sim_data.Data(:,1));hold all;
    plot(sim_data.time,sim_data.Data(:,2));hold all;
    plot(sim_data.time,sim_data.Data(:,3));hold all;
    plot(sim_data.time,sim_data.Data(:,4));hold all;
    title('states');xlabel('t(s)');
    legend('\theta','\alpha','\theta_{speed}','\alpha_{speed}');
    saveas(fig,['./report/img/part3_LQR2/' plotnames ...
        '_states.png']);

    fig=figure(2);clf;
    plot(input_data.time,input_data.Data(:,1))
    title('input');
    xlabel('t(s)');ylabel('u');
    ylim([-5 5]);
    saveas(fig,['./report/img/part3_LQR2/' plotnames ...
        '_input.png']);

    fig=figure(3);clf;
    plot(sim_data.time,sim_data.Data(:,3));hold all;
    plot(sim_data_estimator.time,sim_data_estimator.Data(:,3)); hold all;
    plot(sim_data.time,sim_data.Data(:,4));hold all;
    plot(sim_data_estimator.time,sim_data_estimator.Data(:,4)); hold all;
    title('states caluclated by the estimator');
    legend('\theta_{speed}','estimator \theta_{speed}','\alpha_{speed}', ...
        'estimator \alpha_{speed}');
    xlabel('t(s)');
    saveas(fig,['./report/img/part3_LQR2/' plotnames ...
        '_estimated_states.png']);
end

