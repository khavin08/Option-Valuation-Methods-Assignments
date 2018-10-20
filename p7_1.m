randn('state',100);
%[0,1]
%Function parameters
S = 1; mu = 0.05; sigma = 0.5; L1 = 1e4; T1 = 1; dt1 = T1/L1; M = 1;
%Sets time range for Svals
tvals1 = [0:dt1:T];
%Calculates stock price over tvals1 with M rows, L1 columns
Svals1 = S*cumprod(exp((mu-0.5*sigma^2)*dt1 + sigma*sqrt(dt1)*randn(M,L1)),2);
Svals1 = [S*ones(M,1) Svals1]; % add initial asset price
%Takes each 100th element of Svals to plot 100 samples over interval as in 
%fig 7.5
s1 = Svals1(:,1:100:end);
%Makes range for plot 
t1 = 0:0.01:1;
%plot(t1,s1)


%[0,0.1]
L2 = 1e3; T2 = 0.1; dt2 = T2/L2; M = 1;
tvals2 = [0:dt2:T2];
Svals2 = S*cumprod(exp((mu-0.5*sigma^2)*dt2 + sigma*sqrt(dt2)*randn(M,L2)),2);
Svals2 = [S*ones(M,1) Svals2];
s2 = Svals2(:,1:10:end);
t2 = 0:0.001:0.1;
%plot(t2,s2)


%[0,0.01]
L3 = 1e2; T3 = 0.01; dt3 = T3/L3; M=1;
tvals3 = [0:dt3:T3];
Svals3 = S*cumprod(exp((mu-0.5*sigma^2)*dt3 + sigma*sqrt(dt3)*randn(M,L3)),2);
Svals3 = [S*ones(M,1) Svals3];
s3 = Svals3(:,1:1:end);
t3 = 0:0.0001:0.01;



subplot(3,1,1)
plot(t1,s1)
title("Asset path zoom")
subplot(3,1,2)
plot(t2,s2)
ylabel("Stock price")
subplot(3,1,3)
plot(t3,s3)
xlabel("Time")

