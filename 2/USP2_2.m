%file saved as USP2_2.m
frequency = 0.1:10000; 
temperature = 15;
salinity = 35; 
ph = 8; 
depth_max = 0.5; 
p1 = 1; 
p2 = 1 - (1.37 * 10^-4 * depth_max) + (6.2 * 10^-9 * depth_max^2);
p3 = 1 - (3.83 * 10^-5 * depth_max) + (4.9 * 10^-10 * depth_max^2);
c = 1412 + 3.21*temperature + 1.19*salinity + 0.0167*depth_max;
f1 = 2.8 * sqrt((salinity/35)) * 10^(4 - (1245/(temperature+273)));
f2 = (8.17 * 10^(8-1990/(temperature+273))) / (1 + 0.0018*(salinity-35));
a1 = ((8.686/c) * 10^(0.78*ph - 5));
a2 = 21.44*(salinity/c)*(1 + 0.025*temperature);
if temperature <= 20
a3 = (4.937 * 10^-4) - (2.59 * 10^-5)*temperature ...
    + (9.11 * 10^-7)*(temperature^2) - (1.5 *10^-8)*(temperature^3);
else
a3 = (3.964 * 10^-4) - (1.146 * 10^-5)*temperature ...
    + (1.45 * 10^-7)*(temperature^2) - (6.5.*10^-10)*(temperature^3);
end
boric_Acid = ((a1.*p1.*f1.*frequency.^2)./((f1.^2)+(frequency.^2)));
magnesium_Sulphate = ((a2.*p2.*f2.*frequency.^2)./((f2.^2)+(frequency.^2)));
pure_Water = (a3.*p3.*frequency.^2);
all_Contributions = boric_Acid + magnesium_Sulphate + pure_Water;

loglog(frequency,boric_Acid,'--','color','r','linewidth',2), hold on; 
loglog(frequency,magnesium_Sulphate,'--','color','green','linewidth',2), hold on; 
loglog(frequency,pure_Water,'--','color','yellow','linewidth',2), hold on;
loglog(frequency,all_Contributions,'blue','linewidth',2); 
xlabel('Frequency (KHz)'); ylabel('Attenuation coefficient (dB/Km)');
legend('Boric Acid','Magnesium Sulphate','Pure Water','All Contributions'); 
grid on;