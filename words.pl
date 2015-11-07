use strict;
use warnings;

sub main($$)
{
	statistic($_[0]);
}

sub statistic
{
	my ($file) = @_;
	our %hash = ();
	open FILE, $file
		or die "Failed to open $file: $!\n";
	while(our $line = <FILE>)
	{
		my @array = split(/[,.\s]+/, $line);
		foreach our $str (@array)
		{
			if(exists($hash{$str}))
			{
				$hash{$str}++;
			}
			else
			{
				$hash{$str} = 1;
			}
		}
	}
	close FILE;
	for my $key (sort { $hash{$b} <=> $hash{$a} } keys %hash) 
	{ 
		print "$key:$hash{$key}\n"; 
	}
	#while(my ($key,$value) = each (sort({$hash{$a} <=> $hash{$b}} keys %hash)))
}

my($arg1,$arg2) = ($ARGV[0],$ARGV[1]);
main($arg1,$arg2);