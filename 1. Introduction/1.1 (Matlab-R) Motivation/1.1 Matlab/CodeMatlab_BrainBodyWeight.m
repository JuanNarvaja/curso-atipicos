%Log brain and log body weight of 28 species

load("brainbodyweightdata.mat")
figure
plot(bc(:,1),bc(:,2),'o','LineWidth',2,'MarkerSize',15)
xlabel('Log body weight','FontSize', 30)
ylabel('Log brain weight','FontSize', 30)
title('Plot of Log Brain Weight Versus Log Body Weight of 28 species','FontSize', 30)

%Plot the outliers
figure
plot(bc(:,1),bc(:,2),'o','LineWidth',2,'MarkerSize',15)
hold on 
plot(bc([6,16,25],1),bc([6,16,25],2),'*r','LineWidth',2,'MarkerSize',15)
plot(bc([14,17],1),bc([14,17],2),'*g','LineWidth',2,'MarkerSize',15)
xlabel('Log body weight','FontSize', 30)
ylabel('Log brain weight','FontSize', 30)
title('Plot of Log Brain Weight Versus Log Body Weight of 28 species','FontSize', 30)

%Regression line (least square)
mdl = fitlm(bc(:,1),bc(:,2),'intercept',true);
figure
plot(bc(:,1),bc(:,2),'o','LineWidth',2,'MarkerSize',15)
xlabel('Log body weight','FontSize', 30)
ylabel('Log brain weight','FontSize', 30)
title('Plot of Log Brain Weight Versus Log Body Weight of 28 species','FontSize', 30)
hold on
plot(bc(:,1),mdl.Fitted,'.-r','LineWidth',2)
plot(bc([6,16,25],1),bc([6,16,25],2),'*r','LineWidth',2,'MarkerSize',15)
plot(bc([14,17],1),bc([14,17],2),'*g','LineWidth',2,'MarkerSize',15)
lgd=legend('observations','regression line','outliers','outliers');
lgd.FontSize = 30;

%Regression line without the outliers
cleandata=bc([1:5,7:13,15,18:24,26:28],:);
mdl2 = fitlm(cleandata(:,1),cleandata(:,2),'intercept',true);
figure
plot(cleandata(:,1),cleandata(:,2),'o','LineWidth',2,'MarkerSize',15)
xlabel('Log body weight','FontSize', 30)
ylabel('Log brain weight','FontSize', 30)
title('Plot of Clean Data Log Brain Weight Versus Log Body Weight of 28 species','FontSize', 30)
hold on
plot(cleandata(:,1),mdl2.Fitted,'-b','LineWidth',2)
plot(bc([6,16,25],1),bc([6,16,25],2),'*r','LineWidth',2,'MarkerSize',15)
plot(bc([14,17],1),bc([14,17],2),'*g','LineWidth',2,'MarkerSize',15)
lgd=legend('observations','regression line','outliers','outliers');
lgd.FontSize = 30;

%Both in one graph 
figure
hold on
plot(cleandata(:,1),cleandata(:,2),'ob','LineWidth',2,'MarkerSize',15)
xlabel('Log body weight','FontSize', 30)
ylabel('Log brain weight','FontSize', 30)
title('Plot of Log Brain Weight Versus Log Body Weight of 28 species','FontSize', 30)
plot(bc(:,1),mdl.Fitted,'.-r','LineWidth',2)
plot(cleandata(:,1),mdl2.Fitted,'-b','LineWidth',2)
plot(bc([6,16,25],1),bc([6,16,25],2),'*r','LineWidth',2,'MarkerSize',15)
plot(bc([14,17],1),bc([14,17],2),'*g','LineWidth',2,'MarkerSize',15)
lgd=legend('clean data','regression line of all obs','regression line of clean data','outliers','outliers');
lgd.FontSize = 30;


