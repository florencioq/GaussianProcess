close all
clear all
N = 10;
n = 500;
ruido = 0.0000005;

s = 1
l = 1

a = -5;
b = 5;

X = a + (b-a).*rand(N,1);
y = sin(0.9*X);

K = gaussianKernel2(X, X, s, l);
L = chol(K+ruido*eye(N),'lower');

Xtest = linspace(-5, 5, n);

kt = gaussianKernel2(X, Xtest, s, l);
Lk = L \ kt;
mu = Lk' * (L \ y);

Kaa = K;
Kab = kt;
Kba = Kab';
Kbb = gaussianKernel2(Xtest, Xtest, s, l);
Mbda = Kba * ((Kaa+ruido*eye(N)) \ (y));

K_ = Kbb;
s2 = diag(K_) - sum(Lk.^2, 1)';
s = s2.^(1/2);

Vbda = Kbb - Kba * ((Kaa+ruido*eye(N)) \ Kab);

dVbda = diag(Vbda).^(1/2);

figure (1);
plot(X, y, 'o')
hold
plot(Xtest, sin(0.9*Xtest));
plot(Xtest, mu);
L = chol(Kbb+ruido*eye(n)-Lk'*Lk, 'lower');
for i=1:100
    f_post = Mbda + L*randn(n,1);
    plot(Xtest, f_post);
end

% figure 
L = chol(Kbb+ruido*eye(n), 'lower');
f_prior = L * randn(n,100);
% plot(Xtest, f_prior);
