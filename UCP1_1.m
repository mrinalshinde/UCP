temperature = 5:5:30; % temperature varies in steps on 5 from 5 to 30
salinity = 10:5:35; % salinity varies in steps of 5 from 10 to 35
depth = 0:200:1000; % depth varies in steps of 200 from 0 to 1000


for i = 1:6
    u = temperature(i);
    for j = 1:6
        v = salinity(j);
        speedOfSound = c(v, u, depth); % calling the function
        subplot(3,2,i);
        hold on;
        plot(speedOfSound,-depth,'LineWidth',1.5);
        title(['For temperature = ',num2str(temperature(i))])

        ax = gca; % current axes
        ax.FontSize = 8;
        ax.XLim = [1430 1570];

        
        ylabel('Depth, z (m)')
        xlabel('Speed of sound, c (m/s)')
        
    end
end
% only visible to all functions in this file
function speedOfSound = c(S, T, Z)
speedOfSound = 1449.2 + 4.6*T - 0.055*T.^2 + 0.00029*T.^3 ...
               + 1.34*S - 46.9 - 0.01*T.*S + 0.35*T + 0.016*Z;
               
end



