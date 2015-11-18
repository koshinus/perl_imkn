#!/usr/bin/perl
# your code goes here

my $line = 'href="mailto:sdfsd@sdhf.ru">sdfsd</a>';
#$line =~ /mailto:(\w+\@\w+.\w+)\">([^<]+)/;
$line =~ /mailto:(\w+\@\w+.\w+)\">(\w+)</;

#print "$1 => $2";
sub func
{
	my $mat = shift;
	print $mat;
	print "\n";
	my @matr = @$mat;
	print \@matr;
	#print $#matr+1;
	#print $#{$matr[0]}+1;
	#$matr[0][0] = 9;
	#print (($mat)->[0])[0];
}
my @matr = ([1,2,3], [4,5,6], [7,8,9]);
func(\@matr);
__END__
print $#matr+1;
print "\n";
my $sone = $matr[0];
my @some = @$sone;
print $#{$matr[0]}+1;
print "\n";
print $matr->[0];
foreach $row (0..@matr-1)
{
	foreach $column (0..@{$matr[$row]}-1)
	{
		print "Element [$row][$column] = $matr[$row][$column]";
		print "\n";
	}
}
foreach my $line (@matr)
{
	foreach my $elem (@$line)
	{
		print $elem;
		print " ";
	}
	print "\n";
}

our $username = "[0-9a-z-!#$%&'*+—/=?^`{|}~]+(\.[0-9a-z-!#$%&'*+—/=?^`{|}~]+)*";
our $hostname = "([0-9a-z]([0-9a-z-]{0..61}[0-9a-z])?\.)*(([a-z]{2,})|(xn--[0-9a-z]+)|xn--vermgensberater-ctb|xn--vermgensberatung-pwb)";
my @pair = $line =~ m{($username\@$hostname) | ($hostname)}gx;
print @pair;