clc
clear all
 close all
%  Load the data
% data = readtable('tunnel_data.csv');
GSI=linspace(20,40,30); %Q=[.07,.08,.09,.1,.11,.12,.13,.14,.15];

Q=linspace(.28,.81,30);
RMR=linspace(18,35,30);
% %% 
% q=mean(Q);
UCS=150;
for ll=1:length(Q)
Youngs_Modulus1(ll)=10*(Q(ll)*UCS/100)^(1/3);
%  Youngs_Modulus1(ll)=10*Q(ll)^1/3;
%  Youngs_Modulus1(ll)=8*Q(ll)^0.4;
%   Youngs_Modulus1(ll)=25*log(Q(ll));
end


% rmr=mean(RMR);
for kk=1:length(RMR)
Youngs_Modulus2(kk)=100^(((RMR(kk)-10)/40));
end

% gsi=mean(GSI);
sigma=150;
D=.8;
for i=1:length(GSI)
% Youngs_Modulus3(i)=1000*((1+D/2)/(1+exp((75+25*D-GSI(i))/11)));
% Youngs_Modulus3(i)=100*((1-D/2)/(1+exp((75+25*D-GSI(i))/11)));
% Youngs_Modulus3(i)=0.1451*exp(0.0654*GSI(i));
% Youngs_Modulus3(i)=((1-D/2)*10^((GSI(i)-10)/40));
Youngs_Modulus3(i)=sqrt(sigma/100)*10^((GSI(i)-10)/40);
end
% Create a figure
figure;

% Set the figure position to be centered on the screen
set(gcf, 'Units', 'normalized', 'Position', [0.25, 0.25, 0.5, 0.5]);

% Create 3 subplots in a row
ax1 = subplot(1,3,1);
% plot([0 1], [0 1]);
plot(Q, Youngs_Modulus1,'r.');
xlabel('Q');
ylabel('The Modulus of Deformation (GPa)');
title(' Q- based');

ax2 = subplot(1,3,2);
% plot([0 1], [0 2]);
plot(RMR, Youngs_Modulus2,'r.');
xlabel('RMR');
ylabel('The Modulus of Deformation (GPa)');
title(' RMR- based');

ax3 = subplot(1,3,3);
% plot([0 1], [0 3]);
plot(GSI, Youngs_Modulus3,'r.');
xlabel('GSI');
ylabel('The Modulus of Deformation (GPa)');
title(' GSI- based');

% Adjust subplot positions to center them in the figure
set(ax1, 'Position', [0.15, 0.3, 0.2, 0.5]);  % [left, bottom, width, height]
set(ax2, 'Position', [0.4, 0.3, 0.2, 0.5]);
set(ax3, 'Position', [0.65, 0.3, 0.2, 0.5]);

% Ensure tight spacing
set(gcf, 'Color', 'w'); % Optional: Set background to white