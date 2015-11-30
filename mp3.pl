use strict;
use warnings;

sub main($$)
{
	id3v1_extract($_[0]);
	print "\nWrite what do you want to change in this form: ";
	print "Album/Year/Genre/etc-\"your change\"";
	my $str = <STDIN>;
	#print "You write ".$str;
	print "\n\n";
	id3v1_rewrite($_[0],$str);
}

sub id3v1_extract
{
	my ($file) = @_;
	open(IN, '<', $file) or die "Can't open file $file, $!";
	binmode(IN);
	my $buf;
	seek(IN, -128, 2);
	read(IN, $buf, 128);
	if($buf =~ 'TAG')
	{
		print 'Song title:'.substr($buf, 3, 30);
		print 'Artist:'.substr($buf, 33, 30);
		print 'Album:'.substr($buf, 63, 30);
		print 'Year:'.substr($buf, 93, 4);
		print 'Comment:'.substr($buf, 97, 30);
		print 'Genre:'.substr($buf, 127, 1);
	}
	else
	{
		print 'There is no metadata';
	}
	close(IN);
}

sub id3v1_rewrite
{
	my ($file, $str) = @_;
	open(IN, '<', $file) or die "Can't read old file: $!";
	binmode(IN);
	open(OUT, '>', "new_".$file) or die "Can't write new file: $!";
	binmode(OUT);
	our $buf;
	my $cur_pos = 0;
	my $file_size = -s $file;
	while($file_size - $cur_pos > 1024)
    {
		read(IN, $buf, 1024);
		print OUT $buf;
		$cur_pos+=1024;
    }
	read(IN, $buf, $file_size - $cur_pos - 125);
	print OUT $buf;
	read(IN, $buf, 125);
	our @array = split(/-/, $str);
	$array[1] = substr($array[1], 0, length($array[1]) - 1);
	if($array[0] eq 'Song title')
	{
		$buf = make_buf($buf, $array[1], 30, 0, 30);
	}
	elsif($array[0] eq 'Artist')
	{
		$buf = make_buf($buf, $array[1], 30, 30, 60);
	}
	elsif($array[0] eq 'Album')
	{
		$buf = make_buf($buf, $array[1], 30, 60, 90);
	}
	elsif($array[0] eq 'Year')
	{
		$buf = make_buf($buf, $array[1], 4, 90, 94);
	}
	elsif($array[0] eq 'Comment')
	{
		$buf = make_buf($buf, $array[1], 30, 94, 124);
	}
	elsif($array[0] eq 'Genre')
	{
		$buf = make_buf($buf, $array[1], 1, 124, 125);
	}
	print OUT $buf;
	close(OUT);
	close(IN);
	id3v1_extract("new_".$file);
}

sub make_buf
{
	my ($buf, $str, $len, $left, $right) = @_;
	my $arr_len = length($str);
	if($arr_len > $len)
	{
		$buf = substr($buf, 0, $left).substr($str, 0, $len).substr($buf, $right);
	}
	else
	{
		$buf = substr($buf, 0, $left).$str." "x($len-$arr_len).substr($buf, $right);
	}
	return $buf;
}

my($arg1,$arg2) = ($ARGV[0],$ARGV[1]);
main($arg1,$arg2);