clear
close all
clc

%% SPECLIBM

l1D_size =["32KB" "64KB" "128KB" "256KB"];
CPI = [2.656 2.642 2.636 2.621];

figure(1)
clf
tiledlayout(3,1);
nexttile
plot(CPI,'-b.','MarkerSize',16);
xticks(1:4);
xticklabels(l1D_size);
title('L1Isize = 32KB, L2size = 512KB, L1D = L1I = 1-way assoc,L2 = 2-way assoc,cacheline = 64');
xlabel('L1 data cache size');
ylabel('CPI');

l1I_size =["32KB" "64KB" "128KB" "256KB"];
CPI = [2.642 2.642 2.642 2.642];

nexttile
plot(CPI,'-b.','MarkerSize',16);
xticks(1:4);
xticklabels(l1I_size);
title('L1Dsize = 64KB, L2size = 512KB, L1D = L1I = 1-way assoc,L2 = 2-way assoc,cacheline = 64');
xlabel('L1 instruction cache size');
ylabel('CPI');

l2_size =["256KB" "512KB" "1MB" "2MB" "4MB"];
CPI = [2.625 2.636 2.636 2.635 2.633];

nexttile
plot(CPI,'-b.','MarkerSize',16);
xticks(1:4);
xticklabels(l2_size);
title('L1Dsize = 128KB, L1Isize = 128KB, L1D = L1I = 1-way assoc,L2 = 2-way assoc,cacheline = 64');
xlabel('L2 cache size');
ylabel('CPI');

l1D_associativity =["1-way" "2-way" "4-way"];
CPI = [2.635 2.624 2.624];

figure(2)
clf
tiledlayout(2,2);
nexttile
plot(CPI,'-b.','MarkerSize',16);
xticks(1:4);
xticklabels(l1D_associativity);
title('L1Dsize = 128KB, L1Isize = 128KB, L2size=1MB, L1I = 1-way assoc,L2 = 2-way assoc,cacheline = 64');
xlabel('L1 data cache associativity');
ylabel('CPI');

l1I_associativity =["1-way" "2-way" "4-way"];
CPI = [2.635 2.637 2.637];

nexttile
plot(CPI,'-b.','MarkerSize',16);
xticks(1:4);
xticklabels(l1I_associativity);
title('L1Dsize = 128KB, L1Isize = 128KB, L2size=1MB, L1D = 1-way assoc,L2 = 2-way assoc,cacheline = 64');
xlabel('L1 instruction cache associativity');
ylabel('CPI');

l2_associativity =["1-way" "2-way" "4-way"];
CPI = [2.624 2.624 2.636];

nexttile
plot(CPI,'-b.','MarkerSize',16);
xticks(1:4);
xticklabels(l2_associativity);
title('L1Dsize = 128KB, L1Isize = 128KB, L2size=1MB, L1D = L1I = 2-way assoc, cacheline = 64');
xlabel('L2 cache associativity');
ylabel('CPI');

cache_line =["32" "64" "128" "256"];
CPI = [3.921 2.624 1.991 1.655];

nexttile
plot(CPI,'-b.','MarkerSize',16);
xticks(1:4);
xticklabels(cache_line);
title('L1Dsize = 128KB, L1Isize = 128KB, L2size=1MB, L1D = L1I = 2-way assoc, L2= 4-way assoc');
xlabel('Cache line (bytes)');
ylabel('CPI');


