package Class::Base;

sub new
{
	bless{}, shift;
}

sub y
{
	my $self = shift;
	
	print 'Class::Base::y();'
}

sub table#������ ����� �����������
{
	die 'Must be redefined in base class!';
}