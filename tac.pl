use strict;
use warnings;
use File::ReadBackwards;

sub output($$)
{
	backward_reading($_[0]);
}

sub backward_reading
{
	my ($file) = @_;
	my $bw = File::ReadBackwards->new($file) or
		die "Something wrong with $file: $!";
	until ( $bw->eof )
	{print $bw->readline;}
}


my($arg1,$arg2) = ($ARGV[0],$ARGV[1]);
output($arg1,$arg2);