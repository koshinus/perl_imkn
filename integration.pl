#use Inline C;

$n = 50000000;

my $s = func($n);
#my $s = opt($n);

print $s;

sub func
{
	my $n = shift;
	my $s = 0;
	$s += 1/$_ for 1 .. $n;
}

__END__
__C__
ДЗ: найти код в запакованном PAR::Packer - поставят плюсик
Optest - поставить два модуля, там функции с одинаковым названием (pp.pm & IC.pm (pure perl, InlineC) - для примера)
написать модуль tester - который запускает функцию из обоих модулей и сравнивает результаты, если совпадают результаты 
смотрит время
Rperl - несложный перл-код переводит в си
use Win32::API; - если нужна функция на си в перле
double opt(int n)
{
	double s = 0;
	int i;
	for(i = 1; i <= n; i++)
		s+= 1.0/i;
	return s;
}