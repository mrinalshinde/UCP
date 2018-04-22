frequency = 50;
grazingAngle = 0:0.01:pi/2;
n = length(grazingAngle);
theta = linspace(0,90,n);
for i = 0:1:3
  f = 50*(2^i);
  subplot(2,2,i+1);
for j=0:3
vW = 5*(2^j);
beta = 4*((vW+2)/(vW+1)) + (2.5*((f+0.1)^(-1/3))-4) ...
    .* cos(grazingAngle) .^ (1/8);
sS = 10*log10(((tan(grazingAngle)).^beta) ...
    .*((1+vW)^2)*((f+0.1)^(vW/150))*(10^(-5.05)));
plot(theta,sS,'LineWidth',2)
title(['Frequency = ',num2str(f),' kHz'])
xlabel('Grazing angle [deg]'),
ylabel('Surface reverberation [dB/m^2]') 
ax = gca;
ax.FontSize = 16;
ax.YLim = [-70 10];
hold on
end
end
hL = legend('WS = 5kn','WS = 10kn','WS = 20kn','WS = 40kn');
newPosition = [0.85 0.85 0.2 0.1];
newUnits = 'normalized';
set(hL,'Position', newPosition,'Units', newUnits);
hL.FontSize = 15;
