use strict;
use warnings;

use Matrix;

my @mat1 = ([1,2],[2,3]);
my @mat2 = ([2,3],[1,2]);

my $obj1 = Matrix->new(\@mat1);
print($obj1->to_string());
print $obj1->{column_num};
my $obj2 = Matrix->new(\@mat2);

my $obj3 = $obj1*$obj2;
__END__

'123' =~ /(\d)/;
print $1;
'abc' =~ /(\d)/;
print $1;

print "\n";
my @arr = (1, 2, 4, 5);
foreach my $elem (@arr)
{
	print $elem;
}
#my @arr1 = @arr[0..$#arr-1];
my @arr1 = @arr[-1];

print "\n";
print @arr1;