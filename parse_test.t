use Test::More;
use module;
ok 1 == 1, 'test 1';#это ассерт
#ok $a, 'test 2';
$a = 'test2';
#is $a, 'test', 'test 2';#сравнивает две строки
like $a, qr/^t/, 'test 2';
is module::parse('Test line!'), ('Test', 'line!');
#is_deeply - посмотреть потом функцию
done_testing;
=pod
	Интеграция с другими языками, модуль XS:
	Inline::C/Java/Python/Asm
	C::Blocks
=cut