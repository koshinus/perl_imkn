use Time::HiRes qw(gettimeofday tv_interval);
use Test::More;
use perl_calc;
use c_calc;

$start_time_c = [ gettimeofday ];
$c_calc = c_calc::calc_pi();
$end_time_c = [ gettimeofday ];
$elapsed_c = tv_interval($start_time_c,$end_time_c);

$start_time_perl = [ gettimeofday ];
$perl_calc = perl_calc::calc_pi();
$end_time_perl = [ gettimeofday ];
$elapsed_perl = tv_interval($start_time_perl,$end_time_perl);

$differences = abs($elapsed_perl - $elapsed_c);

if(ok(abs($c_calc - $perl_calc) < 0.00000001, "Pi number calc"))
{
	print "C computation time = $elapsed_c\n";
	print "Perl computation time = $elapsed_perl\n";
	print "Differences = $differences\n";
}

done_testing;
