function [res] = interp1(x, y, xi)
	cur = 2;
	res = zeros(length(xi), 1);
	l = x(1);
	r = x(2);
	for i = 2:length(xi)-1
		if (xi(i) > r)
			cur = cur + 1;
			l = r;
			r = x(cur);
		end
		% now: l <= x < r
		k = (xi(i) - l) / (r - l);
		res(i) = k * y(cur) + (1 - k) * y(cur - 1);
    end
    res(1) = y(1);
    res(length(xi)) = y(length(y));
end