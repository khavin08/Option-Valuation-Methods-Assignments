%CH07 Program for Chapter 7
%
% Plot discrete sample paths
randn('state',100)
clf
%%%%%%%%% Problem parameters %%%%%%%%%%%
S = 0.9; mu = 0.04537882; sigma = mu*4; L = 4000; T = 4; dt = T/L; M = 10;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tvals = [0:dt:T];
tvalsSum = [0:dt:T-dt];
Svals = S*cumprod(exp((mu-0.5*sigma^2)*dt + sigma*sqrt(dt)*randn(M,L)),2);
Svals = [S*ones(M,1) Svals]; % add initial asset price

%Initializes divisor removing last element from Svals since
%we do not need this element for the difference operator
divisor = Svals(:,1:end-1);
%Computes square return
SquareReturn = (diff(Svals,1,2)./divisor).^2;

%Computes sum of all squarereturns
SumOfSquares = cumsum(SquareReturn,2);
subplot(2,1,1);
plot(tvalsSum, SumOfSquares)
title('Running sum of square returns')
xlabel('t')
ylabel('Sum of square returns')
subplot(2,1,2);
plot(tvals,Svals)
title(sprintf('%d asset paths', M))
xlabel('t'), ylabel('S(t)')