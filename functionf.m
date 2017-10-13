close all
clear all
n = 50
Xtest = linspace(-5,5,n);
K = gaussianKernel(Xtest, Xtest, 1);
% K = eye(n)
L = chol(K+1e-6*eye(n),'lower');
f_prior = L*normrnd(0,1,n,10);
plot (Xtest, f_prior, '-')