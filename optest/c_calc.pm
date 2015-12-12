package c_calc;
use Inline C;

1;
__END__

double my_abs(double num)
{
	return (num > 0)? num : -num;
}

double calc_pi()
{
	double real_pi = 3.14159265358979;
	double my_pi = 0;
	double step_sign = 1;
	unsigned long long i = 1;
	while(my_abs(real_pi - my_pi) > 0.00000001)
	{
		my_pi += 4.0/i * step_sign;
		step_sign *= -1;
		i += 2;
		printf("%lf\n", my_pi);
	}
	return my_pi;
}