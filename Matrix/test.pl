use strict;
use warnings;

use Matrix;

my @mat1 = ([1,2],[2,3]);
my @mat2 = ([2,3,4],[1,2]);

my $obj1 = Matrix->new(data => @mat1);
my $obj2 = Matrix->new(data => @mat2);