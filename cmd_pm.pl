use strict;
use warnings;

use cmd;

cmd::ls;
cmd::dir 'C:\\';

sub main
{
	my(@args) = @_;
	open(my $FILE, ">", "system_log.log") 
		or die "Imposible to open system_log.log: $!";
	#push(@args, ">", $FILE);
	system(@args) > "$FILE";# or die "$!>$FILE";
	# > $FILE or die "$! > $FILE
	#print FILE $result;
}

main(@ARGV);