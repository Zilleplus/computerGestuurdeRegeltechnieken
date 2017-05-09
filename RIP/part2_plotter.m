function part2_plotter( sim_data,input_data,name )
    fig=figure;
    plot(sim_data.time,sim_data.Data(:,1));hold all;
    plot(sim_data.time,sim_data.Data(:,2));hold all;
    plot(sim_data.time,sim_data.Data(:,3));hold all;
    plot(sim_data.time,sim_data.Data(:,4));hold all;
    xlabel('t(s)');ylabel('state values');
    legend('\theta','\alpha','\theta_{speed}','\alpha_{speed}');
    saveas(fig,['./report/img/part2_LQR1/' name '_states.png']);

    fig=figure(2);clf;
    plot(input_data.time,input_data.Data(:,1));
    xlabel('t(s)'); ylabel('input voltage motor');
    saveas(fig,['./report/img/part2_LQR1/' name '_inputs.png']);
end

