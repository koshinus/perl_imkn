use strict;
use warnings;
use File::Find;

=pod
	Формат входного файла: 
		в первой строке полный путь до целевой папки
		в следующих строках - полный путь до копируемых папок
=cut

our $symbol = "\/";
if($^O ne "linux")
{
	$symbol = '\\';
}

sub main($$)
{
	#copy_file($_[0], $_[1]);
	#print "$^O\n";
	#print $symbol;
	our @DIRLIST = file_parser($_[0]);
	chop @DIRLIST;
	our $target_dir = $DIRLIST[0];
	#print $target_dir;
	#print @DIRLIST;
	@DIRLIST = @DIRLIST[ 1 .. $#DIRLIST ];
	#print -e $target_dir;
	#chop $target_dir;
	opendir (my $out_d, $target_dir) || die "Impossi, bro: $!";
	if(-e "old" && -d "old")
	{
		rem_dir_recur($target_dir.$symbol."old");
		mkdir "old";
		$target_dir = $target_dir.$symbol."old";
	}
	else
	{
		mkdir "new";
		$target_dir = $target_dir.$symbol."new";
	}
	#find(\&copy_dir_recur, @DIRLIST);
	foreach our $direc (@DIRLIST)
	{
		copy_dir_recur($direc, $target_dir)
	}
	closedir($out_d);
}

sub rem_dir_recur
{
	my ($dir) = @_;
	opendir(my $DIR, $dir) or die "Impossi, bro: $!";
	while(my $fname = readdir $DIR) 
	{
		if(-f $fname) 
		{
			unlink $fname;
		}
		elsif(-d $fname)
		{
			my $new_path = $dir.$symbol."$fname";
			rem_dir_recur($new_path);
			rmdir $new_path;
		}
	}
	closedir($DIR);
}

sub copy_dir_recur 
{
	my ($cur_dir, $target_dir) = @_;
	opendir(my $CUR_DIR, $cur_dir) or die "Impossi, bro: $!";
	opendir(my $TARG_DIR, $target_dir) or die "Impossi, bro: $!";
	while(my $fname = readdir $CUR_DIR) 
	{
		if(-f $fname) 
		{
			copy_file($fname, $target_dir.$symbol."$fname");
		}
		elsif(-d $fname)
		{
			my $new_path = $cur_dir.$symbol."$fname";
			my $new_target_dir = $target_dir.$symbol."$fname";
			copy_dir_recur($new_path, $new_target_dir);
		}
	}
	closedir($TARG_DIR);
	closedir($CUR_DIR);
}

sub file_parser
{
	my ($file) = @_;
	open(in_file, "< $file") or die "Impossi, bro: $!";
	my @LIST = <in_file>;
	close(in_file);
	return @LIST;
}

sub copy_file
{
	my ($file1, $file2) = @_;
	open(in_file, "< $file1") or die "Impossi, bro: $!";
	binmode(in_file);
	open(out_file,"> $file2") or die "Impossi, bro: $!";
	binmode(out_file);
	our $buf;
	while(read(in_file, $buf, 1024))
    {
		print out_file $buf;
    }
	close in_file;
	close out_file;
}

my($arg1,$arg2) = ($ARGV[0],$ARGV[1]);
main($arg1,$arg2);