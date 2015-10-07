#!/usr/bin/perl -w
use strict;

my @list = ();
push(@list, 10, 1,2, 3);
#print @list[-1];
#print @list;

sub why_not
{
	my($arg1, $arg2) = @_;
	#my @array = split(/(\d+)|((\d+)\.?(\d*))/, $arg1);
	#my @array = $arg1 =~ /(\d+)|((\d+)\.?(\d*))/g;
	#my @array = $arg1 =~/([\d\.]+) | \Q \-\*\/\(\) \E /g;
	my @array = $arg1 =~ m{ (\d+[.]?\d*) | ([-/*,()+]) }gx;

	print $arg2;
	foreach our $symbol (@array)
	{
		print $symbol;
		print "\n";
	}
}

why_not($ARGV[0],$ARGV[1]);

sub sum
{
	my($arg1, $arg2) = @_;
	return $arg1 + $arg2;
}

sub subt
{
	my($arg1, $arg2) = @_;
	return $arg1 - $arg2;
}

sub mult
{
	my($arg1, $arg2) = @_;
	return $arg1 * $arg2;
}

sub div
{
	my($arg1, $arg2) = @_;
	return $arg1 / $arg2;
}