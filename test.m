clc
clear all
%% load data
load tunnel_datam50ago.mat
load tunnel_data1m.mat
load tunnel_data2m.mat
ytrain=[data(:,5)];
XTRAIN1 = [data1(:,1:3)];
xtest1=[data1(:,2:3)];
XTRAIN2 = [data2(:,1:3)];
xtest2=[data2(:,2:3)];
%% estimation by GPR
 Es_GPR=estimation_Ed__by_GPR(ytrain,XTRAIN1,xtest1);
Ed_GPR=estimation_Ed__by_GPR(ytrain,XTRAIN2,xtest2);
%% plot

X_interpolated=linspace(14600,14650,30);
set(gcf, 'Units', 'normalized', 'Position', [0.25, 0.25, 0.5, 0.5]);
ax1 = subplot(2,1,1);
 plot(X_interpolated,ytest,'r:');
hold on;
plot(X_interpolated,Es_GPR,'b');
legend('E_s  by TSP(Gpa)','GPR predicted values(Gpa)','Location','Best');
hold off
xlabel('chainage (m)');
ylabel('E_s (GPa)');
xlim([14600, 14650]); 
ylim([0, 60]); 
 %% plot E_d
X_interpolated=linspace(14600,14650,30);
set(gcf, 'Units', 'normalized', 'Position', [0.25, 0.25, 0.5, 0.5]);
ax1 = subplot(2,1,1);
 plot(X_interpolated,ytest,'r:');
hold on;
plot(X_interpolated,Ed_GPR,'b');
legend('E_d  by TSP(Gpa)','GPR predicted values(Gpa)','Location','Best');
hold off
xlabel('chainage (m)');
ylabel('E_d (GPa)');
xlim([14600, 14650]); 
ylim([0, 60]); 
%% zoom
 X_interpolated=linspace(14600,14650,30);
ax_inset = axes('Position', [0.15, 0.65, 0.25, 0.15]); % ?????? inset
box on;

plot(X_interpolated,ytest,'r:');
hold on;
plot(X_interpolated,ypred,'b');
xlim([14603 14605]); 
ylim([0 70]); 