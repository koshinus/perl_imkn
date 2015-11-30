package module;
=pod
	Модульные тесты
=cut

sub parse
{
	my $line = shift;
	return split(/ /, $line);
}

1;