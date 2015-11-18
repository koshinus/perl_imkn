package Class;

use overload '""' => \&to_string; #- перегрузка оператора ""
use overload '""' => sub { 'Class!' }, '+' => \&add;
use Class::Base;# или use parent 'Class::Base'

sub DESTROY {} #деструктор
#Hash::Util::FieldHash - если нужна инкапсульция 

#tie - позволяет скрытно писать инфу
sub add
{
	my ($self, $arg, undef) = @_;# undef для доп инфы (унарный оператор или нет и т.п.)
	
	$self->{a} += $arg;
}

MyCollection->new($o1, $o2, $o3); #package MyCollection;
sub new
{
	my ($class, @args) = @_;
	
	map{$_->can('to_string') or die "..."} @args;# нет шаблонов можно проверять удовлетворяет ли класс определенным требованиям
}
#use mro;

our @ISA = ();#спсиок родителей класса
@ISA = ('Class::Base', 'Class::Base2');

sub y
{
	my $self = shift;
	
	$self->SUPER::y();
	print 'Class::y()';
}
sub new
{
	my $class = shift;
	
	my $self = {a => 4};
	bless($self, $class);
	
	#use Scalar::Util 'blessed';
	#blessed(13); => undef
	#blessed($self); => Class
	
	return $self;
}

sub x
{
	my $self = shift;
	
	print $self->{a};
}

sub ax
{
	my $self = shift @_;
	
	$self->{ax} = shift if @_ == 1;
	
	return $self->{ax};
}
1;