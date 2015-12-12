package perl_calc;

sub calc_pi()
{
	my $real_pi = 3.14159265358979;
	my $my_pi = 0;
	my $step_sign = 1;
	my $i = 1;
	while(abs($real_pi - $my_pi) > 0.00001)
	{
		$my_pi += 4.0/$i * $step_sign;
		$step_sign *= -1;
		$i += 2;
	}
	return $my_pi;
}

1;