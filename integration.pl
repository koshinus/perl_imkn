use Inline 'C';

$n = 50000000;

#my $s = func($n);
#my $s = opt($n);

#print $s;
 
print "9 + 16 = ", add(9, 16), "\n";
print "9 - 16 = ", subtract(9, 16), "\n";
 
sub func
{
	my $n = shift;
	my $s = 0;
	$s += 1/$_ for 1 .. $n;
}

__END__
__C__
int add(int x, int y) {
  return x + y;
}
 
int subtract(int x, int y) {
  return x - y;
}
double opt(int n)
{
	double s = 0;
	int i;
	for(i = 1; i <= n; i++)
		s+= 1.0/i;
	return s;
}