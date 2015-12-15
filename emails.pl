use strict;
#use warnings;

sub main($$)
{
	emails_check($_[0]);
}

sub emails_check
{
	my ($file) = @_;
	open FILE, $file
		or die "Failed to open $file: $!\n";
=pod
	our $username = "[0-9a-z-!#$%&'*+—/=?^`{|}~]+(\.[0-9a-z-!#$%&'*+—/=?^`{|}~]+)*";
	our $hostname = "([0-9a-z]([0-9a-z-]{0..61}[0-9a-z])?\.)*(([a-z]{2,})|(xn--[0-9a-z]+)|xn--vermgensberater-ctb|xn--vermgensberatung-pwb)";
	while(our $line = <FILE>)
	{
		@pair = $line ~= m{($username\@$hostname) | ($hostname)}gx;
		$hash{$pair[0]} = $pair[1];
	}
=cut
	while(my $line = <FILE>)
	{
		if($line =~ /mailto:(\w+\@\w+\.\w+)\">(\w+)</)
		{
			print "$1->$2\n";
		}
	}
}

my($arg1,$arg2) = ($ARGV[0],$ARGV[1]);
main($arg1,$arg2);