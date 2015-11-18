use 'C:\perl\Strawberry\programs::Class';

my $class = 'Class';
my $obj = Class->new; #-вызов стат метода класса
my $obj = $class->new;#-альтернатива


print $obj;
my $method = 'x';
$obj->$method;
$obj->x;

$obj->yy #сгенерировать исключение
eval {$obj->yy};
if($@) 
{
	warn $@;
}
my $obj = Class->new;

print $obj->{a};#можно но нехорошо

#посмотреть модули Moose, Moo, Mojo::Base, Class::Attribute

=pod
	ДЗ: написать класс матрицы
	
	use Matrix;
	my $ml = Matrix->new() - конструктор с проверкой корректности подаваемой инфы
	print $ml - печатать
	print $m2 * $ml - умножение
	
	eval 
	{
		... - обработка исключений try
		1; - позволяет вернуться
	};
	if($@) {...} - обработка исключений catch некорректный вариант если $@ обнулена деструктором
	or do {...} - более правильно
=cut