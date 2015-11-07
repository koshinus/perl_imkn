use strict;
use warnings;

sub output($$)
{
	backward_reading($_[0]);
}

sub backward_reading
{
	my ($file) = @_;
	open FILE, $file
		or die "Failed to open input.txt: $!\n";
	my $str = "";
	my $i = 0;
	while($i != -s $file)
	{
		$i++;
		seek(FILE, -$i, 2);
		my $symbol = getc(FILE);
		if($symbol eq "\n")
		{
			$str = $str."\r\n";
			print $str;
			$str = "";
		}
		else
		{
			$str = $symbol.$str;
		}
	}
	print $str;
	close FILE;
}

my($arg1,$arg2) = ($ARGV[0],$ARGV[1]);
output($arg1,$arg2);