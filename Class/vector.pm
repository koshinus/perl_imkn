package Vector;

sub new
{
	my ($class, @args) =@_;
	
	my @files;
	for(@args)
	{
		open my $f, '<', $_ or die "ds";
		push @files, $f;
		push @files, $f;
	}
	my $self = \@args;
	return bless($self, $class);
}

sub say
{
	my ($self, @line) = @_;
	
	$_->print($line) for @$self;
}
sub DESTROY
{
	close $_ for @{shift()}
}