#!/usr/bin/perl -w
use strict;
use warnings;

my @list = ();
push(@list, 10,1,2,3);
#print @list[-1];
#print @list;

sub why_not
{
	my($arg1, $arg2) = @_;
	#my @array = split(/(\d+)|((\d+)\.?(\d*))/, $arg1);
	#my @array = $arg1 =~ /(\d+)|((\d+)\.?(\d*))/g;
	#my @array = $arg1 =~/([\d\.]+) | \Q \-\*\/\(\) \E /g;
	#my @array = $arg1 =~ m{ (\d+[.]?\d*) | ([-/*,()+]) }gx;

	#print $arg2;
=pod
	#foreach our $symbol (@array)
	{
	#	print $symbol;
	#	print "\n";
	}
	print ord('(');
	print ord(')');
	print ord('[');
	print ord(']');
	print ord('{');
	print ord('}');
	print ord('<');
	print ord('>');

	#my $str = '<a href="mailto:foo@mail.com">foo</a>';
	#print $str;
	#my @array = split(/[,.\s]+/, $str);
	my $str = "fd-!#$%&'*+—/=?^`{|}~.e.r dhfhj j..f";
	my $username = "[0-9a-z-!#$%&'*+—/=?^`{|}~]+(\.[0-9a-z-!#$%&'*+—/=?^`{|}~]+)*";
	#my $component = "[0-9a-z]([0-9a-z-]{0..61}[0-9a-z])?\.";
	#my $top_level_domain = "[0-9a-z-]{2,}";
	#my $hostname = $component.$top_level_domain;
	my $hostname = "([0-9a-z]([0-9a-z-]{0..61}[0-9a-z])?\.)*(([a-z]{2,})|(xn--[0-9a-z]+)|xn--vermgensberater-ctb|xn--vermgensberatung-pwb)";
	#my @array = $str =~  s{'(<a href="mailto:)|(">)|(</a>)'}gx;
	#my @array = $str =~  m{ (:$username\@$hostname)|(>$username) }gx;
	my @array = $str =~  m{[-a-z0-9!#$%&'*+/=?^_`{|}~]+(\.[-a-z0-9!#$%&'*+/=?^_`{|}~]+)*}gx;
	#my @array = $str =~ m{ (\d+[.]?\d*) | ([-/*,()+]) }gx;
	@array = map {$_} grep{$_ ne ""} @array;
	foreach our $symbol (@array)
	{
		print $symbol;
		print "\n";
	}
=cut
	print 'Введите, сумму в рублях: ';
	my $s = <>;
	print 'Результат ввода: ' . $s;
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