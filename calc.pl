use warnings;
use strict;

sub output($$)
{
	eval($_[0]);
	if($@)
	{
		print $@;
	}
	else
	{
		print rev_pol_not($_[0]);
		print "\n";
		print calc_rev_pol(rev_pol_not($_[0]));
	}
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

sub bracket
{
	my ($bracket) = @_;
	if($bracket eq "(") 		{return ")";}
	elsif ($bracket eq "[") 	{return "]";}
	elsif ($bracket eq "{") 	{return "}";}
	elsif ($bracket eq "<") 	{return ">";}
}

sub brackets_balance
{
	my ($str) = @_;
	my @arr = split(//,$str);
	my @brackets = ();
	my @position = ();
	my $i = 0;
	foreach our $symbol(@arr)
	{
		if($symbol eq "(" || $symbol eq "[" || $symbol eq "{" || $symbol eq "<")
		{
			push(@brackets, $symbol);
			push(@position, $i);
		}
		elsif($symbol eq ")" || $symbol eq "]" || $symbol eq "}" || $symbol eq ">")
		{
			if(@brackets != 0)
			{
				if(bracket($symbol) eq $brackets[-1])
				{
					pop(@brackets);
					pop(@position);
				}
				else
				{
					return "Error in ".pop(@position)." position: closing bracket is not right!";
				}
			}
			else
			{
				return "Error in ".$i." position: closing brackets are more than opening!";
			}
		}
	$i++;
	}
	return "All brackets are placed correctly.";
}

sub calc_rev_pol
{
	my ($str) = @_;
	my @arr = $str =~ m{ (\d+[.]?\d*) | ([-/*,()+]) }gx;
	my @arr = reverse(@arr);
	my @stack = ();
	while(@arr != 0)
	{
		my $elem = pop @arr;
		#print "\n".$elem;
		if($elem eq "+" || $elem eq "-" || $elem eq "*" || $elem eq "/")
		{
			#print "__1";
			my $first = pop(@stack);
			my $second = pop(@stack);
			push(@stack, eval($second.$elem.$first));
		}
		elsif($elem eq "")
		{
			#print "__2";
		}
		else 
		{
			#print "__3";
			push(@stack, $elem);
		}
	}
	return pop(@stack);
}

my($arg1,$arg2) = ($ARGV[0],$ARGV[1]);
output($arg1,$arg2);