function sim = gaussianKernel(x1, x2, sigma)
x1 = x1(:); x2 = x2(:);

for i = 1:size(x1)
    for j = 1:size(x2)
        xny = (x1(i)-x2(j))^2;
        sim(i,j) = exp(-xny/(2*sigma^2));
    end
end
end

