function sim = gaussianKernel2(x1, x2, s, l)
x1 = x1(:); x2 = x2(:);

for i = 1:size(x1)
    for j = 1:size(x2)
        xny = (x1(i)-x2(j))^2;
        sim(i,j) = s^2*exp(-xny/(2*l^2));
    end
end
end

