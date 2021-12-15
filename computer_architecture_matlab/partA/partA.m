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

figure(1);
stem(X,sim_seconds);
ylabel('simulation seconds (ms)');

figure(2);
stem(X,CPI,'-g');
ylabel('CPI');

figure(3);
scatter(X,dcache_miss_rate,'filled');
hold on;
scatter(X,icache_miss_rate,'filled');
scatter(X,l2_miss_rate,'filled');
hold off;
title("Miss rates");
legend("L1 data cache","L1 instruction cache","L2 cache");

