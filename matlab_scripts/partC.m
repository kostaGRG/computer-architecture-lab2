close all
clear
clc

%% COST INITIALIZATION
costs = zeros(22,1);
costs(1) = cost(32,64,512,1,1,2);
costs(2) = cost(64,64,512,1,1,2);
costs(3) = cost(128,64,512,1,1,2);
costs(4) = cost(256,64,512,1,1,2);
costs(5) = cost(64,32,512,1,1,2);
costs(6) = cost(64,128,512,1,1,2);
costs(7) = cost(64,256,512,1,1,2);
costs(8) = cost(128,128,256,1,1,2);
costs(9) = cost(128,128,512,1,1,2);
costs(10) = cost(128,128,1024,1,1,2);
costs(11) = cost(128,128,2048,1,1,2);
costs(12) = cost(128,128,4096,1,1,2);
costs(13) = cost(128,128,1024,2,1,2);
costs(14) = cost(128,128,1024,4,1,2);
costs(15) = cost(128,128,1024,1,2,2);
costs(16) = cost(128,128,1024,1,4,2);
costs(17) = cost(128,128,1024,2,2,1);
costs(18) = cost(128,128,1024,2,2,2);
costs(19) = cost(128,128,1024,2,2,4);
costs(20) = costs(19);
costs(21) = costs(19);
costs(22) = costs(19);

%% SPECBZIP
data = readmatrix('./results/specbzip.txt');
CPI_BZIP = data(:,2);
%% SPECMCF
data = readmatrix('./results/specmcf.txt');
CPI_MCF = data(:,2);
%% SPECLIBM
data = readmatrix('./results/speclibm.txt');
CPI_LIBM = data(:,2);
%% SPECSJENG
data = readmatrix('./results/specsjeng.txt');
CPI_SJENG = data(:,2);
%% PLOT
scatter(costs,CPI_BZIP,'filled');
ylabel('CPI');
xlabel('cost');
hold on;
scatter(costs,CPI_MCF,'filled');
scatter(costs,CPI_LIBM,'filled');
scatter(costs,CPI_SJENG,'filled');
legend('BZIP','MCF','LIBM','SJENG');


%% COST FUNCTION
function K = cost(l1d_size,l1i_size,l2_size,l1d_assoc,l1i_assoc,l2_assoc)
    K = 2.5*((l1i_size+l1d_size)/32) + l2_size/32 + 1.4^log2(l1i_assoc) + 1.4^log2(l1d_assoc) + 1.4^log2(l2_assoc);
end
