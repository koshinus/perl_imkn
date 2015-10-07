use warnings;
use strict;

sub output($$)
{
	print rev_pol_not($_[0]);
	print "\n";
	print eval($_[0]);
}

sub priority
{
	my ($operator) = @_;
	if($operator eq "(") 		{return 0;}
	elsif ($operator eq ")") 	{return 0;}
	elsif ($operator eq "+") 	{return 1;}
	elsif ($operator eq "-") 	{return 1;}
	elsif ($operator eq "*") 	{return 2;}
	elsif ($operator eq "/") 	{return 2;}
	else 	{return 0;}
}

sub rev_pol_not
{
	my ($str) = @_;
	my @list = ();
	my @array = $str =~ m{ (\d+[.]?\d*) | ([-/*,()+]) }gx;
	my $resStr = "";
	foreach our $symbol (@array)
	{	
		if(priority($symbol) == 0)
		{
			if($symbol eq "(")
			{
				push(@list, $symbol);
			}
			elsif($symbol eq ")")
			{
				while($list[-1] ne "(")
				{
					$resStr = $resStr." ".pop(@list);
				}
				pop @list;
			}
			else 
				{$resStr = $resStr." ".$symbol;}
		}
		else
		{
			while( @list!=0 && (priority($symbol) <= priority($list[-1])) )
				{$resStr = $resStr." ".pop(@list);}
			push(@list, $symbol);
		}
	}
	while(@list!=0)
		{$resStr = $resStr." ".pop(@list);}
	return $resStr;
}

my($arg1,$arg2) = ($ARGV[0],$ARGV[1]);
output($arg1,$arg2);