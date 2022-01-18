close all
clear
clc

sim_seconds=[0.083664 0.058458 0.513833 0.174763];
sim_seconds = sim_seconds .* 1000;
CPI =[1.673271 1.169160 10.276660 3.495270];
simulation_name=["SPECBZIP" "SPECMCF" "SPECSJENG" "SPECLIBM"];
dcache_miss_rate = [0.014311 0.002124 0.121831 0.060971];
icache_miss_rate = [0.000076 0.004844 0.000015 0.000094];
l2_miss_rate = [0.295248 0.209015 0.999978 0.999943];

X=categorical(simulation_name);
X=reordercats(X,["SPECBZIP" "SPECMCF" "SPECSJENG" "SPECLIBM"]);


figure(1);
b=barh(X,sim_seconds,0.9);
xtips1 = b(1).YEndPoints + 0.5;
ytips1 = b(1).XEndPoints;
labels1 = string(b(1).YData);
text(xtips1,ytips1,labels1,'VerticalAlignment','middle')
title('simulation seconds (ms)');

figure(2);
b = barh(X,CPI,0.9);
xtips1 = b(1).YEndPoints + 0.3;
ytips1 = b(1).XEndPoints;
labels1 = string(b(1).YData);
text(xtips1,ytips1,labels1,'VerticalAlignment','middle')
title('CPI');

miss_rates(1,:)=dcache_miss_rate;
miss_rates(2,:)=icache_miss_rate;
miss_rates(3,:)=l2_miss_rate;
figure(3);
b = barh(X,miss_rates,0.9);
xtips1 = b(1).YEndPoints + 0.01;
ytips1 = b(1).XEndPoints;
labels1 = string(b(1).YData);
text(xtips1,ytips1,labels1,'VerticalAlignment','middle')
xtips2 = b(2).YEndPoints + 0.01;
ytips2 = b(2).XEndPoints;
labels2 = string(b(2).YData);
text(xtips2,ytips2,labels2,'VerticalAlignment','middle')
xtips3 = b(3).YEndPoints + 0.01;
ytips3 = b(3).XEndPoints;
labels3 = string(b(3).YData);
text(xtips3,ytips3,labels3,'VerticalAlignment','middle')
title("Miss rates");
legend("L1 data cache","L1 instruction cache","L2 cache");
